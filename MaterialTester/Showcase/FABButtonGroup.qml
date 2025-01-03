import QtQuick 
import QtQuick.Layouts

import MMaterial.UI as UI
import MMaterial.Controls as Controls
import MMaterial.Media as Media
import MaterialTester.Components as Components

ColumnLayout {
    id: groupRoot

    required property int buttonType
    required property string title

	UI.Subtitle1 {
        text: groupRoot.title
    }

	Components.TitleRow {
        title.text: qsTr("Color")

		Controls.MFabButton {
            type: groupRoot.buttonType
			accent: UI.Theme.primary
            text: "Primary"

            onClicked: isLoading = !isLoading
        }

		Controls.MFabButton {
            type: groupRoot.buttonType
			accent: UI.Theme.secondary
            text: "Secondary"

            onClicked: isLoading = !isLoading
        }

		Controls.MFabButton {
            type: groupRoot.buttonType
			accent: UI.Theme.info
            text: "Info"

            onClicked: isLoading = !isLoading
        }

		Controls.MFabButton {
            type: groupRoot.buttonType
			accent: UI.Theme.success
            text: "Success"

            onClicked: isLoading = !isLoading
        }

		Controls.MFabButton {
            type: groupRoot.buttonType
			accent: UI.Theme.warning
            text: "Warning"

            onClicked: isLoading = !isLoading
        }

		Controls.MFabButton {
            type: groupRoot.buttonType
			accent: UI.Theme.error
            text: "Error"

            onClicked: isLoading = !isLoading
        }
    }

	Components.TitleRow {
        title.text: qsTr("States")

		Controls.MFabButton {
            type: groupRoot.buttonType
			accent: UI.Theme.primary
            text: mouseArea.containsMouse ? "Hovered" : "Enabled"
        }

		Controls.MFabButton {
            enabled: false
            type: groupRoot.buttonType
			accent: UI.Theme.primary
            text: "Disabled"
        }
    }

	Components.TitleRow {
        title.text: qsTr("Icon")

		Controls.MFabButton {
            type: groupRoot.buttonType
			accent: UI.Theme.primary
            text: "Left Media.Icon"
            leftIcon.iconData: Media.Icons.heavy.logo
        }

		Controls.MFabButton {
            type: groupRoot.buttonType
			accent: UI.Theme.primary
            text: "Left and Right Media.Icon"
            leftIcon.iconData: Media.Icons.heavy.logo
            rightIcon.iconData: Media.Icons.heavy.logo
        }

		Controls.MFabButton {
            type: groupRoot.buttonType
			accent: UI.Theme.primary
            text: "Right Media.Icon"
            rightIcon.iconData: Media.Icons.heavy.logo
        }

		Controls.MFabButton {
            type: groupRoot.buttonType
			accent: UI.Theme.primary
            rightIcon.iconData: Media.Icons.heavy.logo
        }
    }

	Components.TitleRow {
        title.text: qsTr("Size")

		Controls.MFabButton {
            type: groupRoot.buttonType
			accent: UI.Theme.primary
            size: UI.Size.Grade.L
            text: "Large"
        }

		Controls.MFabButton {
            type: groupRoot.buttonType
			accent: UI.Theme.primary
            size: UI.Size.Grade.M
            text: "Medium"
        }

		Controls.MFabButton {
            type: groupRoot.buttonType
			accent: UI.Theme.primary
            size: UI.Size.Grade.S
            text: "Small"
        }
    }

    Item { Layout.fillHeight: true; }
}
