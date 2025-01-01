qt_add_qml_module(MMaterialLib
    URI MMaterial
    RESOURCE_PREFIX /
    VERSION 1.0
    STATIC
    IMPORTS
        MMaterial.Animations
        MMaterial.Controls
        MMaterial.Fonts
        MMaterial.Icons
        MMaterial.Theme

    OPTIONAL_IMPORTS
        MMaterial.Charts
)

file(GLOB PNG_ASSETS "Icons/assets/other/*.png")
file(GLOB JPEG_ASSETS "Icons/assets/other/*.jpeg")
file(GLOB SVG_ASSETS "Icons/assets/svg/*.svg")

qt_add_resources(MMaterialLib
    "mmaterial_assets"
    BASE "${CMAKE_CURRENT_SOURCE_DIR}"
    PREFIX "MMaterial"
    BIG_RESOURCES
    FILES
        ${PNG_ASSETS}
        ${JPEG_ASSETS}
        ${SVG_ASSETS}
)

set_target_properties(MMaterialLib PROPERTIES AUTOMOC ON)
target_link_libraries(MMaterialLib PRIVATE Qt6::Quick AnimationsLibplugin ControlsLibplugin ChartsLibplugin FontsLibplugin IconsLibplugin ThemeLibplugin)

add_subdirectory(Animations)
add_subdirectory(Controls)
add_subdirectory(Charts)
add_subdirectory(Fonts)
add_subdirectory(Icons)
add_subdirectory(Theme)

target_compile_definitions(MMaterialLib PRIVATE QT_QUICKCONTROLS_MATERIAL_STYLE)
