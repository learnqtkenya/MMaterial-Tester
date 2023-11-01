import QtQuick
import QtQuick.Layouts

import MMaterial

Item {
    property alias text: _label.text

    height: Size.scale * 50

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
