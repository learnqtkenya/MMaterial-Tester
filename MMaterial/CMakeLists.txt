qt_add_library(MMaterialLib STATIC)

set_target_properties(MMaterialLib PROPERTIES AUTOMOC ON)
target_link_libraries(MMaterialLib PRIVATE Qt6::Quick)

list(APPEND MODULE_ASSETS
    # Fonts
    Fonts/Families/PublicSans/PublicSans-ExtraBold.ttf
    Fonts/Families/PublicSans/PublicSans-Bold.ttf
    Fonts/Families/PublicSans/PublicSans-SemiBold.ttf
    Fonts/Families/PublicSans/PublicSans-Medium.ttf
    Fonts/Families/PublicSans/PublicSans-Regular.ttf
    Fonts/Families/PublicSans/PublicSans-Light.ttf
    Fonts/Families/PublicSans/PublicSans-ExtraLight.ttf

    # Icons
    Icons/assets/svg/android.svg
    Icons/assets/svg/mail.svg
    Icons/assets/svg/arrow.svg
    Icons/assets/svg/logo.svg
    Icons/assets/svg/alternativeLogo.svg
    Icons/assets/svg/alert.svg
    Icons/assets/svg/info.svg
    Icons/assets/svg/success.svg
    Icons/assets/svg/closeX.svg
    Icons/assets/svg/menu.svg
    Icons/assets/svg/sun.svg
    Icons/assets/svg/moon.svg
    Icons/assets/svg/star.svg
    Icons/assets/svg/avatar.svg
    Icons/assets/svg/font.svg
    Icons/assets/svg/palette.svg
    Icons/assets/svg/verified.svg
    Icons/assets/svg/checkmark.svg
    Icons/assets/svg/list.svg
    Icons/assets/svg/search.svg
    Icons/assets/svg/send.svg
    Icons/assets/svg/stonks.svg
    Icons/assets/svg/call.svg
    Icons/assets/svg/pages.svg
    Icons/assets/svg/gamepad.svg

    # Images
    Icons/assets/png/programmer-female.png
    Icons/assets/png/programmer-female2.png
    Icons/assets/png/programmer-male.png
    Icons/assets/png/programmer-male2.png
)

list(APPEND MODULE_QML_FILES
    # Fonts
    Fonts/PublicSans.qml
    Fonts/BaseFont.qml
    Fonts/Texts/H1.qml
    Fonts/Texts/H2.qml
    Fonts/Texts/H3.qml
    Fonts/Texts/H4.qml
    Fonts/Texts/H5.qml
    Fonts/Texts/H6.qml
    Fonts/Texts/Subtitle1.qml
    Fonts/Texts/Subtitle2.qml
    Fonts/Texts/B1.qml
    Fonts/Texts/B2.qml
    Fonts/Texts/Caption.qml
    Fonts/Texts/Overline.qml
    Fonts/Texts/BaseText.qml

    # Colors / Themes
    Colors/Theme.qml
    Colors/ThemeList.qml
    Colors/BaseObjects/PaletteTransparent.qml
    Colors/BaseObjects/PaletteCommon.qml
    Colors/BaseObjects/PaletteBackground.qml
    Colors/BaseObjects/PaletteText.qml
    Colors/BaseObjects/PaletteBasic.qml
    Colors/BaseObjects/PaletteGrey.qml
    Colors/BaseObjects/PaletteSocial.qml
    Colors/BaseObjects/PaletteOther.qml
    Colors/BaseObjects/PaletteAction.qml
    Colors/BaseObjects/ThemeBase.qml
    Colors/Themes/DarkTheme.qml
    Colors/Themes/LightTheme.qml
    Colors/BasicPalettes/BasicRed.qml
    Colors/BasicPalettes/BasicGreen.qml
    Colors/BasicPalettes/BasicPurple.qml
    Colors/BasicPalettes/BasicBlue.qml
    Colors/BasicPalettes/BasicOrange.qml
    Colors/BasicPalettes/BasicLightBlue.qml

    # Icons
    Icons/Icon.qml
    Icons/IconList.qml
    Icons/ImageList.qml

    # Components
    Components/Badge/BadgeNumber.qml
    Components/Badge/BadgeDot.qml
    Components/Badge/Badge.qml
    Components/Accordion.qml
    Components/Alerts/Alert.qml
    Components/Alerts/AlertController.qml
    Components/Avatar.qml
    Components/Pagination/Paginator.qml
    Components/Progress/MProgressBar.qml
    Components/Progress/MCircularProgressBar.qml

    # Settings
    Settings/Size.qml

    # Buttons
    Buttons/MButton.qml
    Buttons/MToggleButton.qml
    Buttons/MFabButton.qml
    Buttons/MCheckbox.qml
    Buttons/CheckedGroup.qml
    Buttons/Checkable.qml
    Buttons/MRadioButton.qml

    # Sidebar
    Sidebar/Sidebar.qml
    Sidebar/SidebarCategoryLabel.qml
    Sidebar/SidebarItem.qml
    Sidebar/CompactSidebar.qml
    Sidebar/SidebarCompactItem.qml
    Sidebar/SidebarSeparator.qml
    Sidebar/ExtendedSidebar.qml

    # Lists
    Lists/ListItem.qml
    Lists/ListItemContact.qml
    Lists/AbstractListItem.qml

    # Pagination
    Components/Pagination/PaginatorSimple.qml
    Components/Pagination/PaginatorBubble.qml
    Components/Pagination/PaginatorArrows.qml
)

set_source_files_properties(
    Colors/Theme.qml
    Colors/Themes/DarkTheme.qml
    Colors/Themes/LightTheme.qml
    Colors/ThemeList.qml
    Colors/BasicPalettes/BasicRed.qml
    Colors/BasicPalettes/BasicGreen.qml
    Colors/BasicPalettes/BasicPurple.qml
    Colors/BasicPalettes/BasicBlue.qml
    Colors/BasicPalettes/BasicOrange.qml
    Colors/BasicPalettes/BasicLightBlue.qml

    Fonts/PublicSans.qml
    Icons/IconList.qml
    Icons/ImageList.qml
    Settings/Size.qml
    PROPERTIES QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(MMaterialLib
    URI MMaterial
    VERSION 1.0
    QML_FILES ${MODULE_QML_FILES}
    RESOURCES ${MODULE_ASSETS}
)



