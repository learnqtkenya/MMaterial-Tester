import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material

import MMaterial

Rectangle {
    id: _rect

    property alias listView: _listView

    Layout.fillHeight: true
    Layout.maximumHeight: listView.childrenRect.height + radius*2
    Layout.fillWidth: true
    Layout.minimumHeight: Size.scale* 110

    color: "transparent"
    radius: 8

    border {
        width: 2
        color: Theme.action.disabledBackground
    }

    ListView {
        id: _listView

        anchors {
            fill: parent
            margins: parent.border.width + parent.radius
        }

        clip: true
    }
}
