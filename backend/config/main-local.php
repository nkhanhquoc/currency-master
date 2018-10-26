<?php

	$config = [
		'components' => [
			'request' => [
				// !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
				'cookieValidationKey' => 'DZnFIqRqR_rNaHklKJ1A8XRbzGQ2QL0R',
			],
			'view' => [
				'renderers' => [
					'twig' => [
						'class' => 'yii\twig\ViewRenderer',
						// set cachePath to false in order to disable template caching
						'cachePath' => '@runtime/Twig/cache',
						// Array of twig options:
						'options' => [
							'auto_reload' => true,
						],
					// ... see ViewRenderer for more options
					],
				],
			],
		],
	];

	if (!YII_ENV_PROD) {
	  // configuration adjustments for 'dev' environment
	  $config['bootstrap'][] = 'debug';
	  $config['modules']['debug'] = [
		  'class' => 'yii\debug\Module',
		  'allowedIPs' => ['127.0.0.1', '::1', '192.168.*.*', '10.61.195.143'] // adjust this to your needs
	  ];

	  $config['bootstrap'][] = 'gii';
	  $config['modules']['gii'] = [
		  'class' => 'yii\gii\Module',
          'allowedIPs' => ['127.0.0.1', '::1', '192.168.0.*', '192.168.146.93'],
          'generators' => [ //here
              'crud' => [ // generator name
                  'class' => 'yii\gii\generators\crud\Generator', // generator class
                  'templates' => [ //setting for out templates
                      'lel' => '@app/gii-generators/crud/ndt', // template name => path to template
                  ]
              ]
          ],
	  ];
	}

	return $config;
