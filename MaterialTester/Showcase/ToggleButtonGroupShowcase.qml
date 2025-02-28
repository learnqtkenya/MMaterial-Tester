import QtQuick

import MMaterial.Media as Media
import MMaterial.UI as UI
import MMaterial.Controls as Controls

import QtQuick.Layouts

ColumnLayout {
	spacing: UI.Size.pixel16

	UI.H6 { text: qsTr("Toggle Group") }

	Controls.MSwitch {
		id: orientationSwitch

		property int orientation: Qt.Horizontal

		label.text: orientationSwitch.checked ? "Horizontal" : "Vertical"
		customCheckImplementation: true
		checked: orientationSwitch.orientation === Qt.Horizontal

		onClicked: {
			orientationSwitch.orientation = orientationSwitch.orientation === Qt.Horizontal ? Qt.Vertical : Qt.Horizontal
		}
	}

	Controls.ToggleButtonGroup {
		id: toggleGroup

		property string selected: ""

		Layout.topMargin: UI.Size.pixel16
		orientation: orientationSwitch.orientation

		model: ObjectModel {

			Controls.ToggleButtonGroup.GroupButton {
				checked: toggleGroup.selected == "palette"
				icon.iconData: Media.Icons.light.palette

				onClicked: {
					toggleGroup.selected = "palette"
				}
			}
			Controls.ToggleButtonGroup.GroupButton {
				checked: toggleGroup.selected == "settings"
				icon.iconData: Media.Icons.light.settings

				onClicked: {
					toggleGroup.selected = "settings"
				}
			}
		}
	}

	Controls.ToggleButtonGroup {
		id: toggleGroup2

		property int selectedIndex: 0

		orientation: orientationSwitch.orientation
		model: toggleGroup.selected == "palette" ? themeModel : connectivityModel
		visible: toggleGroup.selected !== ""
	}

	Item { Layout.fillHeight: true }

	ObjectModel {
		id: themeModel

		Controls.ToggleButtonGroup.GroupButton {
			icon.iconData: Media.Icons.light.lightMode
			checked: toggleGroup2.selectedIndex === 0

			onClicked: {
				toggleGroup2.selectedIndex = 0
			}
		}
		Controls.ToggleButtonGroup.GroupButton {
			icon.iconData: Media.Icons.light.darkMode
			checked: toggleGroup2.selectedIndex === 1

			onClicked: {
				toggleGroup2.selectedIndex = 1
			}
		}
	}

	ObjectModel {
		id: connectivityModel

		Controls.ToggleButtonGroup.GroupButton {
			icon.iconData: Media.Icons.light.wifi
			customCheckImplementation: false
		}
		Controls.ToggleButtonGroup.GroupButton {
			icon.iconData: Media.Icons.light.bluetooth
			customCheckImplementation: false
		}
		Controls.ToggleButtonGroup.GroupButton {
			icon.iconData: Media.Icons.light.alarm
			customCheckImplementation: false
		}
		Controls.ToggleButtonGroup.GroupButton {
			icon.iconData: Media.Icons.light.eco
			customCheckImplementation: false
		}
	}
}
