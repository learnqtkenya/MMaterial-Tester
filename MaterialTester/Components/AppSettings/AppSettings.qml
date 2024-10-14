import QtQuick 
import QtQuick.Controls.Material
import QtQuick.Effects
import QtQuick.Layouts

import MMaterial

Drawer {
    id: _appSettings

    function toggle() : void {
        if(_appSettings.opened)
            _appSettings.close();
        else
            _appSettings.open();
    }

    edge: Qt.RightEdge
    interactive: false
    modal: false
    dim: false

    width: 300 * Size.scale
    height: Screen.height

    background: Rectangle {
        gradient: Gradient {
            orientation: Gradient.Vertical

            GradientStop { position: 0.0; color: Theme.background.paper }
            GradientStop { position: 1.0; color: Theme.background.main }
        }
    }

    RowLayout {
        id: _header

        anchors{
            left: parent.left; leftMargin: Size.pixel18
            right: parent.right; rightMargin: Size.pixel18
            top: parent.top
        }

        height: Size.scale * 60

        Overline {
            id: _title

            Layout.preferredHeight: _header.height
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            Layout.fillWidth: true

            text: qsTr("Settings")
            verticalAlignment: Qt.AlignVCenter
            color: Theme.text.secondary
            font.pixelSize: Size.pixel16
        }

        Icon {
            Layout.alignment: Qt.AlignVCenter

            iconData: Icons.light.close
            size: Size.pixel14
            color: Theme.main.p600
            interactive: true

            onClicked: _appSettings.toggle()
        }
    }

    Rectangle { id: _splitter; height: Size.pixel1; width: parent.width; color: Theme.main.p300; anchors { top: _header.bottom; topMargin: Size.pixel4 } }

    ColumnLayout {
        anchors {
            top: _header.bottom; bottom: parent.bottom
            left: parent.left; right: parent.right
            margins: Size.pixel18
        }

        TwoChoices {
            text: qsTr("Mode")

            leftButton {
                icon.iconData: Icons.light.lightMode
                onClicked: Theme.currentTheme = LightTheme;
                checked: Theme.currentTheme == LightTheme;
            }

            rightButton {
                icon.iconData: Icons.light.darkMode
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
