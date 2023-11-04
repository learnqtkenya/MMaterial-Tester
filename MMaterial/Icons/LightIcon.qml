import QtQuick

IconBase {
    id: _root

    Text {
        anchors {
            centerIn: _root
            verticalCenterOffset: _root.height * 0.03
        }

        text: _root.iconData.path
        color: _root.color

        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter

        font {
            pixelSize: _root.size
            family: IconFont.name
        }
    }
}


