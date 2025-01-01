list(APPEND THEME_QML_FILES
    PaletteTransparent.qml
    PaletteCommon.qml
    PaletteBackground.qml
    PaletteText.qml
    PaletteBasic.qml
    PaletteGrey.qml
    PaletteSocial.qml
    PaletteOther.qml
    PaletteAction.qml
    ThemeBase.qml
)

list(APPEND THEME_QML_SINGLETONS
    Theme.qml
    DarkTheme.qml
    LightTheme.qml
    ThemeList.qml
    BasicRed.qml
    BasicGreen.qml
    BasicPurple.qml
    BasicBlue.qml
    BasicOrange.qml
    BasicLightBlue.qml
)

set_source_files_properties(
    ${THEME_QML_SINGLETONS}
    PROPERTIES QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(ThemeLib
    URI MMaterial.Theme
    RESOURCE_PREFIX /
    VERSION 1.0
    STATIC
    QML_FILES ${THEME_QML_FILES} ${THEME_QML_SINGLETONS}
)

set_target_properties(ThemeLib PROPERTIES AUTOMOC ON)
target_link_libraries(ThemeLib PRIVATE Qt6::Quick)

target_compile_definitions(ThemeLib PRIVATE QT_QUICKCONTROLS_MATERIAL_STYLE)
