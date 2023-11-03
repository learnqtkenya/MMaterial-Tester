import QtQuick

IconBase {
    id: _root

    Text {
        anchors.centerIn: parent

        text: _root.iconData.path
        color: _root.color

        font {
            pixelSize: _root.size
            family: IconFont.name
        }
    }
}


