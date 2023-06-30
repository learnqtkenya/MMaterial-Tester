import QtQuick 2.15
import QtQuick.Layouts

import "../Settings"
import "../Icons"
import "../Colors"

Rectangle{
    id: _button

    Layout.preferredHeight: recommendedHeight
    Layout.preferredWidth: recommendedWidth
    height: recommendedHeight
    width: recommendedWidth

    radius: 8
    opacity: mouseArea.pressed ? 0.7 : 1 //TODO replace with ripple effect when OpacityMask is fixed in Qt6
    border.width: Size.pixel1

    property bool checked: false
    property alias mouseArea: mouseArea
    property var accent: Theme.info //Needs to be PaletteBasic type

    property real recommendedHeight
    property real recommendedWidth

    property int size: Size.Grade.L

    property alias icon: _icon

    signal clicked

    Icon{
        id: _icon
        anchors.centerIn: parent
        path: IconList.logo
        visible: path != ""
    }

    //Non-Visual elements
    MouseArea{
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
        enabled: !_button.isLoading
        onClicked: { _button.clicked(); _button.checked = !_button.checked; }
    }

    Item{
        id: _sizeStates
        state: "L"
        states: [
            State{
                when: _button.size == Size.Grade.L
                name: "L"
                PropertyChanges{ target: _button; recommendedHeight: 56 * Size.scale; recommendedWidth: recommendedHeight }
                PropertyChanges{ target: _icon; sourceSize.width: Size.pixel24 }
            },
            State{
                when: _button.size == Size.Grade.M
                name: "M"
                PropertyChanges{ target: _button; recommendedHeight: 48 * Size.scale; recommendedWidth: recommendedHeight }
                PropertyChanges{ target: _icon; sourceSize.width: Size.pixel24 }
            },
            State{
                when: _button.size == Size.Grade.S
                name: "S"
                PropertyChanges{ target: _button; recommendedHeight: 36 * Size.scale; recommendedWidth: recommendedHeight }
                PropertyChanges{ target: _icon; sourceSize.width: Size.pixel20 }
            },
            State{
                when: true
                name: "Custom"
            }
        ]
    }

    state: ""
    states: [
        State{
            when: !_button.enabled
            name: "Disabled"
            PropertyChanges{ target: _button; opacity: 1; border.color: Theme.action.disabledBackground; color: Theme.action.selected }
            PropertyChanges{ target: _icon; color: Theme.action.disabled; }
        },
        State{
            when: _button.checked
            name: "Checked"
            PropertyChanges{ target: _button; opacity: 1; border.color: _button.accent.main; color: _button.accent.transparent.p8 }
            PropertyChanges{ target: _icon; color: _button.accent.main; }
        },
        State{
            when: !_button.checked
            name: "Unchecked"
            PropertyChanges{ target: _button; opacity: 1; border.color: Theme.main.transparent.p24; color: "transparent" }
            PropertyChanges{ target: _icon; color: Theme.action.active; }
        }
    ]
}
