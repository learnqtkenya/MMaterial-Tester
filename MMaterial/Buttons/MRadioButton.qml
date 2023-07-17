import QtQuick 2.15
import QtQuick.Layouts

import MMaterial

Item{
    id: _radioButtonRoot

    height: recommendedHeight
    width: recommendedWidth
    Layout.preferredHeight: recommendedHeight
    Layout.preferredWidth: recommendedWidth

    property real recommendedWidth: height + _label.anchors.leftMargin + _label.implicitWidth
    property real recommendedHeight: Size.pixel20

    property var accent: Theme.primary
    property alias checked: _radioButton.checked
    property alias customCheckImplementaiton: _radioButton.customCheckImplementation
    property alias text: _label.text
    property alias label: _label

    signal clicked

    Checkable{
        id: _radioButton
        height: parent.height
        width: height
        radius: 100
        color: "transparent"
        border{
            width: Size.pixel1
            color: _radioButtonRoot.enabled ?  (_radioButton.checked ? _radioButtonRoot.accent.main : Theme.action.active) : Theme.action.disabled
        }

        onClicked: _radioButtonRoot.clicked();
        Rectangle{
            id: _highlight
            anchors {
                centerIn: parent
            }
            height: _radioButton.height * 1.9
            width: height
            radius: height
            visible: _radioButton.mouseArea.containsMouse
            color: _radioButton.checked ? _radioButtonRoot.accent.transparent.p8 : Theme.action.hover
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
    B2{
        id: _label
        visible: text != ""
        anchors{
            left: _radioButton.right; leftMargin: Size.pixel12
            right: parent.right
        }
        verticalAlignment: Qt.AlignVCenter
        height: parent.height
        maximumLineCount: 1
        elide: Text.ElideRight
        wrapMode: Text.NoWrap
    }
}
