list(APPEND QML_ICON_SINGLETONS
    IconFont.qml
    Icons.qml
    Images.qml
)

list(APPEND ICON_ASSETS
    assets/icomoon.ttf
)

set_source_files_properties(
    ${QML_ICON_SINGLETONS}
    PROPERTIES QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(IconsLib
    URI MMaterial.Icons
    RESOURCE_PREFIX /
    VERSION 1.0
    STATIC
    QML_FILES
        ${QML_ICON_SINGLETONS}
        Icon.qml
        LightIcon.qml
        IconData.qml
        HeavyIcon.qml
        IconBase.qml
        IconSet.qml

    RESOURCES ${ICON_ASSETS}
)

set_target_properties(IconsLib PROPERTIES AUTOMOC ON)
target_link_libraries(IconsLib PRIVATE Qt6::Quick)

target_compile_definitions(IconsLib PRIVATE QT_QUICKCONTROLS_MATERIAL_STYLE)

qt_add_resources(IconsLib
    "mmaterial_icon_assets"
    BASE "${CMAKE_CURRENT_SOURCE_DIR}"
    PREFIX "MMaterial"
    BIG_RESOURCES
    FILES
        ${ICON_ASSETS}
)

