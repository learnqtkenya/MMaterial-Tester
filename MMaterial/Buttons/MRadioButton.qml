import QtQuick
import QtQuick.Layouts

import MMaterial

Item {
    id: _root

    property var accent: Theme.primary
    property alias checked: _radioButton.checked
    property alias customCheckImplementaiton: _radioButton.customCheckImplementation
    property alias text: _label.text
    property alias label: _label

    signal clicked

    implicitHeight: Size.pixel24
    implicitWidth: implicitHeight + (_label.visible ? (_label.anchors.leftMargin + _label.implicitWidth) : 0)

    Checkable{
        id: _radioButton

        height: _root.height
        width: height

        radius: 100
        color: "transparent"

        border{
            width: Size.pixel1
            color: _root.enabled ?  (_radioButton.checked ? _root.accent.main : Theme.action.active) : Theme.action.disabled
        }

        onClicked: _root.clicked();

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

        Rectangle {
            id: _highlight

            anchors.centerIn: _radioButton

            height: _radioButton.height * 1.9
            width: height

            radius: height
            visible: _radioButton.mouseArea.containsMouse
            color: _radioButton.checked ? _root.accent.transparent.p8 : Theme.action.hover
        }

        Rectangle {
            id: _innerCircle

            anchors{
                fill: _radioButton
                margins: _radioButton.height * 0.2
            }

            radius: _radioButton.radius
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
    }

    B2 {
        id: _label

        anchors{
            left: _radioButton.right; leftMargin: Size.pixel12
            right: _root.right
        }

        height: _root.height

        visible: text != ""
        verticalAlignment: Qt.AlignVCenter
        maximumLineCount: 1
        elide: Text.ElideRight
        wrapMode: Text.NoWrap
    }
}
