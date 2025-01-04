qt_add_qml_module(ComponentsLib
    URI MaterialTester.Components
    VERSION 1.0
    STATIC
    OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/../MaterialTester/Components"
    QML_FILES
        AppSettings.qml
        TitleRow.qml
        SubTitle.qml
        TwoChoices.qml
        PresetButton.qml


)

set_target_properties(ComponentsLib PROPERTIES AUTOMOC ON)
target_link_libraries(ComponentsLib PRIVATE Qt6::Quick)

target_compile_definitions(ComponentsLib PRIVATE QT_QUICKCONTROLS_MATERIAL_STYLE)
