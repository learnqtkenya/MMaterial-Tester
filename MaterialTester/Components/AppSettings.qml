import QtQuick 
import QtQuick.Controls.Material
import QtQuick.Layouts

import MMaterial.UI as UI
import MMaterial.Media as Media

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

    width: 300 * UI.Size.scale
    height: Screen.height

    background: Rectangle {
        gradient: Gradient {
            orientation: Gradient.Vertical

            GradientStop { position: 0.0; color: UI.Theme.background.paper }
            GradientStop { position: 1.0; color: UI.Theme.background.main }
        }
    }

    RowLayout {
        id: _header

        anchors{
            left: parent.left; leftMargin: UI.Size.pixel18
            right: parent.right; rightMargin: UI.Size.pixel18
            top: parent.top
        }

        height: UI.Size.scale * 60

        UI.Overline {
            id: _title

            Layout.preferredHeight: _header.height
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            Layout.fillWidth: true

            text: qsTr("Settings")
            verticalAlignment: Qt.AlignVCenter
            color: UI.Theme.text.secondary
            font.pixelSize: UI.Size.pixel16
        }

        Media.Icon {
            Layout.alignment: Qt.AlignVCenter

            iconData: Media.Icons.light.close
            size: UI.Size.pixel14
			color: UI.Theme.main.p600.toString()
            interactive: true

            onClicked: _appSettings.toggle()
        }
    }

    Rectangle { id: _splitter; height: UI.Size.pixel1; width: parent.width; color: UI.Theme.main.p300; anchors { top: _header.bottom; topMargin: UI.Size.pixel4 } }

    ColumnLayout {
        anchors {
            top: _header.bottom; bottom: parent.bottom
            left: parent.left; right: parent.right
            margins: UI.Size.pixel18
        }

        TwoChoices {
            text: qsTr("Mode")

            leftButton {
                icon.iconData: Media.Icons.light.lightMode
				onClicked: UI.Theme.currentTheme = UI.LightTheme;
				checked: UI.Theme.currentTheme == UI.LightTheme;
            }

            rightButton {
                icon.iconData: Media.Icons.light.darkMode
				onClicked: UI.Theme.currentTheme = UI.DarkTheme;
				checked: UI.Theme.currentTheme == UI.DarkTheme;
            }
        }

        SubTitle {
            text: qsTr("Presets")
        }

        GridLayout {
            Layout.fillWidth: true

            columns: 3

            rowSpacing: UI.Size.pixel16
            columnSpacing: UI.Size.pixel16

			PresetButton{ accent: UI.BasicBlue }
			PresetButton{ accent: UI.BasicGreen }
			PresetButton{ accent: UI.BasicLightBlue }
			PresetButton{ accent: UI.BasicOrange }
			PresetButton{ accent: UI.BasicPurple }
			PresetButton{ accent: UI.BasicRed }
        }

        Item { Layout.fillHeight: true; }
    }
}
