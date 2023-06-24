import QtQuick 2.15
import "../Fonts/Texts"
import "../Colors"

Rectangle{
    id: badge
    radius: 100
    height: pixelSize
    width: pixelSize
    color: accent.main

    property var accent: Theme.error //Needs to be PaletteBasic type
    property int pixelSize: 24
}
