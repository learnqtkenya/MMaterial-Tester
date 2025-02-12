import QtQuick

import MMaterial.Media as Media
import MMaterial.UI as UI
import MMaterial.Controls as Controls

import QtQuick.Controls
import QtQuick.Layouts

Item {
	id: _root

	component Title: UI.Overline {
		Layout.alignment: Qt.AlignLeft
		Layout.fillWidth: true
		Layout.bottomMargin: -UI.Size.pixel18
		Layout.leftMargin: UI.Size.pixel6
		color: UI.Theme.text.disabled
		font.capitalization: Font.AllUppercase
	}

	ColumnLayout {
		id: controlLayout

		width: _root.width
		spacing: UI.Size.pixel8

		RowLayout {
			Layout.fillWidth: true
			Layout.maximumWidth: 250

			Controls.MFabButton {
				text: "-"
				type: Controls.MFabButton.Outlined
				onClicked: if (button.model.length > 0) button.model.pop();
			}
			UI.Overline {
				text: button.model.length
				font.pixelSize: UI.Size.pixel26
				verticalAlignment: Qt.AlignVCenter
				horizontalAlignment: Qt.AlignHCenter
				Layout.fillWidth: true
			}
			Controls.MFabButton {
				text: "+"
				onClicked: {
					button.model.push({
						"name" : qsTr("Item") + " " + (button.model.length + 1),
						"icon" : Media.Icons.light.paid,
						"onClicked" : () => Controls.AlertController.alert("You have selected " + button.model[button.model.length - 1].name + " as your payment method.")
					})
				}

			}
		}

		Title { text: qsTr("Start angle") }

		Controls.MSlider {
			id: startDegreeSlider

			Layout.fillWidth: true

			from: 0
			to: endDegreeSlider.value
			value: 130

			onValueChanged: {
				button.startDegree = value
			}
		}

		Title { text: qsTr("End angle") }

		Controls.MSlider {
			id: endDegreeSlider

			Layout.fillWidth: true

			from: startDegreeSlider.value
			to: 360
			value: 230
		}

		Title { text: qsTr("Scale") }

		Controls.MSlider {
			id: spacingSlider

			Layout.fillWidth: true

			from: 0.5
			to: 2
			value: 1
		}

		Title { text: qsTr("Behavior: "); Layout.bottomMargin: -UI.Size.pixel4 }

		Controls.MSwitch {
			Layout.leftMargin: UI.Size.pixel6
			checked: button.mobileMode
			label.text: button.mobileMode ? qsTr("Mobile") : qsTr("Desktop")
			onCheckedChanged: button.mobileMode = !button.mobileMode
		}
	}

	Item {
		id: buttonContainer

		anchors {
			top: controlLayout.bottom
			bottom: _root.bottom
			left: _root.left
			right: _root.right
		}

		Controls.MultiStateButton {
			id: button

			size: UI.Size.Grade.S
			anchors.centerIn: buttonContainer
			icon.iconData: Media.Icons.light.shoppingCart
			startDegree: startDegreeSlider.value
			endDegree: endDegreeSlider.value
			spacing: spacingSlider.value
			popup {
				visible: (button.mobileMode ? button.mouseArea.pressed : button.checked) || startDegreeSlider.pressed || endDegreeSlider.pressed || spacingSlider.pressed
			}

			model: [
				{
					"name" : qsTr("Cash"),
					"icon" : Media.Icons.light.attachMoney,
					"onClicked" : () => Controls.AlertController.alert("You have selected Cash as your payment method.")
				},
				{
					"name" : qsTr("Card"),
					"icon" : Media.Icons.light.creditCard,
					"onClicked" : () =>  Controls.AlertController.alert("You have selected Card as your payment method.")

				},
				{
					"name" : qsTr("Bitcoin"),
					"icon" : Media.Icons.light.currencyBitcoin,
					"onClicked" : () => Controls.AlertController.alert("You have selected Bitcoin as your payment method.")
				}
			]
		}
	}



}
