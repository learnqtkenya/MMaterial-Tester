import QtQuick
import QtQuick.Layouts

import "../Settings"
import "../Icons"
import "../Colors"

Checkable{
    id: _checkbox

    property var accent: Theme.primary

    implicitHeight: Size.pixel24
    implicitWidth: Size.pixel24

    radius: 6

    state: "unchecked"
    states: [
        State {
            name: "checked"
            when: _checkbox.checked
            PropertyChanges { target: _checkbox; color: _checkbox.enabled ? _checkbox.accent.main : Theme.action.disabled; border.width: 0; }
        },
        State {
            name: "unchecked"
            when: !_checkbox.checked
            PropertyChanges { target: _checkbox; color: "transparent"; border { width: Size.pixel1*2; color: _checkbox.enabled ? Theme.action.active : Theme.action.disabled } }
        }
    ]

    Icon{
        id: _icon

        anchors.centerIn: parent

        sourceSize.height: _checkbox.height * 0.7
        path: IconList.checkmark
        color: Theme.background.main;
        visible: _checkbox.checked
    }

    Rectangle{
        id: _highlight

        anchors.centerIn: parent

        height: _checkbox.height * 1.9
        width: height

        radius: height
        visible: _checkbox.mouseArea.containsMouse
        color: _checkbox.accent.transparent.p8
    }

    Item{
        id: _substates

        state: "default"
        states: [
            State {
                when: _checkbox.mouseArea.pressed
                name: "pressed"
                PropertyChanges { target: _checkbox; scale: 0.85; }
                PropertyChanges { target: _highlight; color: _checkbox.accent.transparent.p24; }
            },
            State {
                when: true
                name: "default"
                PropertyChanges { target: _checkbox; scale: 1; }
                PropertyChanges { target: _highlight; color: _checkbox.accent.transparent.p8; }
            }
        ]
        transitions: [
            Transition {
                from: "pressed"
                NumberAnimation { target: _checkbox; properties: "scale"; duration: 1150; easing.type: Easing.OutElastic; }
                ColorAnimation { target: _highlight; duration: 300; easing.type: Easing.InOutQuad }
            },
            Transition {
                from: "default"
                NumberAnimation { target: _checkbox; properties: "scale"; duration: 70; }
                ColorAnimation { target: _highlight; duration: 300; easing.type: Easing.InOutQuad }
            }
        ]
    }
}
