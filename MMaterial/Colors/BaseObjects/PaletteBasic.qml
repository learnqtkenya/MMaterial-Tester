import QtQuick

QtObject{
    id: _paletteBasic
    property color lighter: Qt.lighter(main, 1.6)
    property color light: Qt.lighter(main, 1.3)
    required property color main
    property color dark: Qt.darker(main, 1.3)
    property color darker: Qt.darker(main, 1.6)
    required property color contrastText

    property PaletteTransparent transparent: PaletteTransparent{
        mainColor: _paletteBasic.main
    }
}
