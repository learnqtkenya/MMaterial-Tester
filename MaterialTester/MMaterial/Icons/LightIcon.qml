import QtQuick

import MMaterial.Theme

IconBase {
    id: _root

    Text {
        anchors {
            centerIn: _root
        }

        text: _root.iconData.path
        color: _root.color == "" ? Theme.text.primary : _root.color

        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter

        font {
            pixelSize: _root.size
            family: IconFont.name
        }
    }
}


