import QtQuick 
import QtQuick.Controls
import QtQuick.Effects
import QtQuick.Layouts

import MMaterial

Item {
    id: _appSettings

    property bool isOpen: false

    function toggle() : void {
        _appSettings.isOpen = !_appSettings.isOpen;
    }

    anchors{
        right: parent.right
        rightMargin: 0
    }

    width: 300 * Size.scale
    height: parent.height

    layer{
        effect: MultiEffect{
            shadowEnabled: true
            shadowBlur: 3
            shadowHorizontalOffset: 2
            shadowVerticalOffset: 5

        }
    }

    states: [
        State{
            when: _appSettings.isOpen
            name: "open"
            PropertyChanges{
                target: _appSettings
                anchors.rightMargin: 0
                visible: true
                layer.enabled: true
            }
        },
        State{
            when: true
            name: "closed"
            PropertyChanges{
                target: _appSettings
                visible: false
                anchors.rightMargin: -_appSettings.width
                layer.enabled: false
            }
        }
    ]

    transitions: [
        Transition{
            from: "open"
            to: "closed"
            SequentialAnimation{
                NumberAnimation{
                    target: _appSettings
                    property: "anchors.rightMargin"
                    duration: 200
                    easing.type: Easing.InOutQuad
                }
                NumberAnimation{
                    target: _appSettings
                    property: "visible"
                    duration: 0
                }
                NumberAnimation{
                    target: _appSettings
                    property: "layer.enabled"
                    duration: 0
                }
            }
        },
        Transition{
            from: "closed"
            to: "open"
            SequentialAnimation{
                NumberAnimation{
                    target: _appSettings
                    property: "layer.enabled"
                    duration: 0
                }
                NumberAnimation{
                    target: _appSettings
                    property: "visible"
                    duration: 0
                }
                NumberAnimation{
                    target: _appSettings
                    property: "anchors.rightMargin"
                    duration: 200
                    easing.type: Easing.InOutQuad
                }
            }
        }
    ]

    Rectangle {
        id: _background

        anchors.fill: parent

        color: Theme.background.paper //TODO: Add shadow
    }

    RowLayout {
        id: _header

        anchors{
            left: parent.left; leftMargin: Size.pixel18
            right: parent.right; rightMargin: Size.pixel12
            top: parent.top
        }

        height: Size.scale * 80

        H4 {
            id: _title

            Layout.preferredHeight: parent.height
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            Layout.fillWidth: true

            text: qsTr("Settings")
            verticalAlignment: Qt.AlignVCenter
            color: Theme.text.primary
            font.bold: true
        }

        Icon {
            Layout.alignment: Qt.AlignVCenter

            path: IconList.closeX
            sourceSize.height: Size.pixel14
            color: Theme.main.p600
            interactive: true

            onClicked: _appSettings.toggle()
        }
    }

    Rectangle { id: _splitter; height: Size.pixel1; width: parent.width; color: Theme.main.p600; anchors { top: _header.bottom; topMargin: Size.pixel4 } }

    ColumnLayout {
        anchors {
            top: _header.bottom; bottom: parent.bottom
            left: parent.left; right: parent.right
            margins: Size.pixel18
        }

        TwoChoices {
            text: qsTr("Mode")

            leftButton {
                icon.path: IconList.sun
                onClicked: Theme.currentTheme = LightTheme;
                checked: Theme.currentTheme == LightTheme;
            }

            rightButton {
                icon.path: IconList.moon
                onClicked: Theme.currentTheme = DarkTheme;
                checked: Theme.currentTheme == DarkTheme;
            }
        }

        SubTitle {
            text: qsTr("Presets")
        }

        GridLayout {
            Layout.fillWidth: true

            columns: 3

            rowSpacing: Size.pixel16
            columnSpacing: Size.pixel16

            PresetButton{ accent: BasicBlue }
            PresetButton{ accent: BasicGreen }
            PresetButton{ accent: BasicLightBlue }
            PresetButton{ accent: BasicOrange }
            PresetButton{ accent: BasicPurple }
            PresetButton{ accent: BasicRed }
        }

        Item { Layout.fillHeight: true; }
    }
}
