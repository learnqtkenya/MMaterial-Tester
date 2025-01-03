import QtQuick
import QtQuick.Layouts

import MMaterial.UI as UI
import MMaterial.Controls as Controls

Item {
	objectName: "Controls.Badge"

    ColumnLayout {
        anchors.fill: parent

        UI.H6 { text: qsTr("Number") }

        GridLayout {
			id: numberBadgeGrid

            Layout.topMargin: UI.Size.pixel24
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 100 * UI.Size.scale

            columns: UI.Size.format == UI.Size.Format.Extended ? 7 : 4

            rowSpacing: UI.Size.pixel40
            columnSpacing: UI.Size.pixel40

			Controls.Badge {
				accent: UI.Theme.primary
				type: Controls.Badge.Type.Number
                onClicked: quantity = 0
            }

			Controls.Badge {
				accent: UI.Theme.secondary
				type: Controls.Badge.Type.Number

                onClicked: quantity = 0
            }

			Controls.Badge {
				accent: UI.Theme.info
				type: Controls.Badge.Type.Number

                onClicked: quantity = 0
            }

			Controls.Badge {
				accent: UI.Theme.success
				type: Controls.Badge.Type.Number

                onClicked: quantity = 0
            }

			Controls.Badge {
				accent: UI.Theme.warning
				type: Controls.Badge.Type.Number

                onClicked: quantity = 0
            }

			Controls.Badge {
				accent: UI.Theme.error
				type: Controls.Badge.Type.Number

                onClicked: quantity = 0
            }

			Controls.Badge {
				accent: UI.Theme.success
				type: Controls.Badge.Type.Number

                onClicked: quantity = 0
            }

			Controls.Badge {
				accent: UI.Theme.error
				type: Controls.Badge.Type.Number
                quantity: 1

                onClicked: quantity = 0
            }

			Controls.Badge {
				accent: UI.Theme.error
				type: Controls.Badge.Type.Number
                quantity: 1500
                maxQuantity: 99

                onClicked: quantity = 0
            }

			Controls.Badge {
				accent: UI.Theme.error
				type: Controls.Badge.Type.Number
                quantity: 1500
                maxQuantity: 999

                onClicked: quantity = 0
            }
        }

        UI.H6 {
            Layout.topMargin: UI.Size.pixel48

            text: qsTr("Dot")
        }

        GridLayout {
			id: dotBadgeGrid

            Layout.topMargin: UI.Size.pixel24
            Layout.preferredWidth: parent.width

            columns: UI.Size.format == UI.Size.Format.Extended ? 7 : 4

            rowSpacing: UI.Size.pixel40
            columnSpacing: UI.Size.pixel40

			Controls.Badge {
				accent: UI.Theme.primary

                onClicked: quantity = 0
            }

			Controls.Badge {
				accent: UI.Theme.secondary

                onClicked: quantity = 0
            }

			Controls.Badge {
				accent: UI.Theme.info

                onClicked: quantity = 0
            }

			Controls.Badge {
				accent: UI.Theme.success

                onClicked: quantity = 0
            }

			Controls.Badge {
				accent: UI.Theme.warning

                onClicked: quantity = 0
            }

			Controls.Badge {
				accent: UI.Theme.error

                onClicked: quantity = 0
            }

			Controls.Badge {
				accent: UI.Theme.success

                onClicked: quantity = 0
            }
        }

        Item { Layout.fillHeight: true; }
    }
}
