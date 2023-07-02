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
    Icons/assets/android.svg
    Icons/assets/mail.svg
    Icons/assets/arrow.svg
    Icons/assets/logo.svg
    Icons/assets/alternativeLogo.svg
    Icons/assets/alert.svg
    Icons/assets/info.svg
    Icons/assets/success.svg
    Icons/assets/closeX.svg
    Icons/assets/menu.svg
    Icons/assets/sun.svg
    Icons/assets/moon.svg
    Icons/assets/star.svg
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
    Icons/Avatar.qml

    # Components
    Components/Badge/BadgeNumber.qml
    Components/Badge/BadgeDot.qml
    Components/Badge/Badge.qml
    Components/Accordion.qml
    Components/Alerts/Alert.qml
    Components/Alerts/AlertController.qml

    # Settings
    Settings/Size.qml

    # Buttons
    Buttons/MButton.qml
    Buttons/MToggleButton.qml
    Buttons/MFabButton.qml
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
    Settings/Size.qml
    PROPERTIES QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(MMaterialLib
    URI MMaterial
    VERSION 1.0
    QML_FILES ${MODULE_QML_FILES}
    RESOURCES ${MODULE_ASSETS}
)

# Function to add a QML file to the list as a private file


