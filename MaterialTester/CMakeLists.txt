cmake_minimum_required(VERSION 3.16)

project(MaterialTester VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)

qt_standard_project_setup()

qt_add_executable(appMaterialTester
    main.cpp
)

qt_add_qml_module(appMaterialTester
    URI MaterialTester
    VERSION 1.0
    QML_FILES
        Main.qml
        MainWindow.qml
        Showcase/FontShowcase.qml
        Showcase/ColorShowcase/ColorShowcase.qml
        Showcase/ColorShowcase/PaletteBasicView.qml
        Showcase/ColorShowcase/ColorRect.qml
        Showcase/AvatarShowcase/AvatarShowcase.qml
        Showcase/BadgeShowcase.qml
        Showcase/AccordionShowcase.qml
        Showcase/ButtonShowcase/ButtonShowcase.qml
        Showcase/ButtonShowcase/ButtonGroup.qml

    SOURCES
        DevTools/FileWatcher.h
        DevTools/FileWatcher.cpp
        DevTools/CustomEngine.h
        DevTools/CustomEngine.cpp
)

set(QML_IMPORT_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../")

# Add the QML import path to the QML_IMPORT_PATH environment variable
list(APPEND ENV{QML_IMPORT_PATH} "${QML_IMPORT_PATH}")

# Add the QML import path to the CMake include directories
include_directories(${QML_IMPORT_PATH})

add_subdirectory(../MMaterial ./MMaterial)
target_link_libraries(appMaterialTester
    PRIVATE Qt6::Quick Qt::Gui MMaterialLibplugin
)

set_target_properties(appMaterialTester PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

install(TARGETS appMaterialTester
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
