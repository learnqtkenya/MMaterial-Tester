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
        }

		Inputs.TextField {
            type: groupRoot.type
			accent: UI.Theme.primary
            text: qsTr("Value (Enabled)")
        }

		Inputs.TextField {
            enabled: false
            type: groupRoot.type
			accent: UI.Theme.primary
            text: qsTr("Value (Disabled)")
        }

		Inputs.TextField {
            type: groupRoot.type
			accent: UI.Theme.primary
            text: qsTr("Value (Incorrect)")
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
        }

		Inputs.TextField {
            type: groupRoot.type
			accent: UI.Theme.primary
            text: qsTr("Left and Right Media.Icon")
			leftIcon.iconData: Media.Icons.heavy.logo
			rightIcon.iconData: Media.Icons.heavy.logo
        }

		Inputs.TextField {
            type: groupRoot.type
			accent: UI.Theme.primary
            text: qsTr("Right Media.Icon")
			rightIcon.iconData: Media.Icons.heavy.logo
        }
    }

    Item { Layout.fillHeight: true; }
}
