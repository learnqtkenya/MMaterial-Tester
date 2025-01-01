qt_add_qml_module(AnimationsLib
    URI MMaterial.Animations
    RESOURCE_PREFIX /
    VERSION 1.0
    STATIC
    QML_FILES
        EasedAnimation.qml
        ElasticAnimation.qml
)

set_target_properties(AnimationsLib PROPERTIES AUTOMOC ON)
target_link_libraries(AnimationsLib PRIVATE Qt6::Quick)

target_compile_definitions(AnimationsLib PRIVATE QT_QUICKCONTROLS_MATERIAL_STYLE)
