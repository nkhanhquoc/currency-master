<?php

namespace backend\models;

use Yii;
use common\models\UserBase;
use yii\base\NotSupportedException;
use yii\behaviors\TimestampBehavior;
use yii\web\IdentityInterface;

class User extends UserBase implements IdentityInterface {

    const STATUS_DELETED = 0;
    const STATUS_ACTIVE = 1;

    public $re_password;
    public $password_old;

    /**
     * @inheritdoc
     */
    public function behaviors() {
        return [
            TimestampBehavior::className(),
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules() {
        return [
            [['username', 'password_hash', 'email'], 'required'],
            [['status', 'created_at', 'updated_at'], 'integer'],
            [['username', 'password_hash', 'password_reset_token', 'email'], 'string', 'max' => 255],
            [['auth_key'], 'string', 'max' => 32],
            ['status', 'default', 'value' => self::STATUS_ACTIVE],
            ['status', 'in', 'range' => [self::STATUS_ACTIVE, self::STATUS_DELETED]],
            [['email'], 'email'],
            [['username', 'email'], 'unique'],
            [['re_password'], 'compare', 'compareAttribute' => 'password_hash', 'message' => Yii::t('backend', 'Mật khẩu gõ lại chưa đúng')],
            [['password_hash'], 'match', 'pattern' => '((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})',
                'message' => Yii::t('backend', 'Mật khẩu phải từ 6-20 ký tự và bao gồm chữ thường, chữ HOA, số và ký tự đặc biệt')],
        ];
    }

    /**
     * @return array
     */
    public function attributeLabels() {
        return [
            'id' => Yii::t('backend', '#'),
            'username' => Yii::t('backend', 'Username'),
            'auth_key' => Yii::t('backend', 'Auth Key'),
            'password_hash' => Yii::t('backend', 'Password Hash'),
            're_password' => Yii::t('backend', 'Retype password'),
            'password_reset_token' => Yii::t('backend', 'Password Reset Token'),
            'email' => Yii::t('backend', 'Email'),
            'status' => Yii::t('backend', 'Status'),
            'created_at' => Yii::t('backend', 'Created At'),
            'updated_at' => Yii::t('backend', 'Updated At'),
            'password_old' => Yii::t('backend', 'Mật khẩu cũ'),
        ];
    }

    /**
     * @return bool
     */
    public function beforeSave($insert = true) {
        if ($this->password_hash) {
            $this->setPassword($this->password_hash);
            $this->generateAuthKey();
            $this->generatePasswordResetToken();
        }
        if (!$this->isNewRecord) {
            $insert = false;
        }

        return parent::beforeSave($insert);
    }

    /**
     * @inheritdoc
     */
    public static function findIdentity($id) {
        return static::findOne(['id' => $id, 'status' => self::STATUS_ACTIVE]);
    }

    /**
     * @inheritdoc
     */
    public static function findIdentityByAccessToken($token, $type = null) {
        throw new NotSupportedException('"findIdentityByAccessToken" is not implemented.');
    }

    /**
     * Finds user by username
     *
     * @param string $username
     * @return static|null
     */
    public static function findByUsername($username) {
        return static::findOne(['username' => $username, 'status' => self::STATUS_ACTIVE]);
    }

    /**
     * Finds user by token
     *
     * @param string $token
     * @return static|null
     */
    public static function findByToken($token) {
        return static::findOne(['password_reset_token' => $token, 'status' => self::STATUS_ACTIVE]);
    }

    /**
     * Finds user by password reset token
     *
     * @param string $token password reset token
     * @return static|null
     */
    public static function findByPasswordResetToken($token) {
        if (!static::isPasswordResetTokenValid($token)) {
            return null;
        }

        return static::findOne([
            'password_reset_token' => $token,
            'status' => self::STATUS_ACTIVE,
        ]);
    }

    /**
     * Finds out if password reset token is valid
     *
     * @param string $token password reset token
     * @return boolean
     */
    public static function isPasswordResetTokenValid($token) {
        if (empty($token)) {
            return false;
        }

        $timestamp = (int) substr($token, strrpos($token, '_') + 1);
        $expire = Yii::$app->params['user.passwordResetTokenExpire'];
        return $timestamp + $expire >= time();
    }

    public static function getUserId() {
        $user = Yii::$app->get('user', false);
        return $user && !$user->isGuest ? $user->id : null;
    }

    /**
     * @inheritdoc
     */
    public function getId() {
        return $this->getPrimaryKey();
    }

    /**
     * @inheritdoc
     */
    public function getAuthKey() {
        return $this->auth_key;
    }

    /**
     * @inheritdoc
     */
    public function validateAuthKey($authKey) {
        return $this->getAuthKey() === $authKey;
    }

    /**
     * Validates password
     *
     * @param string $password password to validate
     * @return boolean if password provided is valid for current user
     */
    public function validatePassword($password) {
        return Yii::$app->security->validatePassword($password, $this->password_hash);
    }

    /**
     * Generates password hash from password and sets it to the model
     *
     * @param string $password
     */
    public function setPassword($password) {
        $this->password_hash = Yii::$app->security->generatePasswordHash($password);
    }

    /**
     * Generates "remember me" authentication key
     */
    public function generateAuthKey() {
        $this->auth_key = Yii::$app->security->generateRandomString();
    }

    /**
     * Generates new password reset token
     */
    public function generatePasswordResetToken() {
        $this->password_reset_token = Yii::$app->security->generateRandomString() . '_' . time();
    }

    /**
     * Removes password reset token
     */
    public function removePasswordResetToken() {
        $this->password_reset_token = null;
    }
}
