import QtQuick
import QtQuick.Layouts

import "../Settings"
import "../Colors"
import "../Fonts/Texts"

Overline {
    Layout.preferredHeight: Size.scale * 50
    Layout.leftMargin: Size.pixel16
    Layout.bottomMargin: Size.pixel8
    verticalAlignment: Qt.AlignBottom
    color: Theme.text.secondary
    font.pixelSize: Size.pixel11
}
