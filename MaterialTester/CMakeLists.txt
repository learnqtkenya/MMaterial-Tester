cmake_minimum_required(VERSION 3.16)

project(MaterialTester VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.7 REQUIRED COMPONENTS Quick)
qt_standard_project_setup(REQUIRES 6.7)

qt_add_executable(appMaterialTester
    main.cpp
)

qt_add_qml_module(appMaterialTester
    URI MaterialTester
    IMPORTS
        MaterialTester.Components
        MaterialTester.Showcase

    QML_FILES
        Main.qml
        MainWindow.qml
        Placeholder.qml

    SOURCES
        DevTools/FileWatcher.h
        DevTools/FileWatcher.cpp
        DevTools/CustomEngine.h
        DevTools/CustomEngine.cpp
        src/Icons/IconList.h
        src/Icons/IconList.cpp
        DevTools/Clipboard.h
)

add_subdirectory(Components)
add_subdirectory(Showcase)
add_subdirectory(MMaterial)

target_include_directories(appMaterialTester PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/src/Icons
    ${CMAKE_CURRENT_SOURCE_DIR}/DevTools
)

set_target_properties(MMaterialLib PROPERTIES AUTOMOC ON)
target_link_libraries(appMaterialTester
    PRIVATE Qt6::Quick Qt::Gui
)

set_target_properties(appMaterialTester PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER com.mmaterial.appMaterialTester
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

if (EMSCRIPTEN)

    set(MM_INSTALL_FILES
        "$<TARGET_FILE_DIR:appMaterialTester>/appMaterialTester.js"
        "$<TARGET_FILE_DIR:appMaterialTester>/appMaterialTester.wasm"
        "$<TARGET_FILE_DIR:appMaterialTester>/appMaterialTester.html"
        "$<TARGET_FILE_DIR:appMaterialTester>/qtloader.js"
    )

    # if (MM_ENABLE_THREADING)
    #     list(APPEND ALP_INSTALL_FILES "$<TARGET_FILE_DIR:alpineapp>/alpineapp.worker.js")
    # endif()
    install(FILES ${MM_INSTALL_FILES} DESTINATION ${CMAKE_INSTALL_PREFIX})
else()
    install(TARGETS appMaterialTester
        BUNDLE DESTINATION .
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    )
endif()

