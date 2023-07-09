import QtQuick
import QtQuick.Layouts

import "../Settings"
import "../Colors"
import "../Fonts/Texts"

Item{
    height: Size.scale * 50
    property alias text: _label.text
    Overline {
        id: _label
        anchors{
            fill: parent
            bottomMargin: Size.pixel8
            leftMargin: Size.pixel16
        }
        verticalAlignment: Qt.AlignBottom
        color: Theme.text.secondary
        font.pixelSize: Size.pixel11
    }
}
