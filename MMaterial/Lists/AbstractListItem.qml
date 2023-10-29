import QtQuick 
import "../Colors"

Rectangle {
    property bool containsMouse: _mouseArea.containsMouse
    property alias mouseArea: _mouseArea
    property bool selected: ListView.isCurrentItem

    signal clicked

    opacity: 1
    radius: 8

    onClicked: {
        if(typeof index !== "undefined")
            ListView.view.currentIndex = index;
        else if(typeof ObjectModel.index !== "undefined")
            ListView.view.currentIndex = ObjectModel.index;
    }

    states: [
        //states based on this _mouseArea.pressed || selected ? Theme.action.selected : _listItem.containsMouse ? Theme.action.hover : Theme.background.main
        State {
            name: "disabled"
            when: !_listItem.enabled
            PropertyChanges {
                target: _listItem
                color: Theme.action.disabled
                opacity: 0.4
            }
        },
        State {
            name: "pressed"
            when: _mouseArea.pressed
            PropertyChanges {
                target: _listItem
                color: Theme.action.selected
            }
        },
        State {
            name: "hovered"
            when: _listItem.containsMouse && !_mouseArea.pressed
            PropertyChanges {
                target: _listItem
                color: Theme.action.hover
            }
        },
        State {
            name: "selected"
            when: _listItem.selected
            PropertyChanges {
                target: _listItem
                color: Theme.action.selected
            }
        },
        State {
            name: "enabled"
            when: _listItem.enabled
            PropertyChanges {
                target: _listItem
                color: Theme.background.main
            }
        }
    ]

    MouseArea{
        id: _mouseArea

        anchors.fill: parent

        hoverEnabled: _listItem.enabled
        cursorShape: Qt.PointingHandCursor

        onClicked: _listItem.clicked()
    }
}
