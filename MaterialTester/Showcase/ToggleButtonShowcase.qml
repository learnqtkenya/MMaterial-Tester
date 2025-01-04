import QtQuick 
import QtQuick.Layouts
import QtQuick.Controls.Material

import MMaterial.UI as UI
import MMaterial.Controls as Controls
import MaterialTester.Components

Flickable {
    objectName: "Toggle Button"

    contentHeight: _mainLayout.implicitHeight

	ScrollIndicator.vertical: Controls.MScrollIndicator{}

    ColumnLayout {
        id: _mainLayout

        anchors.fill: parent

        spacing: 80 * UI.Size.scale

		UI.Subtitle1 { text: "Toggle Button" }

        TitleRow {
			Layout.topMargin: -UI.Size.pixel40

            title.text: qsTr("Color")

			Controls.MToggleButton { accent: UI.Theme.primary; checked: true; }
			Controls.MToggleButton { accent: UI.Theme.secondary; checked: true; }
			Controls.MToggleButton { accent: UI.Theme.info; checked: true; }
			Controls.MToggleButton { accent: UI.Theme.success; checked: true; }
			Controls.MToggleButton { accent: UI.Theme.warning; checked: true; }
			Controls.MToggleButton { accent: UI.Theme.error; checked: true; }
        }

        TitleRow {
            title.text: qsTr("States")

			Controls.MToggleButton { accent: UI.Theme.primary; checked: true; }
			Controls.MToggleButton { accent: UI.Theme.primary; checked: false; }
			Controls.MToggleButton { accent: UI.Theme.primary; enabled: false; }
        }

        TitleRow {
            title.text: qsTr("Size")

			Controls.MToggleButton { accent: UI.Theme.primary; checked: true; size: UI.Size.Grade.L; }
			Controls.MToggleButton { accent: UI.Theme.primary; checked: true; size: UI.Size.Grade.M; }
			Controls.MToggleButton { accent: UI.Theme.primary; checked: true; size: UI.Size.Grade.S; }
        }

        Item { Layout.fillHeight: true; }
    }
}
