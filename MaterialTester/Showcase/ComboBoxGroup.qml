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

		Inputs.ComboBox {
            type: groupRoot.type
			accent: UI.Theme.primary
			placeholderText: qsTr("Default")
        }

		Inputs.ComboBox {
			type: groupRoot.type
			accent: UI.Theme.primary
			placeholderText: qsTr("Input")
			editable: true
        }

		Inputs.ComboBox {
            enabled: false
            type: groupRoot.type
			accent: UI.Theme.primary
			placeholderText: qsTr("Disabled")
        }

		Inputs.ComboBox {
            type: groupRoot.type
			accent: UI.Theme.primary
            validator: RegularExpressionValidator{ regularExpression: /^[\d]+$/ }
			placeholderText: qsTr("Invalid")
        }
    }

    TitleRow {
        title.text: qsTr("Icon")
        grid.columns: groupRoot.columnCount

		Inputs.ComboBox {
            type: groupRoot.type
			accent: UI.Theme.primary
			iconData: Media.Icons.heavy.logo
        }

		Inputs.ComboBox {
            type: groupRoot.type
			accent: UI.Theme.primary
			iconData: Media.Icons.heavy.logo
        }

		Inputs.ComboBox {
            type: groupRoot.type
			accent: UI.Theme.primary
        }
    }

    Item { Layout.fillHeight: true; }
}
