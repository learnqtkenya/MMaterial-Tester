import QtQuick

QtObject{
    id: _paletteBasic
    required property color lighter
    required property color light
    required property color main
    required property color dark
    required property color darker
    required property color contrastText

    property PaletteTransparent transparent: PaletteTransparent{
        mainColor: _paletteBasic.main
    }
}
