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

		Inputs.MDropdown {
            type: groupRoot.type
			accent: UI.Theme.primary
        }

		Inputs.MDropdown {
            type: groupRoot.type
			accent: UI.Theme.primary
        }

		Inputs.MDropdown {
            enabled: false
            type: groupRoot.type
			accent: UI.Theme.primary
        }

		Inputs.MDropdown {
            type: groupRoot.type
			accent: UI.Theme.primary
            validator: RegularExpressionValidator{ regularExpression: /^[\d]+$/ }
        }
    }

    TitleRow {
        title.text: qsTr("Icon")
        grid.columns: groupRoot.columnCount

		Inputs.MDropdown {
            type: groupRoot.type
			accent: UI.Theme.primary
            leftIcon.iconData: Media.Icons.heavy.logo
        }

		Inputs.MDropdown {
            type: groupRoot.type
			accent: UI.Theme.primary
            leftIcon.iconData: Media.Icons.heavy.logo
        }

		Inputs.MDropdown {
            type: groupRoot.type
			accent: UI.Theme.primary
        }
    }

    Item { Layout.fillHeight: true; }
}
