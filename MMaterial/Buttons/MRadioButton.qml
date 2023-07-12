import QtQuick 2.15
import QtQuick.Layouts

import MMaterial

Checkable{
    id: _radioButton
    Layout.preferredHeight: size
    Layout.preferredWidth: size
    height: size
    width: size
    radius: 100
    color: "transparent"
    border{
        width: Size.pixel1
        color: _radioButton.enabled ? _radioButton.accent.main : Theme.action.disabled
    }
    property var accent: Theme.primary
    property real size: Size.pixel20

    Rectangle{
        id: _highlight
        anchors {
            centerIn: parent
        }
        height: _radioButton.height * 1.9
        width: height
        radius: height
        visible: _radioButton.mouseArea.containsMouse
        color: _radioButton.accent.transparent.p8
    }

    Rectangle{
        id: _innerCircle
        anchors{
            fill: parent
            margins: parent.height * 0.2
        }
        radius: parent.radius
        color: _radioButton.border.color
        states: [
            State {
                when: _radioButton.checked
                name: "checked"
                PropertyChanges {
                    target: _innerCircle
                    scale: 1
                }
            },
            State {
                when: true
                name: "unchecked"
                PropertyChanges {
                    target: _innerCircle
                    scale: 0
                }
            }
        ]
        transitions: [
            //scale elastic animation
            Transition {
                from: "unchecked"
                NumberAnimation {
                    target: _innerCircle
                    property: "scale"
                    duration: 150
                    easing.type: Easing.OutQuad
                }
            },
            Transition {
                from: "checked"
                NumberAnimation {
                    target: _innerCircle
                    property: "scale"
                    duration: 150
                    easing.type: Easing.OutQuad
                }
            }
        ]
    }

    states: [
        //pressed and released
        State {
            when: _radioButton.mouseArea.pressed
            name: "pressed"
            PropertyChanges {
                target: _radioButton
                scale: 1.1
            }
        },
        State {
            when: _radioButton.mouseArea.released
            name: "released"
            PropertyChanges {
                target: _radioButton
                scale: 1
            }
        }
    ]

    transitions: [
        //scale elastic animation
        Transition {
            from: "released"
            NumberAnimation {
                target: _radioButton
                property: "scale"
                duration: 200
                easing.type: Easing.OutQuad
            }
        },
        Transition {
            from: "pressed"
            NumberAnimation {
                target: _radioButton
                property: "scale"
                duration: 1200
                easing.type: Easing.OutElastic
            }
        }
    ]
}
