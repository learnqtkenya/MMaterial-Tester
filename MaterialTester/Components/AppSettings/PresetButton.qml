import QtQuick 
import QtQuick.Layouts

import MMaterial

MToggleButton{
    id: _button
    Layout.fillWidth: true;
    Layout.preferredHeight: width * 0.8
    customCheckImplementation: true
    checked: Theme.primary == accent
    property var accent: BasicBlue
    icon.visible: false

    Rectangle{
        id: _circle
        anchors.centerIn: parent
        height: parent.height * 0.2
        width: height
        color: _button.accent.main
        radius: 100

        state: "off"
        states: [
            State {
                name: "on"
                when: _button.checked
                PropertyChanges { target: _circle; scale: 2; }
            },
            State {
                name: "off"
                when: true
                PropertyChanges { target: _circle; scale: 1 }
            }
        ]

        transitions: [
            Transition {
                NumberAnimation {
                    properties: "scale"
                    duration: 300
                    easing.type: Easing.InOutQuad
                }
            }
        ]
    }

    onClicked: Theme.currentTheme.primary = _button.accent
}
