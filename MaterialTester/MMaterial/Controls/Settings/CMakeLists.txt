set_source_files_properties(
    Size.qml
    PROPERTIES QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(SettingsLib
    URI MMaterial.Controls.Settings
    RESOURCE_PREFIX /
    VERSION 1.0
    STATIC
    QML_FILES
        Size.qml
)

set_target_properties(SettingsLib PROPERTIES AUTOMOC ON)
target_link_libraries(SettingsLib PRIVATE Qt6::Quick)

target_compile_definitions(SettingsLib PRIVATE QT_QUICKCONTROLS_MATERIAL_STYLE)
