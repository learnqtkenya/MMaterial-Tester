import QtQuick 
import QtQuick.Layouts
import QtQuick.Controls.Material

import MMaterial.UI as UI
import MMaterial.Controls as Controls
import MaterialTester.Components

Flickable {
    objectName: "Checkbox"

    contentHeight: _mainLayout.implicitHeight

	ScrollIndicator.vertical: Controls.MScrollIndicator{}

    ColumnLayout {
        id: _mainLayout

        anchors.fill: parent

        spacing: UI.Size.pixel40

		UI.Subtitle1 { text: "Checkbox" }

        TitleRow {
            Layout.topMargin: UI.Size.pixel10

            title.text: qsTr("Default")
            spacing: UI.Size.pixel36

			Controls.MCheckbox { accent: UI.Theme.primary; checked: false; }
			Controls.MCheckbox { accent: UI.Theme.primary; checked: true; }
        }

        TitleRow {
            title.text: qsTr("Color")
            spacing: UI.Size.pixel36

			Controls.MCheckbox { accent: UI.Theme.primary; checked: true; }
			Controls.MCheckbox { accent: UI.Theme.secondary; checked: true; }
			Controls.MCheckbox { accent: UI.Theme.info; checked: true; }
			Controls.MCheckbox { accent: UI.Theme.success; checked: true; }
			Controls.MCheckbox { accent: UI.Theme.warning; checked: true; }
			Controls.MCheckbox { accent: UI.Theme.error; checked: true; }
        }

        TitleRow {
            title.text: qsTr("States")
            spacing: UI.Size.pixel36

			Controls.MCheckbox { accent: UI.Theme.primary; checked: false; }
			Controls.MCheckbox { accent: UI.Theme.primary; checked: true; }
			Controls.MCheckbox { accent: UI.Theme.primary; checked: false; enabled: false; }
			Controls.MCheckbox { accent: UI.Theme.primary; checked: true; enabled: false; }
        }

        Item { Layout.fillHeight: true; }
    }
}
