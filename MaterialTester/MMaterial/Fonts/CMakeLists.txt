list(APPEND QML_FONT_SINGLETONS
    PublicSans.qml
)

list(APPEND FONT_ASSETS
    Families/PublicSans/PublicSans-ExtraBold.ttf
    Families/PublicSans/PublicSans-Bold.ttf
    Families/PublicSans/PublicSans-SemiBold.ttf
    Families/PublicSans/PublicSans-Medium.ttf
    Families/PublicSans/PublicSans-Regular.ttf
    Families/PublicSans/PublicSans-Light.ttf
    Families/PublicSans/PublicSans-ExtraLight.ttf
)

set_source_files_properties(
    ${QML_FONT_SINGLETONS}
    PROPERTIES QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(FontsLib
    URI MMaterial.Fonts
    RESOURCE_PREFIX /
    VERSION 1.0
    STATIC
    QML_FILES
        ${QML_FONT_SINGLETONS}
        BaseFont.qml
        H1.qml
        H2.qml
        H3.qml
        H4.qml
        H5.qml
        H6.qml
        Subtitle1.qml
        Subtitle2.qml
        B1.qml
        B2.qml
        Caption.qml
        Overline.qml
        BaseText.qml
    RESOURCES ${FONT_ASSETS}
)

qt_add_resources(MMaterialLib
    "mmaterial_font_assets"
    BASE "${CMAKE_CURRENT_SOURCE_DIR}"
    PREFIX "MMaterial"
    BIG_RESOURCES
    FILES
    ${FONT_ASSETS}
)

set_target_properties(FontsLib PROPERTIES AUTOMOC ON)
target_link_libraries(FontsLib PRIVATE Qt6::Quick)

target_compile_definitions(FontsLib PRIVATE QT_QUICKCONTROLS_MATERIAL_STYLE)
