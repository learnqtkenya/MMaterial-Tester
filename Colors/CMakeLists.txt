qt_add_library(ColorsLib STATIC)

set_target_properties(ColorsLib PROPERTIES AUTOMOC ON)
target_link_libraries(ColorsLib PRIVATE Qt6::Quick)

list(APPEND MODULE_QML_FILES
    BaseObjects/PaletteBasic.qml
    BaseObjects/PaletteExtended.qml
    BaseObjects/PaletteSocial.qml
    BaseObjects/ThemeBase.qml
    BasicPalettes/Dark/PrimaryDark.qml
    BasicPalettes/Dark/SecondaryDark.qml
    BasicPalettes/Dark/InfoDark.qml
    BasicPalettes/Dark/SuccessDark.qml
    BasicPalettes/Dark/ErrorDark.qml
    BasicPalettes/Dark/WarningDark.qml
    BasicPalettes/Light/PrimaryLight.qml
    BasicPalettes/Light/SecondaryLight.qml
    BasicPalettes/Light/InfoLight.qml
    BasicPalettes/Light/SuccessLight.qml
    BasicPalettes/Light/ErrorLight.qml
    BasicPalettes/Light/WarningLight.qml
    ExtendedPalettes/PaletteDark.qml
    ExtendedPalettes/PaletteLight.qml
    SocialPalettes/SocialDark.qml
    SocialPalettes/SocialLight.qml
    Themes/DarkTheme.qml
    Themes/LightTheme.qml
)

qt_add_qml_module(ColorsLib
    URI Colors
    VERSION 1.0
    QML_FILES ${MODULE_QML_FILES}
    RESOURCES ${MODULE_ASSETS}
)

# Function to add a QML file to the list as a private file


