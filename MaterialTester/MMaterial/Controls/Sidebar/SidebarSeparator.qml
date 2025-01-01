import QtQuick

import MMaterial as MMaterial

Item {
    id: _root

    anchors.horizontalCenter: parent ? parent.horizontalCenter : null

    width: MMaterial.Size.pixel24
    height: MMaterial.Size.pixel10

    Rectangle {
        anchors.centerIn: _root

        width: _root.width
        height: MMaterial.Size.pixel1

        color: MMaterial.Theme.other.divider
    }
}
