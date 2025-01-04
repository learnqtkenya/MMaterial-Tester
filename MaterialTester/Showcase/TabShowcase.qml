import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material

import MMaterial.UI as UI
import MMaterial.Controls as Controls
import MMaterial.Media as Media

Flickable {
    objectName: "Typography"

    contentHeight: _mainLayout.implicitHeight
    contentWidth: width

	ScrollIndicator.vertical: Controls.MScrollIndicator{}

    ColumnLayout {
        id: _mainLayout

        anchors.fill: parent

		UI.Overline { text: qsTr("Tabs - No responsiveness yet"); color: UI.Theme.text.disabled }

		UI.Overline { text: qsTr("Text Tabs"); color: UI.Theme.text.disabled; Layout.topMargin: UI.Size.pixel30 }
		Controls.MTabs {
            Layout.fillWidth: true
            Layout.preferredHeight: UI.Size.pixel48

            model: ObjectModel {

				Controls.MTabButton {
                    text: "Text 1"
                }
				Controls.MTabButton {
                    text: "Longer text 1"
                }
				Controls.MTabButton {
                    text: "Text 2"
                }
            }
        }

		UI.Overline { text: qsTr("Left icon + text"); color: UI.Theme.text.disabled; Layout.topMargin: UI.Size.pixel20 }
		Controls.MTabs {
            Layout.fillWidth: true
            Layout.preferredHeight: UI.Size.pixel48

            model: ObjectModel {

				Controls.MTabButton {
                    text: "Icon tab 1"
					leftIcon.iconData: Media.Icons.heavy.logo
                }
				Controls.MTabButton {
                    text: "Icon tab 2"
					leftIcon.iconData: Media.Icons.heavy.logo
                }
				Controls.MTabButton {
                    text: "Icon tab 3"
					leftIcon.iconData: Media.Icons.heavy.logo
                }
            }
        }

		UI.Overline { text: qsTr("Right icon + text"); color: UI.Theme.text.disabled; Layout.topMargin: UI.Size.pixel20 }
		Controls.MTabs {
            Layout.fillWidth: true
            Layout.preferredHeight: UI.Size.pixel48

            model: ObjectModel {

				Controls.MTabButton {
                    text: "Icon tab 1"
					rightIcon.iconData: Media.Icons.heavy.logo
                }
				Controls.MTabButton {
                    text: "Icon tab 2"
					rightIcon.iconData: Media.Icons.heavy.logo
                }
				Controls.MTabButton {
                    text: "Icon tab 3"
					rightIcon.iconData: Media.Icons.heavy.logo
                }
            }
        }

		UI.Overline { text: qsTr("Right icon + left icon + text"); color: UI.Theme.text.disabled; Layout.topMargin: UI.Size.pixel20 }
		Controls.MTabs {
            Layout.fillWidth: true
            Layout.preferredHeight: UI.Size.pixel48

            model: ObjectModel {

				Controls.MTabButton {
                    text: "Icon tab 1"
					rightIcon.iconData: Media.Icons.heavy.logo
					leftIcon.iconData: Media.Icons.heavy.logo
                }
				Controls.MTabButton {
                    text: "Icon tab 2"
					rightIcon.iconData: Media.Icons.heavy.logo
					leftIcon.iconData: Media.Icons.heavy.logo
                }
				Controls.MTabButton {
                    text: "Icon tab 3"
					rightIcon.iconData: Media.Icons.heavy.logo
					leftIcon.iconData: Media.Icons.heavy.logo
                }
            }
        }

        Item { Layout.fillHeight: true; }
    }
}
