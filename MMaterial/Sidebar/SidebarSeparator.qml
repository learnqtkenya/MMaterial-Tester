import QtQuick

import MMaterial

Item {
    width: Size.pixel24
    height: Size.pixel10
    anchors.horizontalCenter: parent ? parent.horizontalCenter : null

    Rectangle{
        anchors.centerIn: parent
        width: parent.width
        height: Size.pixel1
        color: Theme.other.divider
    }
}
