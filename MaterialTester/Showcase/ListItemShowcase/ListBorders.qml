import QtQuick 2.15
import QtQuick.Layouts

import MMaterial

Rectangle{
    id: _rect

    property alias listView: _listView
    Layout.fillHeight: true
    Layout.maximumHeight: listView.childrenRect.height + radius*2
    Layout.fillWidth: true
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
