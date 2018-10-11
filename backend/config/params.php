<?php
return [
    'adminEmail' => 'admin@example.com',
    'page_sizes' => 20,
    'delimiter' => '#',
    'upload_dir' =>[
        'pet' => '/upload/images/pet'
    ],
    'upload' => [
        'basePath' => 'E:\Duan\VTT_VAS_171001_Groupon\SOURCE\CMS\backend\web\uploads\\',
        'baseUrl' => 'http://192.168.146.89:8000/uploads',
        'product' => [
            'basePath' => '/media1/images/product',
            'extensions' => ['gif', 'jpg', 'png'],
            'maxSize' => 100 * 1024 * 1024, //file size
            'size' => [
                'width' => 100,
                'height' => 100,
            ]
        ],
        'attribute-image' => [
            'basePath' => '/media1/images/attribute',
            'extensions' => ['gif', 'jpg', 'jpeg', 'png'],
            'maxSize' => 100 * 1024 * 1024, //file size
        ],
    ],
    'login-failed' => [
        "limit_username" => 5,
        "limit_username_duration" => 10 * 60,
        "locked_username_duration" => 10 * 60,
        "limit_ip" => 20,
        "limit_ip_duration" => 20 * 60,
        "locked_ip_duration" => 20 * 60,
    ],
    'get-ip-method' => 'REMOTE_ADDR', // REMOTE_ADDR | HTTP_X_FORWARDED_FOR
    'menu-icon' => [
        "icon-user-female", "icon-user-follow", "icon-user-following", "icon-user-unfollow", "icon-trophy",
        "icon-screen-smartphone", "icon-screen-desktop", "icon-plane", "icon-notebook", "icon-moustache",
        "icon-mouse", "icon-magnet", "icon-energy", "icon-emoticon-smile", "icon-disc", "icon-cursor-move",
        "icon-crop", "icon-credit-card", "icon-chemistry", "icon-user", "icon-speedometer", "icon-social-youtube",
        "icon-social-twitter", "icon-social-tumblr", "icon-social-facebook", "icon-social-dropbox",
        "icon-social-dribbble", "icon-shield", "icon-screen-tablet", "icon-magic-wand", "icon-hourglass",
        "icon-graduation", "icon-ghost", "icon-game-controller", "icon-fire", "icon-eyeglasses", "icon-envelope-open",
        "icon-envelope-letter", "icon-bell", "icon-badge", "icon-anchor", "icon-wallet", "icon-vector",
        "icon-speech", "icon-puzzle", "icon-printer", "icon-present", "icon-playlist", "icon-pin", "icon-picture",
        "icon-map", "icon-layers", "icon-handbag", "icon-globe-alt", "icon-globe", "icon-frame", "icon-folder-alt",
        "icon-film", "icon-feed", "icon-earphones-alt", "icon-earphones", "icon-drop", "icon-drawer", "icon-docs",
        "icon-directions", "icon-direction", "icon-diamond", "icon-cup", "icon-compass", "icon-call-out",
        "icon-call-in", "icon-call-end", "icon-calculator", "icon-bubbles", "icon-briefcase", "icon-book-open",
        "icon-basket-loaded", "icon-basket", "icon-bag", "icon-action-undo", "icon-action-redo", "icon-wrench",
        "icon-umbrella", "icon-trash", "icon-tag", "icon-support", "icon-size-fullscreen", "icon-size-actual",
        "icon-shuffle", "icon-share-alt", "icon-share", "icon-rocket", "icon-question", "icon-pie-chart",
        "icon-pencil", "icon-note", "icon-music-tone-alt", "icon-music-tone", "icon-microphone", "icon-loop",
        "icon-logout", "icon-login", "icon-list", "icon-like", "icon-home", "icon-grid", "icon-graph",
        "icon-equalizer", "icon-dislike", "icon-cursor", "icon-control-start", "icon-control-rewind",
        "icon-control-play", "icon-control-pause", "icon-control-forward", "icon-control-end", "icon-calendar",
        "icon-bulb", "icon-bar-chart", "icon-arrow-up", "icon-arrow-right", "icon-arrow-left", "icon-arrow-down",
        "icon-ban", "icon-bubble", "icon-camcorder", "icon-camera", "icon-check", "icon-clock", "icon-close",
        "icon-cloud-download", "icon-cloud-upload", "icon-doc", "icon-envelope", "icon-eye", "icon-flag",
        "icon-folder", "icon-heart", "icon-info", "icon-key", "icon-link", "icon-lock", "icon-lock-open",
        "icon-magnifier", "icon-magnifier-add", "icon-magnifier-remove", "icon-paper-clip", "icon-paper-plane",
        "icon-plus", "icon-pointer", "icon-power", "icon-refresh", "icon-reload", "icon-settings", "icon-star",
        "icon-symbol-female", "icon-symbol-male", "icon-target", "icon-volume-1", "icon-volume-2", "icon-volume-off",
        "icon-users"],
      'transaction_type'=> [
        '1' => 'Mua',
        '2' => 'Bán',
        '3' => 'Nhận tiền chuyển',
        '4' => 'Trả tiền chuyển',
        '5' => 'Vay',
        '6' => 'Cho vay',
        '7' => 'Trả ngoại tệ',
        '8' => 'Lấy ngoại tệ',
        '9' => 'Trả Tiền',
        '10' => 'Nhận Tiền',
        '11' => 'Đặt cọc',
        '12' => 'Khách CK',
        '13' => 'Cửa hàng CK',
        '14' => 'Trả Feedback',
        '15' => 'Nhận Feedback',
        '16' => 'Rút tiền',
        '17' => 'Nạp tiền'
      ],
      'bill_type' => [
        '1'=>'Hóa đơn giao ngay',
        '2'=>'Hóa đơn chốt',
        '3'=>'Hóa đơn dài hạn',
        '4'=>'Chuyển tiền',
        '5'=>'Hóa đơn vay mượn',
        '6'=>'Tiền chuyển khác',
        '7'=>'Tiền chuyển quê',
        '8'=>'Mua bán quê',
        '9'=>'Chuyển khoản quê',
        '10' => 'Giao dịch Ngân hàng'
      ]
];
