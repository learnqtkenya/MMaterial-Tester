pragma Singleton

import QtQuick

QtObject{
    id: _root

    readonly property IconSet heavy: IconSet {
        id: _heavyRoot

        readonly property string iconBasePath: Qt.resolvedUrl("./assets/svg/")

        logo: IconData { path: _heavyRoot.iconBasePath + "logo.svg"; type: IconData.Heavy }
        accountBalance: IconData { path: _heavyRoot.iconBasePath + "account_balance.svg"; type: IconData.Heavy }
        accountBox: IconData { path: _heavyRoot.iconBasePath + "account_box.svg"; type: IconData.Heavy }
        accountCircle: IconData { path: _heavyRoot.iconBasePath + "account_circle.svg"; type: IconData.Heavy }
        adb: IconData { path: _heavyRoot.iconBasePath + "adb.svg"; type: IconData.Heavy }
        add: IconData { path: _heavyRoot.iconBasePath + "add.svg"; type: IconData.Heavy }
        addAPhoto: IconData { path: _heavyRoot.iconBasePath + "add_a_photo.svg"; type: IconData.Heavy }
        addBox: IconData { path: _heavyRoot.iconBasePath + "add_box.svg"; type: IconData.Heavy }
        addBusiness: IconData { path: _heavyRoot.iconBasePath + "add_business.svg"; type: IconData.Heavy }
        addCard: IconData { path: _heavyRoot.iconBasePath + "add_card.svg"; type: IconData.Heavy }
        addCircle: IconData { path: _heavyRoot.iconBasePath + "add_circle.svg"; type: IconData.Heavy }
        addPhotoAlternate: IconData { path: _heavyRoot.iconBasePath + "add_photo_alternate.svg"; type: IconData.Heavy }
        addShoppingCart: IconData { path: _heavyRoot.iconBasePath + "add_shopping_cart.svg"; type: IconData.Heavy }
        air: IconData { path: _heavyRoot.iconBasePath + "air.svg"; type: IconData.Heavy }
        alarm: IconData { path: _heavyRoot.iconBasePath + "alarm.svg"; type: IconData.Heavy }
        analytics: IconData { path: _heavyRoot.iconBasePath + "analytics.svg"; type: IconData.Heavy }
        android: IconData { path: _heavyRoot.iconBasePath + "android.svg"; type: IconData.Heavy }
        apps: IconData { path: _heavyRoot.iconBasePath + "apps.svg"; type: IconData.Heavy }
        arrowBack: IconData { path: _heavyRoot.iconBasePath + "arrow_back.svg"; type: IconData.Heavy }
        arrowDownward: IconData { path: _heavyRoot.iconBasePath + "arrow_downward.svg"; type: IconData.Heavy }
        arrowDropDown: IconData { path: _heavyRoot.iconBasePath + "arrow_drop_down.svg"; type: IconData.Heavy }
        arrowDropUp: IconData { path: _heavyRoot.iconBasePath + "arrow_drop_up.svg"; type: IconData.Heavy }
        arrowForward: IconData { path: _heavyRoot.iconBasePath + "arrow_forward.svg"; type: IconData.Heavy }
        arrowRight: IconData { path: _heavyRoot.iconBasePath + "arrow_right.svg"; type: IconData.Heavy }
        atr: IconData { path: _heavyRoot.iconBasePath + "atr.svg"; type: IconData.Heavy }
        attachMoney: IconData { path: _heavyRoot.iconBasePath + "attach_money.svg"; type: IconData.Heavy }
        autorenew: IconData { path: _heavyRoot.iconBasePath + "autorenew.svg"; type: IconData.Heavy }
        backspace: IconData { path: _heavyRoot.iconBasePath + "backspace.svg"; type: IconData.Heavy }
        badge: IconData { path: _heavyRoot.iconBasePath + "badge.svg"; type: IconData.Heavy }
        barChart: IconData { path: _heavyRoot.iconBasePath + "bar_chart.svg"; type: IconData.Heavy }
        barcodeScanner: IconData { path: _heavyRoot.iconBasePath + "barcode_scanner.svg"; type: IconData.Heavy }
        batteryChargingFull: IconData { path: _heavyRoot.iconBasePath + "battery_charging_full.svg"; type: IconData.Heavy }
        batteryFull: IconData { path: _heavyRoot.iconBasePath + "battery_full.svg"; type: IconData.Heavy }
        batteryFullAlt: IconData { path: _heavyRoot.iconBasePath + "battery_full_alt.svg"; type: IconData.Heavy }
        bluetooth: IconData { path: _heavyRoot.iconBasePath + "bluetooth.svg"; type: IconData.Heavy }
        bookmark: IconData { path: _heavyRoot.iconBasePath + "bookmark.svg"; type: IconData.Heavy }
        brush: IconData { path: _heavyRoot.iconBasePath + "brush.svg"; type: IconData.Heavy }
        build: IconData { path: _heavyRoot.iconBasePath + "build.svg"; type: IconData.Heavy }
        cable: IconData { path: _heavyRoot.iconBasePath + "cable.svg"; type: IconData.Heavy }
        cake: IconData { path: _heavyRoot.iconBasePath + "cake.svg"; type: IconData.Heavy }
        calculate: IconData { path: _heavyRoot.iconBasePath + "calculate.svg"; type: IconData.Heavy }
        calendarMonth: IconData { path: _heavyRoot.iconBasePath + "calendar_month.svg"; type: IconData.Heavy }
        calendarToday: IconData { path: _heavyRoot.iconBasePath + "calendar_today.svg"; type: IconData.Heavy }
        call: IconData { path: _heavyRoot.iconBasePath + "call.svg"; type: IconData.Heavy }
        camera: IconData { path: _heavyRoot.iconBasePath + "camera.svg"; type: IconData.Heavy }
        campaign: IconData { path: _heavyRoot.iconBasePath + "campaign.svg"; type: IconData.Heavy }
        cancel: IconData { path: _heavyRoot.iconBasePath + "cancel.svg"; type: IconData.Heavy }
        cast: IconData { path: _heavyRoot.iconBasePath + "cast.svg"; type: IconData.Heavy }
        category: IconData { path: _heavyRoot.iconBasePath + "category.svg"; type: IconData.Heavy }
        celebration: IconData { path: _heavyRoot.iconBasePath + "celebration.svg"; type: IconData.Heavy }
        chat: IconData { path: _heavyRoot.iconBasePath + "chat.svg"; type: IconData.Heavy }
        chatBubble: IconData { path: _heavyRoot.iconBasePath + "chat_bubble.svg"; type: IconData.Heavy }
        check: IconData { path: _heavyRoot.iconBasePath + "check.svg"; type: IconData.Heavy }
        checkBox: IconData { path: _heavyRoot.iconBasePath + "check_box.svg"; type: IconData.Heavy }
        checkBoxOutlineBlank: IconData { path: _heavyRoot.iconBasePath + "check_box_outline_blank.svg"; type: IconData.Heavy }
        checkCircle: IconData { path: _heavyRoot.iconBasePath + "check_circle.svg"; type: IconData.Heavy }
        chevronLeft: IconData { path: _heavyRoot.iconBasePath + "chevron_left.svg"; type: IconData.Heavy }
        chevronRight: IconData { path: _heavyRoot.iconBasePath + "chevron_right.svg"; type: IconData.Heavy }
        circle: IconData { path: _heavyRoot.iconBasePath + "circle.svg"; type: IconData.Heavy }
        close: IconData { path: _heavyRoot.iconBasePath + "close.svg"; type: IconData.Heavy }
        code: IconData { path: _heavyRoot.iconBasePath + "code.svg"; type: IconData.Heavy }
        computer: IconData { path: _heavyRoot.iconBasePath + "computer.svg"; type: IconData.Heavy }
        construction: IconData { path: _heavyRoot.iconBasePath + "construction.svg"; type: IconData.Heavy }
        contactSupport: IconData { path: _heavyRoot.iconBasePath + "contact_support.svg"; type: IconData.Heavy }
        contentCopy: IconData { path: _heavyRoot.iconBasePath + "content_copy.svg"; type: IconData.Heavy }
        creditCard: IconData { path: _heavyRoot.iconBasePath + "credit_card.svg"; type: IconData.Heavy }
        cropFree: IconData { path: _heavyRoot.iconBasePath + "crop_free.svg"; type: IconData.Heavy }
        currencyBitcoin: IconData { path: _heavyRoot.iconBasePath + "currency_bitcoin.svg"; type: IconData.Heavy }
        darkMode: IconData { path: _heavyRoot.iconBasePath + "dark_mode.svg"; type: IconData.Heavy }
        dashboard: IconData { path: _heavyRoot.iconBasePath + "dashboard.svg"; type: IconData.Heavy }
        database: IconData { path: _heavyRoot.iconBasePath + "database.svg"; type: IconData.Heavy }
        deleteElement: IconData { path: _heavyRoot.iconBasePath + "delete.svg"; type: IconData.Heavy }
        deleteForever: IconData { path: _heavyRoot.iconBasePath + "delete_forever.svg"; type: IconData.Heavy }
        description: IconData { path: _heavyRoot.iconBasePath + "description.svg"; type: IconData.Heavy }
        devices: IconData { path: _heavyRoot.iconBasePath + "devices.svg"; type: IconData.Heavy }
        directionsCar: IconData { path: _heavyRoot.iconBasePath + "directions_car.svg"; type: IconData.Heavy }
        domain: IconData { path: _heavyRoot.iconBasePath + "domain.svg"; type: IconData.Heavy }
        doneAll: IconData { path: _heavyRoot.iconBasePath + "done_all.svg"; type: IconData.Heavy }
        download: IconData { path: _heavyRoot.iconBasePath + "download.svg"; type: IconData.Heavy }
        downloadForOffline: IconData { path: _heavyRoot.iconBasePath + "download_for_offline.svg"; type: IconData.Heavy }
        draw: IconData { path: _heavyRoot.iconBasePath + "draw.svg"; type: IconData.Heavy }
        eco: IconData { path: _heavyRoot.iconBasePath + "eco.svg"; type: IconData.Heavy }
        edit: IconData { path: _heavyRoot.iconBasePath + "edit.svg"; type: IconData.Heavy }
        editNote: IconData { path: _heavyRoot.iconBasePath + "edit_note.svg"; type: IconData.Heavy }
        electricBolt: IconData { path: _heavyRoot.iconBasePath + "electric_bolt.svg"; type: IconData.Heavy }
        emojiObjects: IconData { path: _heavyRoot.iconBasePath + "emoji_objects.svg"; type: IconData.Heavy }
        engineering: IconData { path: _heavyRoot.iconBasePath + "engineering.svg"; type: IconData.Heavy }
        error: IconData { path: _heavyRoot.iconBasePath + "error.svg"; type: IconData.Heavy }
        euro: IconData { path: _heavyRoot.iconBasePath + "euro.svg"; type: IconData.Heavy }
        event: IconData { path: _heavyRoot.iconBasePath + "event.svg"; type: IconData.Heavy }
        explore: IconData { path: _heavyRoot.iconBasePath + "explore.svg"; type: IconData.Heavy }
        extension: IconData { path: _heavyRoot.iconBasePath + "extension.svg"; type: IconData.Heavy }
        familiarFaceAndZone: IconData { path: _heavyRoot.iconBasePath + "familiar_face_and_zone.svg"; type: IconData.Heavy }
        fastForward: IconData { path: _heavyRoot.iconBasePath + "fast_forward.svg"; type: IconData.Heavy }
        fastRewind: IconData { path: _heavyRoot.iconBasePath + "fast_rewind.svg"; type: IconData.Heavy }
        favorite: IconData { path: _heavyRoot.iconBasePath + "favorite.svg"; type: IconData.Heavy }
        fileCopy: IconData { path: _heavyRoot.iconBasePath + "file_copy.svg"; type: IconData.Heavy }
        filterAlt: IconData { path: _heavyRoot.iconBasePath + "filter_alt.svg"; type: IconData.Heavy }
        filterList: IconData { path: _heavyRoot.iconBasePath + "filter_list.svg"; type: IconData.Heavy }
        finance: IconData { path: _heavyRoot.iconBasePath + "finance.svg"; type: IconData.Heavy }
        fingerprint: IconData { path: _heavyRoot.iconBasePath + "fingerprint.svg"; type: IconData.Heavy }
        flag: IconData { path: _heavyRoot.iconBasePath + "flag.svg"; type: IconData.Heavy }
        flashOn: IconData { path: _heavyRoot.iconBasePath + "flash_on.svg"; type: IconData.Heavy }
        flashlightOn: IconData { path: _heavyRoot.iconBasePath + "flashlight_on.svg"; type: IconData.Heavy }
        flight: IconData { path: _heavyRoot.iconBasePath + "flight.svg"; type: IconData.Heavy }
        folder: IconData { path: _heavyRoot.iconBasePath + "folder.svg"; type: IconData.Heavy }
        folderOpen: IconData { path: _heavyRoot.iconBasePath + "folder_open.svg"; type: IconData.Heavy }
        forum: IconData { path: _heavyRoot.iconBasePath + "forum.svg"; type: IconData.Heavy }
        gridOn: IconData { path: _heavyRoot.iconBasePath + "grid_on.svg"; type: IconData.Heavy }
        gridView: IconData { path: _heavyRoot.iconBasePath + "grid_view.svg"; type: IconData.Heavy }
        group: IconData { path: _heavyRoot.iconBasePath + "group.svg"; type: IconData.Heavy }
        groupAdd: IconData { path: _heavyRoot.iconBasePath + "group_add.svg"; type: IconData.Heavy }
        groups: IconData { path: _heavyRoot.iconBasePath + "groups.svg"; type: IconData.Heavy }
        handyman: IconData { path: _heavyRoot.iconBasePath + "handyman.svg"; type: IconData.Heavy }
        headphones: IconData { path: _heavyRoot.iconBasePath + "headphones.svg"; type: IconData.Heavy }
        hearing: IconData { path: _heavyRoot.iconBasePath + "hearing.svg"; type: IconData.Heavy }
        help: IconData { path: _heavyRoot.iconBasePath + "help.svg"; type: IconData.Heavy }
        history: IconData { path: _heavyRoot.iconBasePath + "history.svg"; type: IconData.Heavy }
        home: IconData { path: _heavyRoot.iconBasePath + "home.svg"; type: IconData.Heavy }
        homePin: IconData { path: _heavyRoot.iconBasePath + "home_pin.svg"; type: IconData.Heavy }
        image: IconData { path: _heavyRoot.iconBasePath + "image.svg"; type: IconData.Heavy }
        imagesmode: IconData { path: _heavyRoot.iconBasePath + "imagesmode.svg"; type: IconData.Heavy }
        info: IconData { path: _heavyRoot.iconBasePath + "info.svg"; type: IconData.Heavy }
        inventory: IconData { path: _heavyRoot.iconBasePath + "inventory.svg"; type: IconData.Heavy }
        inventory2: IconData { path: _heavyRoot.iconBasePath + "inventory_2.svg"; type: IconData.Heavy }
        keyboardArrowDown: IconData { path: _heavyRoot.iconBasePath + "keyboard_arrow_down.svg"; type: IconData.Heavy }
        keyboardArrowLeft: IconData { path: _heavyRoot.iconBasePath + "keyboard_arrow_left.svg"; type: IconData.Heavy }
        keyboardArrowRight: IconData { path: _heavyRoot.iconBasePath + "keyboard_arrow_right.svg"; type: IconData.Heavy }
        keyboardArrowUp: IconData { path: _heavyRoot.iconBasePath + "keyboard_arrow_up.svg"; type: IconData.Heavy }
        label: IconData { path: _heavyRoot.iconBasePath + "label.svg"; type: IconData.Heavy }
        landscape: IconData { path: _heavyRoot.iconBasePath + "landscape.svg"; type: IconData.Heavy }
        language: IconData { path: _heavyRoot.iconBasePath + "language.svg"; type: IconData.Heavy }
        leaderboard: IconData { path: _heavyRoot.iconBasePath + "leaderboard.svg"; type: IconData.Heavy }
        lightMode: IconData { path: _heavyRoot.iconBasePath + "light_mode.svg"; type: IconData.Heavy }
        lightbulb: IconData { path: _heavyRoot.iconBasePath + "lightbulb.svg"; type: IconData.Heavy }
        link: IconData { path: _heavyRoot.iconBasePath + "link.svg"; type: IconData.Heavy }
        list: IconData { path: _heavyRoot.iconBasePath + "list.svg"; type: IconData.Heavy }
        localCafe: IconData { path: _heavyRoot.iconBasePath + "local_cafe.svg"; type: IconData.Heavy }
        localMall: IconData { path: _heavyRoot.iconBasePath + "local_mall.svg"; type: IconData.Heavy }
        locationOn: IconData { path: _heavyRoot.iconBasePath + "location_on.svg"; type: IconData.Heavy }
        lock: IconData { path: _heavyRoot.iconBasePath + "lock.svg"; type: IconData.Heavy }
        lockOpen: IconData { path: _heavyRoot.iconBasePath + "lock_open.svg"; type: IconData.Heavy }
        login: IconData { path: _heavyRoot.iconBasePath + "login.svg"; type: IconData.Heavy }
        logout: IconData { path: _heavyRoot.iconBasePath + "logout.svg"; type: IconData.Heavy }
        loyalty: IconData { path: _heavyRoot.iconBasePath + "loyalty.svg"; type: IconData.Heavy }
        mail: IconData { path: _heavyRoot.iconBasePath + "mail.svg"; type: IconData.Heavy }
        manageAccounts: IconData { path: _heavyRoot.iconBasePath + "manage_accounts.svg"; type: IconData.Heavy }
        map: IconData { path: _heavyRoot.iconBasePath + "map.svg"; type: IconData.Heavy }
        menu: IconData { path: _heavyRoot.iconBasePath + "menu.svg"; type: IconData.Heavy }
        mic: IconData { path: _heavyRoot.iconBasePath + "mic.svg"; type: IconData.Heavy }
        modeComment: IconData { path: _heavyRoot.iconBasePath + "mode_comment.svg"; type: IconData.Heavy }
        monitoring: IconData { path: _heavyRoot.iconBasePath + "monitoring.svg"; type: IconData.Heavy }
        moreHoriz: IconData { path: _heavyRoot.iconBasePath + "more_horiz.svg"; type: IconData.Heavy }
        moreVert: IconData { path: _heavyRoot.iconBasePath + "more_vert.svg"; type: IconData.Heavy }
        movie: IconData { path: _heavyRoot.iconBasePath + "movie.svg"; type: IconData.Heavy }
        musicNote: IconData { path: _heavyRoot.iconBasePath + "music_note.svg"; type: IconData.Heavy }
        myLocation: IconData { path: _heavyRoot.iconBasePath + "my_location.svg"; type: IconData.Heavy }
        navigation: IconData { path: _heavyRoot.iconBasePath + "navigation.svg"; type: IconData.Heavy }
        nearMe: IconData { path: _heavyRoot.iconBasePath + "near_me.svg"; type: IconData.Heavy }
        nestEcoLeaf: IconData { path: _heavyRoot.iconBasePath + "nest_eco_leaf.svg"; type: IconData.Heavy }
        nestRemoteComfortSensor: IconData { path: _heavyRoot.iconBasePath + "nest_remote_comfort_sensor.svg"; type: IconData.Heavy }
        nightlight: IconData { path: _heavyRoot.iconBasePath + "nightlight.svg"; type: IconData.Heavy }
        notifications: IconData { path: _heavyRoot.iconBasePath + "notifications.svg"; type: IconData.Heavy }
        openInNew: IconData { path: _heavyRoot.iconBasePath + "open_in_new.svg"; type: IconData.Heavy }
        paid: IconData { path: _heavyRoot.iconBasePath + "paid.svg"; type: IconData.Heavy }
        palette: IconData { path: _heavyRoot.iconBasePath + "palette.svg"; type: IconData.Heavy }
        pause: IconData { path: _heavyRoot.iconBasePath + "pause.svg"; type: IconData.Heavy }
        pauseCircle: IconData { path: _heavyRoot.iconBasePath + "pause_circle.svg"; type: IconData.Heavy }
        person: IconData { path: _heavyRoot.iconBasePath + "person.svg"; type: IconData.Heavy }
        personAdd: IconData { path: _heavyRoot.iconBasePath + "person_add.svg"; type: IconData.Heavy }
        personPin: IconData { path: _heavyRoot.iconBasePath + "person_pin.svg"; type: IconData.Heavy }
        pets: IconData { path: _heavyRoot.iconBasePath + "pets.svg"; type: IconData.Heavy }
        phoneIphone: IconData { path: _heavyRoot.iconBasePath + "phone_iphone.svg"; type: IconData.Heavy }
        photoCamera: IconData { path: _heavyRoot.iconBasePath + "photo_camera.svg"; type: IconData.Heavy }
        photoLibrary: IconData { path: _heavyRoot.iconBasePath + "photo_library.svg"; type: IconData.Heavy }
        pictureAsPdf: IconData { path: _heavyRoot.iconBasePath + "picture_as_pdf.svg"; type: IconData.Heavy }
        pinDrop: IconData { path: _heavyRoot.iconBasePath + "pin_drop.svg"; type: IconData.Heavy }
        playArrow: IconData { path: _heavyRoot.iconBasePath + "play_arrow.svg"; type: IconData.Heavy }
        playCircle: IconData { path: _heavyRoot.iconBasePath + "play_circle.svg"; type: IconData.Heavy }
        power: IconData { path: _heavyRoot.iconBasePath + "power.svg"; type: IconData.Heavy }
        printElement: IconData { path: _heavyRoot.iconBasePath + "print.svg"; type: IconData.Heavy }
        priorityHigh: IconData { path: _heavyRoot.iconBasePath + "priority_high.svg"; type: IconData.Heavy }
        publicElement: IconData { path: _heavyRoot.iconBasePath + "public.svg"; type: IconData.Heavy }
        qrCode: IconData { path: _heavyRoot.iconBasePath + "qr_code.svg"; type: IconData.Heavy }
        qrCode2: IconData { path: _heavyRoot.iconBasePath + "qr_code_2.svg"; type: IconData.Heavy }
        qrCodeScanner: IconData { path: _heavyRoot.iconBasePath + "qr_code_scanner.svg"; type: IconData.Heavy }
        queryStats: IconData { path: _heavyRoot.iconBasePath + "query_stats.svg"; type: IconData.Heavy }
        questionMark: IconData { path: _heavyRoot.iconBasePath + "question_mark.svg"; type: IconData.Heavy }
        radar: IconData { path: _heavyRoot.iconBasePath + "radar.svg"; type: IconData.Heavy }
        refresh: IconData { path: _heavyRoot.iconBasePath + "refresh.svg"; type: IconData.Heavy }
        remove: IconData { path: _heavyRoot.iconBasePath + "remove.svg"; type: IconData.Heavy }
        repeat: IconData { path: _heavyRoot.iconBasePath + "repeat.svg"; type: IconData.Heavy }
        replay: IconData { path: _heavyRoot.iconBasePath + "replay.svg"; type: IconData.Heavy }
        report: IconData { path: _heavyRoot.iconBasePath + "report.svg"; type: IconData.Heavy }
        restartAlt: IconData { path: _heavyRoot.iconBasePath + "restart_alt.svg"; type: IconData.Heavy }
        restaurant: IconData { path: _heavyRoot.iconBasePath + "restaurant.svg"; type: IconData.Heavy }
        restaurantMenu: IconData { path: _heavyRoot.iconBasePath + "restaurant_menu.svg"; type: IconData.Heavy }
        rocketLaunch: IconData { path: _heavyRoot.iconBasePath + "rocket_launch.svg"; type: IconData.Heavy }
        rssFeed: IconData { path: _heavyRoot.iconBasePath + "rss_feed.svg"; type: IconData.Heavy }
        save: IconData { path: _heavyRoot.iconBasePath + "save.svg"; type: IconData.Heavy }
        savings: IconData { path: _heavyRoot.iconBasePath + "savings.svg"; type: IconData.Heavy }
        schedule: IconData { path: _heavyRoot.iconBasePath + "schedule.svg"; type: IconData.Heavy }
        school: IconData { path: _heavyRoot.iconBasePath + "school.svg"; type: IconData.Heavy }
        science: IconData { path: _heavyRoot.iconBasePath + "science.svg"; type: IconData.Heavy }
        search: IconData { path: _heavyRoot.iconBasePath + "search.svg"; type: IconData.Heavy }
        security: IconData { path: _heavyRoot.iconBasePath + "security.svg"; type: IconData.Heavy }
        sell: IconData { path: _heavyRoot.iconBasePath + "sell.svg"; type: IconData.Heavy }
        send: IconData { path: _heavyRoot.iconBasePath + "send.svg"; type: IconData.Heavy }
        settings: IconData { path: _heavyRoot.iconBasePath + "settings.svg"; type: IconData.Heavy }
        share: IconData { path: _heavyRoot.iconBasePath + "share.svg"; type: IconData.Heavy }
        shoppingBag: IconData { path: _heavyRoot.iconBasePath + "shopping_bag.svg"; type: IconData.Heavy }
        shoppingCart: IconData { path: _heavyRoot.iconBasePath + "shopping_cart.svg"; type: IconData.Heavy }
        shuffle: IconData { path: _heavyRoot.iconBasePath + "shuffle.svg"; type: IconData.Heavy }
        signalCellularAlt: IconData { path: _heavyRoot.iconBasePath + "signal_cellular_alt.svg"; type: IconData.Heavy }
        skipNext: IconData { path: _heavyRoot.iconBasePath + "skip_next.svg"; type: IconData.Heavy }
        skipPrevious: IconData { path: _heavyRoot.iconBasePath + "skip_previous.svg"; type: IconData.Heavy }
        smartphone: IconData { path: _heavyRoot.iconBasePath + "smartphone.svg"; type: IconData.Heavy }
        sort: IconData { path: _heavyRoot.iconBasePath + "sort.svg"; type: IconData.Heavy }
        sportsEsports: IconData { path: _heavyRoot.iconBasePath + "sports_esports.svg"; type: IconData.Heavy }
        sportsSoccer: IconData { path: _heavyRoot.iconBasePath + "sports_soccer.svg"; type: IconData.Heavy }
        stadiaController: IconData { path: _heavyRoot.iconBasePath + "stadia_controller.svg"; type: IconData.Heavy }
        star: IconData { path: _heavyRoot.iconBasePath + "star.svg"; type: IconData.Heavy }
        stop: IconData { path: _heavyRoot.iconBasePath + "stop.svg"; type: IconData.Heavy }
        stopCircle: IconData { path: _heavyRoot.iconBasePath + "stop_circle.svg"; type: IconData.Heavy }
        storage: IconData { path: _heavyRoot.iconBasePath + "storage.svg"; type: IconData.Heavy }
        store: IconData { path: _heavyRoot.iconBasePath + "store.svg"; type: IconData.Heavy }
        storefront: IconData { path: _heavyRoot.iconBasePath + "storefront.svg"; type: IconData.Heavy }
        subscriptions: IconData { path: _heavyRoot.iconBasePath + "subscriptions.svg"; type: IconData.Heavy }
        sync: IconData { path: _heavyRoot.iconBasePath + "sync.svg"; type: IconData.Heavy }
        taskAlt: IconData { path: _heavyRoot.iconBasePath + "task_alt.svg"; type: IconData.Heavy }
        theaters: IconData { path: _heavyRoot.iconBasePath + "theaters.svg"; type: IconData.Heavy }
        thumbUp: IconData { path: _heavyRoot.iconBasePath + "thumb_up.svg"; type: IconData.Heavy }
        timeline: IconData { path: _heavyRoot.iconBasePath + "timeline.svg"; type: IconData.Heavy }
        timer: IconData { path: _heavyRoot.iconBasePath + "timer.svg"; type: IconData.Heavy }
        touchApp: IconData { path: _heavyRoot.iconBasePath + "touch_app.svg"; type: IconData.Heavy }
        trendingDown: IconData { path: _heavyRoot.iconBasePath + "trending_down.svg"; type: IconData.Heavy }
        trendingUp: IconData { path: _heavyRoot.iconBasePath + "trending_up.svg"; type: IconData.Heavy }
        tune: IconData { path: _heavyRoot.iconBasePath + "tune.svg"; type: IconData.Heavy }
        undo: IconData { path: _heavyRoot.iconBasePath + "undo.svg"; type: IconData.Heavy }
        update: IconData { path: _heavyRoot.iconBasePath + "update.svg"; type: IconData.Heavy }
        uploadFile: IconData { path: _heavyRoot.iconBasePath + "upload_file.svg"; type: IconData.Heavy }
        usb: IconData { path: _heavyRoot.iconBasePath + "usb.svg"; type: IconData.Heavy }
        verified: IconData { path: _heavyRoot.iconBasePath + "verified.svg"; type: IconData.Heavy }
        verifiedUser: IconData { path: _heavyRoot.iconBasePath + "verified_user.svg"; type: IconData.Heavy }
        videoLibrary: IconData { path: _heavyRoot.iconBasePath + "video_library.svg"; type: IconData.Heavy }
        videocam: IconData { path: _heavyRoot.iconBasePath + "videocam.svg"; type: IconData.Heavy }
        visibility: IconData { path: _heavyRoot.iconBasePath + "visibility.svg"; type: IconData.Heavy }
        visibilityOff: IconData { path: _heavyRoot.iconBasePath + "visibility_off.svg"; type: IconData.Heavy }
        volumeOff: IconData { path: _heavyRoot.iconBasePath + "volume_off.svg"; type: IconData.Heavy }
        volumeUp: IconData { path: _heavyRoot.iconBasePath + "volume_up.svg"; type: IconData.Heavy }
        wallet: IconData { path: _heavyRoot.iconBasePath + "wallet.svg"; type: IconData.Heavy }
        wallpaper: IconData { path: _heavyRoot.iconBasePath + "wallpaper.svg"; type: IconData.Heavy }
        warning: IconData { path: _heavyRoot.iconBasePath + "warning.svg"; type: IconData.Heavy }
        wbSunny: IconData { path: _heavyRoot.iconBasePath + "wb_sunny.svg"; type: IconData.Heavy }
        whereToVote: IconData { path: _heavyRoot.iconBasePath + "where_to_vote.svg"; type: IconData.Heavy }
        widgets: IconData { path: _heavyRoot.iconBasePath + "widgets.svg"; type: IconData.Heavy }
        wifi: IconData { path: _heavyRoot.iconBasePath + "wifi.svg"; type: IconData.Heavy }
        wifiOff: IconData { path: _heavyRoot.iconBasePath + "wifi_off.svg"; type: IconData.Heavy }
        work: IconData { path: _heavyRoot.iconBasePath + "work.svg"; type: IconData.Heavy }
        dashedCircle: IconData { path: _heavyRoot.iconBasePath + "dashedCircle.svg"; type: IconData.Heavy }
        colorize: IconData { path: _heavyRoot.iconBasePath + "colorize.svg"; type: IconData.Heavy }
    }

    readonly property IconSet light: IconSet {
        inventory2: IconData { path: '\ue900'; type: IconData.Light }
        keyboardArrowDown: IconData { path: '\ue901'; type: IconData.Light }
        keyboardArrowLeft: IconData { path: '\ue902'; type: IconData.Light }
        keyboardArrowRight: IconData { path: '\ue903'; type: IconData.Light }
        keyboardArrowUp: IconData { path: '\ue904'; type: IconData.Light }
        label: IconData { path: '\ue905'; type: IconData.Light }
        landscape: IconData { path: '\ue906'; type: IconData.Light }
        language: IconData { path: '\ue907'; type: IconData.Light }
        leaderboard: IconData { path: '\ue908'; type: IconData.Light }
        lightMode: IconData { path: '\ue909'; type: IconData.Light }
        lightbulb: IconData { path: '\ue90a'; type: IconData.Light }
        link: IconData { path: '\ue90b'; type: IconData.Light }
        list: IconData { path: '\ue90c'; type: IconData.Light }
        localCafe: IconData { path: '\ue90d'; type: IconData.Light }
        localMall: IconData { path: '\ue90e'; type: IconData.Light }
        locationOn: IconData { path: '\ue90f'; type: IconData.Light }
        lock: IconData { path: '\ue910'; type: IconData.Light }
        lockOpen: IconData { path: '\ue911'; type: IconData.Light }
        login: IconData { path: '\ue912'; type: IconData.Light }
        logout: IconData { path: '\ue913'; type: IconData.Light }
        loyalty: IconData { path: '\ue914'; type: IconData.Light }
        mail: IconData { path: '\ue915'; type: IconData.Light }
        manageAccounts: IconData { path: '\ue916'; type: IconData.Light }
        map: IconData { path: '\ue917'; type: IconData.Light }
        menu: IconData { path: '\ue918'; type: IconData.Light }
        mic: IconData { path: '\ue919'; type: IconData.Light }
        modeComment: IconData { path: '\ue91a'; type: IconData.Light }
        monitoring: IconData { path: '\ue91b'; type: IconData.Light }
        moreHoriz: IconData { path: '\ue91c'; type: IconData.Light }
        moreVert: IconData { path: '\ue91d'; type: IconData.Light }
        movie: IconData { path: '\ue91e'; type: IconData.Light }
        musicNote: IconData { path: '\ue91f'; type: IconData.Light }
        myLocation: IconData { path: '\ue920'; type: IconData.Light }
        navigation: IconData { path: '\ue921'; type: IconData.Light }
        nearMe: IconData { path: '\ue922'; type: IconData.Light }
        nestEcoLeaf: IconData { path: '\ue923'; type: IconData.Light }
        nestRemoteComfortSensor: IconData { path: '\ue924'; type: IconData.Light }
        nightlight: IconData { path: '\ue925'; type: IconData.Light }
        notifications: IconData { path: '\ue926'; type: IconData.Light }
        openInNew: IconData { path: '\ue927'; type: IconData.Light }
        paid: IconData { path: '\ue928'; type: IconData.Light }
        palette: IconData { path: '\ue929'; type: IconData.Light }
        pause: IconData { path: '\ue92a'; type: IconData.Light }
        pauseCircle: IconData { path: '\ue92b'; type: IconData.Light }
        person: IconData { path: '\ue92c'; type: IconData.Light }
        personAdd: IconData { path: '\ue92d'; type: IconData.Light }
        personPin: IconData { path: '\ue92e'; type: IconData.Light }
        pets: IconData { path: '\ue92f'; type: IconData.Light }
        phoneIphone: IconData { path: '\ue930'; type: IconData.Light }
        photoCamera: IconData { path: '\ue931'; type: IconData.Light }
        photoLibrary: IconData { path: '\ue932'; type: IconData.Light }
        pictureAsPdf: IconData { path: '\ue933'; type: IconData.Light }
        pinDrop: IconData { path: '\ue934'; type: IconData.Light }
        playArrow: IconData { path: '\ue935'; type: IconData.Light }
        playCircle: IconData { path: '\ue936'; type: IconData.Light }
        power: IconData { path: '\ue937'; type: IconData.Light }
        printElement: IconData { path: '\ue938'; type: IconData.Light }
        priorityHigh: IconData { path: '\ue939'; type: IconData.Light }
        publicElement: IconData { path: '\ue93a'; type: IconData.Light }
        qrCode: IconData { path: '\ue93b'; type: IconData.Light }
        qrCode2: IconData { path: '\ue93c'; type: IconData.Light }
        qrCodeScanner: IconData { path: '\ue93d'; type: IconData.Light }
        queryStats: IconData { path: '\ue93e'; type: IconData.Light }
        questionMark: IconData { path: '\ue93f'; type: IconData.Light }
        radar: IconData { path: '\ue940'; type: IconData.Light }
        refresh: IconData { path: '\ue941'; type: IconData.Light }
        remove: IconData { path: '\ue942'; type: IconData.Light }
        repeat: IconData { path: '\ue943'; type: IconData.Light }
        replay: IconData { path: '\ue944'; type: IconData.Light }
        report: IconData { path: '\ue945'; type: IconData.Light }
        restartAlt: IconData { path: '\ue946'; type: IconData.Light }
        restaurant: IconData { path: '\ue947'; type: IconData.Light }
        restaurantMenu: IconData { path: '\ue948'; type: IconData.Light }
        rocketLaunch: IconData { path: '\ue949'; type: IconData.Light }
        rssFeed: IconData { path: '\ue94a'; type: IconData.Light }
        save: IconData { path: '\ue94b'; type: IconData.Light }
        savings: IconData { path: '\ue94c'; type: IconData.Light }
        schedule: IconData { path: '\ue94d'; type: IconData.Light }
        school: IconData { path: '\ue94e'; type: IconData.Light }
        science: IconData { path: '\ue94f'; type: IconData.Light }
        search: IconData { path: '\ue950'; type: IconData.Light }
        security: IconData { path: '\ue951'; type: IconData.Light }
        sell: IconData { path: '\ue952'; type: IconData.Light }
        send: IconData { path: '\ue953'; type: IconData.Light }
        settings: IconData { path: '\ue954'; type: IconData.Light }
        share: IconData { path: '\ue955'; type: IconData.Light }
        shoppingBag: IconData { path: '\ue956'; type: IconData.Light }
        shoppingCart: IconData { path: '\ue957'; type: IconData.Light }
        shuffle: IconData { path: '\ue958'; type: IconData.Light }
        signalCellularAlt: IconData { path: '\ue959'; type: IconData.Light }
        skipNext: IconData { path: '\ue95a'; type: IconData.Light }
        skipPrevious: IconData { path: '\ue95b'; type: IconData.Light }
        smartphone: IconData { path: '\ue95c'; type: IconData.Light }
        sort: IconData { path: '\ue95d'; type: IconData.Light }
        sportsEsports: IconData { path: '\ue95e'; type: IconData.Light }
        sportsSoccer: IconData { path: '\ue95f'; type: IconData.Light }
        stadiaController: IconData { path: '\ue960'; type: IconData.Light }
        star: IconData { path: '\ue961'; type: IconData.Light }
        stop: IconData { path: '\ue962'; type: IconData.Light }
        stopCircle: IconData { path: '\ue963'; type: IconData.Light }
        storage: IconData { path: '\ue964'; type: IconData.Light }
        store: IconData { path: '\ue965'; type: IconData.Light }
        storefront: IconData { path: '\ue966'; type: IconData.Light }
        subscriptions: IconData { path: '\ue967'; type: IconData.Light }
        sync: IconData { path: '\ue968'; type: IconData.Light }
        taskAlt: IconData { path: '\ue969'; type: IconData.Light }
        theaters: IconData { path: '\ue96a'; type: IconData.Light }
        thumbUp: IconData { path: '\ue96b'; type: IconData.Light }
        timeline: IconData { path: '\ue96c'; type: IconData.Light }
        timer: IconData { path: '\ue96d'; type: IconData.Light }
        touchApp: IconData { path: '\ue96e'; type: IconData.Light }
        trendingDown: IconData { path: '\ue96f'; type: IconData.Light }
        trendingUp: IconData { path: '\ue970'; type: IconData.Light }
        tune: IconData { path: '\ue971'; type: IconData.Light }
        undo: IconData { path: '\ue972'; type: IconData.Light }
        update: IconData { path: '\ue973'; type: IconData.Light }
        uploadFile: IconData { path: '\ue974'; type: IconData.Light }
        usb: IconData { path: '\ue975'; type: IconData.Light }
        verified: IconData { path: '\ue976'; type: IconData.Light }
        verifiedUser: IconData { path: '\ue977'; type: IconData.Light }
        videoLibrary: IconData { path: '\ue978'; type: IconData.Light }
        videocam: IconData { path: '\ue979'; type: IconData.Light }
        visibility: IconData { path: '\ue97a'; type: IconData.Light }
        visibilityOff: IconData { path: '\ue97b'; type: IconData.Light }
        volumeOff: IconData { path: '\ue97c'; type: IconData.Light }
        volumeUp: IconData { path: '\ue97d'; type: IconData.Light }
        wallet: IconData { path: '\ue97e'; type: IconData.Light }
        wallpaper: IconData { path: '\ue97f'; type: IconData.Light }
        warning: IconData { path: '\ue980'; type: IconData.Light }
        wbSunny: IconData { path: '\ue981'; type: IconData.Light }
        whereToVote: IconData { path: '\ue982'; type: IconData.Light }
        widgets: IconData { path: '\ue983'; type: IconData.Light }
        wifi: IconData { path: '\ue984'; type: IconData.Light }
        wifiOff: IconData { path: '\ue985'; type: IconData.Light }
        work: IconData { path: '\ue986'; type: IconData.Light }
        accountBalance: IconData { path: '\ue987'; type: IconData.Light }
        accountBox: IconData { path: '\ue988'; type: IconData.Light }
        accountCircle: IconData { path: '\ue989'; type: IconData.Light }
        adb: IconData { path: '\ue98a'; type: IconData.Light }
        add: IconData { path: '\ue98b'; type: IconData.Light }
        addAPhoto: IconData { path: '\ue98c'; type: IconData.Light }
        addBox: IconData { path: '\ue98d'; type: IconData.Light }
        addBusiness: IconData { path: '\ue98e'; type: IconData.Light }
        addCard: IconData { path: '\ue98f'; type: IconData.Light }
        addCircle: IconData { path: '\ue990'; type: IconData.Light }
        addPhotoAlternate: IconData { path: '\ue991'; type: IconData.Light }
        addShoppingCart: IconData { path: '\ue992'; type: IconData.Light }
        air: IconData { path: '\ue993'; type: IconData.Light }
        alarm: IconData { path: '\ue994'; type: IconData.Light }
        analytics: IconData { path: '\ue995'; type: IconData.Light }
        android: IconData { path: '\ue996'; type: IconData.Light }
        apps: IconData { path: '\ue997'; type: IconData.Light }
        arrowBack: IconData { path: '\ue998'; type: IconData.Light }
        arrowDownward: IconData { path: '\ue999'; type: IconData.Light }
        arrowDropDown: IconData { path: '\ue99a'; type: IconData.Light }
        arrowDropUp: IconData { path: '\ue99b'; type: IconData.Light }
        arrowForward: IconData { path: '\ue99c'; type: IconData.Light }
        arrowRight: IconData { path: '\ue99d'; type: IconData.Light }
        atr: IconData { path: '\ue99e'; type: IconData.Light }
        attachMoney: IconData { path: '\ue99f'; type: IconData.Light }
        autorenew: IconData { path: '\ue9a0'; type: IconData.Light }
        backspace: IconData { path: '\ue9a1'; type: IconData.Light }
        badge: IconData { path: '\ue9a2'; type: IconData.Light }
        barChart: IconData { path: '\ue9a3'; type: IconData.Light }
        barcodeScanner: IconData { path: '\ue9a4'; type: IconData.Light }
        batteryChargingFull: IconData { path: '\ue9a5'; type: IconData.Light }
        batteryFull: IconData { path: '\ue9a6'; type: IconData.Light }
        batteryFullAlt: IconData { path: '\ue9a7'; type: IconData.Light }
        bluetooth: IconData { path: '\ue9a8'; type: IconData.Light }
        bookmark: IconData { path: '\ue9a9'; type: IconData.Light }
        brush: IconData { path: '\ue9aa'; type: IconData.Light }
        build: IconData { path: '\ue9ab'; type: IconData.Light }
        cable: IconData { path: '\ue9ac'; type: IconData.Light }
        cake: IconData { path: '\ue9ad'; type: IconData.Light }
        calculate: IconData { path: '\ue9ae'; type: IconData.Light }
        calendarMonth: IconData { path: '\ue9af'; type: IconData.Light }
        calendarToday: IconData { path: '\ue9b0'; type: IconData.Light }
        call: IconData { path: '\ue9b1'; type: IconData.Light }
        camera: IconData { path: '\ue9b2'; type: IconData.Light }
        campaign: IconData { path: '\ue9b3'; type: IconData.Light }
        cancel: IconData { path: '\ue9b4'; type: IconData.Light }
        cast: IconData { path: '\ue9b5'; type: IconData.Light }
        category: IconData { path: '\ue9b6'; type: IconData.Light }
        celebration: IconData { path: '\ue9b7'; type: IconData.Light }
        chat: IconData { path: '\ue9b8'; type: IconData.Light }
        chatBubble: IconData { path: '\ue9b9'; type: IconData.Light }
        check: IconData { path: '\ue9ba'; type: IconData.Light }
        checkBox: IconData { path: '\ue9bb'; type: IconData.Light }
        checkBoxOutlineBlank: IconData { path: '\ue9bc'; type: IconData.Light }
        checkCircle: IconData { path: '\ue9bd'; type: IconData.Light }
        chevronLeft: IconData { path: '\ue9be'; type: IconData.Light }
        chevronRight: IconData { path: '\ue9bf'; type: IconData.Light }
        circle: IconData { path: '\ue9c0'; type: IconData.Light }
        close: IconData { path: '\ue9c1'; type: IconData.Light }
        code: IconData { path: '\ue9c2'; type: IconData.Light }
        computer: IconData { path: '\ue9c3'; type: IconData.Light }
        construction: IconData { path: '\ue9c4'; type: IconData.Light }
        contactSupport: IconData { path: '\ue9c5'; type: IconData.Light }
        contentCopy: IconData { path: '\ue9c6'; type: IconData.Light }
        creditCard: IconData { path: '\ue9c7'; type: IconData.Light }
        cropFree: IconData { path: '\ue9c8'; type: IconData.Light }
        currencyBitcoin: IconData { path: '\ue9c9'; type: IconData.Light }
        darkMode: IconData { path: '\ue9ca'; type: IconData.Light }
        dashboard: IconData { path: '\ue9cb'; type: IconData.Light }
        database: IconData { path: '\ue9cc'; type: IconData.Light }
        deleteElement: IconData { path: '\ue9cd'; type: IconData.Light }
        deleteForever: IconData { path: '\ue9ce'; type: IconData.Light }
        description: IconData { path: '\ue9cf'; type: IconData.Light }
        devices: IconData { path: '\ue9d0'; type: IconData.Light }
        directionsCar: IconData { path: '\ue9d1'; type: IconData.Light }
        domain: IconData { path: '\ue9d2'; type: IconData.Light }
        doneAll: IconData { path: '\ue9d3'; type: IconData.Light }
        download: IconData { path: '\ue9d4'; type: IconData.Light }
        downloadForOffline: IconData { path: '\ue9d5'; type: IconData.Light }
        draw: IconData { path: '\ue9d6'; type: IconData.Light }
        eco: IconData { path: '\ue9d7'; type: IconData.Light }
        edit: IconData { path: '\ue9d8'; type: IconData.Light }
        editNote: IconData { path: '\ue9d9'; type: IconData.Light }
        electricBolt: IconData { path: '\ue9da'; type: IconData.Light }
        emojiObjects: IconData { path: '\ue9db'; type: IconData.Light }
        engineering: IconData { path: '\ue9dc'; type: IconData.Light }
        error: IconData { path: '\ue9dd'; type: IconData.Light }
        euro: IconData { path: '\ue9de'; type: IconData.Light }
        event: IconData { path: '\ue9df'; type: IconData.Light }
        explore: IconData { path: '\ue9e0'; type: IconData.Light }
        extension: IconData { path: '\ue9e1'; type: IconData.Light }
        familiarFaceAndZone: IconData { path: '\ue9e2'; type: IconData.Light }
        fastForward: IconData { path: '\ue9e3'; type: IconData.Light }
        fastRewind: IconData { path: '\ue9e4'; type: IconData.Light }
        favorite: IconData { path: '\ue9e5'; type: IconData.Light }
        fileCopy: IconData { path: '\ue9e6'; type: IconData.Light }
        filterAlt: IconData { path: '\ue9e7'; type: IconData.Light }
        filterList: IconData { path: '\ue9e8'; type: IconData.Light }
        finance: IconData { path: '\ue9e9'; type: IconData.Light }
        fingerprint: IconData { path: '\ue9ea'; type: IconData.Light }
        flag: IconData { path: '\ue9eb'; type: IconData.Light }
        flashOn: IconData { path: '\ue9ec'; type: IconData.Light }
        flashlightOn: IconData { path: '\ue9ed'; type: IconData.Light }
        flight: IconData { path: '\ue9ee'; type: IconData.Light }
        folder: IconData { path: '\ue9ef'; type: IconData.Light }
        folderOpen: IconData { path: '\ue9f0'; type: IconData.Light }
        forum: IconData { path: '\ue9f1'; type: IconData.Light }
        gridOn: IconData { path: '\ue9f2'; type: IconData.Light }
        gridView: IconData { path: '\ue9f3'; type: IconData.Light }
        group: IconData { path: '\ue9f4'; type: IconData.Light }
        groupAdd: IconData { path: '\ue9f5'; type: IconData.Light }
        groups: IconData { path: '\ue9f6'; type: IconData.Light }
        handyman: IconData { path: '\ue9f7'; type: IconData.Light }
        headphones: IconData { path: '\ue9f8'; type: IconData.Light }
        hearing: IconData { path: '\ue9f9'; type: IconData.Light }
        help: IconData { path: '\ue9fa'; type: IconData.Light }
        history: IconData { path: '\ue9fb'; type: IconData.Light }
        home: IconData { path: '\ue9fc'; type: IconData.Light }
        homePin: IconData { path: '\ue9fd'; type: IconData.Light }
        image: IconData { path: '\ue9fe'; type: IconData.Light }
        imagesmode: IconData { path: '\ue9ff'; type: IconData.Light }
        info: IconData { path: '\uea00'; type: IconData.Light }
        inventory: IconData { path: '\uea01'; type: IconData.Light }
        colorize: IconData { path: '\uea02'; type: IconData.Light }
    }

    function getAll() : list<string> {
        let heavyList = _root.heavy.getAll();
        let lightList = _root.light.getAll();

        let combinedList = heavyList.slice();
        for (let i = 0; i < lightList.length; i++) {
           if (combinedList.indexOf(lightList[i]) === -1) {
                combinedList.push(lightList[i]);
            }
        }
        return combinedList;
    }

    function getPropertyNames(iconContainer: QtObject) : list<string> {
        let names = [];
        for (var key in iconContainer) {
            if (iconContainer.hasOwnProperty(key) && typeof iconContainer[key] == "object") {
                names.push(key);
            }
        }
        return names;
    }
}
