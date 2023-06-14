qt_add_library(FontsLib STATIC)

set_target_properties(FontsLib PROPERTIES AUTOMOC ON)
target_link_libraries(FontsLib PRIVATE Qt6::Quick)

list(APPEND MODULE_ASSETS
    Families/PublicSans/PublicSans-ExtraBold.ttf
    Families/PublicSans/PublicSans-Bold.ttf
    Families/PublicSans/PublicSans-SemiBold.ttf
    Families/PublicSans/PublicSans-Medium.ttf
    Families/PublicSans/PublicSans-Regular.ttf
    Families/PublicSans/PublicSans-Light.ttf
    Families/PublicSans/PublicSans-ExtraLight.ttf
)

list(APPEND MODULE_QML_FILES
    PublicSans.qml
    BaseFont.qml
    Texts/H1.qml
    Texts/H2.qml
    Texts/H3.qml
    Texts/H4.qml
    Texts/H5.qml
    Texts/H6.qml
    Texts/Subtitle1.qml
    Texts/Subtitle2.qml
    Texts/B1.qml
    Texts/B2.qml
    Texts/Caption.qml
    Texts/Overline.qml
)

set_source_files_properties(PublicSans.qml
    PROPERTIES QT_QML_SINGLETON_TYPE TRUE
)

set_source_files_properties(BaseFont.qml PROPERTIES HEADER_FILE_ONLY TRUE)

qt_add_qml_module(FontsLib
    URI Fonts
    VERSION 1.0
    QML_FILES ${MODULE_QML_FILES}
    RESOURCES ${MODULE_ASSETS}
)

# Function to add a QML file to the list as a private file


