import QtQuick

import MMaterial

Item {
    anchors.horizontalCenter: parent ? parent.horizontalCenter : null

    width: Size.pixel24
    height: Size.pixel10

    Rectangle {
        anchors.centerIn: parent
        width: parent.width
        height: Size.pixel1
        color: Theme.other.divider
    }
}
