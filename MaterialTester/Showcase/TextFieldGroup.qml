import QtQuick 
import QtQuick.Layouts

import MMaterial.UI as UI
import MMaterial.Controls.Inputs as Inputs
import MMaterial.Media as Media
import MaterialTester.Components

ColumnLayout {
    id: groupRoot

    required property int type
    required property string title

    property int columnCount: Window.width > (1920 * UI.Size.scale) ? 4 : (Window.width > 1180 * UI.Size.scale ? 2 : 1)

	UI.Subtitle1 {
        text: groupRoot.title
    }

    TitleRow {
        title.text: qsTr("States")
        grid.columns: groupRoot.columnCount

		Inputs.TextField {
            type: groupRoot.type
			accent: UI.Theme.primary
			placeholderText: qsTr("Placeholder")
        }

		Inputs.TextField {
            type: groupRoot.type
			accent: UI.Theme.primary
            text: qsTr("Value (Enabled)")
			placeholderText: qsTr("Placeholder")
        }

		Inputs.TextField {
            enabled: false
            type: groupRoot.type
			accent: UI.Theme.primary
            text: qsTr("Value (Disabled)")
			placeholderText: qsTr("Placeholder")
        }

		Inputs.TextField {
            type: groupRoot.type
			accent: UI.Theme.primary
            text: qsTr("Value (Incorrect)")
			placeholderText: qsTr("Placeholder")
			validator: RegularExpressionValidator{ regularExpression: /^[\d]+$/ }
        }
    }

    TitleRow {
        title.text: qsTr("Icon")
        grid.columns: groupRoot.columnCount

		Inputs.TextField {
            type: groupRoot.type
			accent: UI.Theme.primary
            text: qsTr("Left Media.Icon")
			leftIcon.iconData: Media.Icons.heavy.logo
			placeholderText: qsTr("Placeholder")
        }

		Inputs.TextField {
            type: groupRoot.type
			accent: UI.Theme.primary
            text: qsTr("Left and Right Media.Icon")
			leftIcon.iconData: Media.Icons.heavy.logo
			rightIcon.iconData: Media.Icons.heavy.logo
			placeholderText: qsTr("Placeholder")
        }

		Inputs.TextField {
            type: groupRoot.type
			accent: UI.Theme.primary
            text: qsTr("Right Media.Icon")
			rightIcon.iconData: Media.Icons.heavy.logo
			placeholderText: qsTr("Placeholder")
        }
    }

    Item { Layout.fillHeight: true; }
}
