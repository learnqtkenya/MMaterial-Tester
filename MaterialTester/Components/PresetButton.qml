import QtQuick 
import QtQuick.Layouts

import MMaterial.Controls as Controls
import MMaterial.UI as UI

Controls.MToggleButton {
    id: _button

	property UI.PaletteBasic accent: UI.BasicBlue

    Layout.fillWidth: true;
    Layout.preferredHeight: width * 0.8

    customCheckImplementation: true
    checked: UI.Theme.primary == accent
    icon.visible: false

    onClicked: UI.Theme.currentTheme.primary = _button.accent

    Rectangle {
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
}
