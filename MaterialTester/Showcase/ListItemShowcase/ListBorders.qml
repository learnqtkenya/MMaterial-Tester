import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import MMaterial

Rectangle{
    id: _rect

    property alias listView: _listView
    Layout.fillHeight: true
    Layout.maximumHeight: listView.childrenRect.height + radius*2
    Layout.fillWidth: true
    Layout.minimumHeight: Size.scale* 110
    color: "transparent"
    border.width: 2
    border.color: Theme.action.disabledBackground
    radius: 8

    ListView{
        id: _listView
        clip: true
        anchors {
            fill: parent
            margins: parent.border.width + parent.radius
        }
    }
}
