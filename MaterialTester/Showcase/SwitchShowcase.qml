import QtQuick 
import QtQuick.Layouts
import QtQuick.Controls.Material

import MMaterial.UI as UI
import MMaterial.Controls as Controls

import MaterialTester.Components

Flickable {
    objectName: "Radio Button"
    contentHeight: _mainLayout.implicitHeight

	ScrollIndicator.vertical: Controls.MScrollIndicator{}

    ColumnLayout {
        id: _mainLayout

        anchors.fill: parent

        spacing: UI.Size.pixel40

		UI.Subtitle1 { text: "Radio Button" }

        TitleRow {
            Layout.topMargin: UI.Size.pixel10

            title.text: qsTr("Default")
            spacing: UI.Size.pixel36

			Controls.MSwitch { accent: UI.Theme.primary; checked: false; }
			Controls.MSwitch { accent: UI.Theme.primary; checked: true; }
        }

        TitleRow {
            title.text: qsTr("Color")
            spacing: UI.Size.pixel36

			Controls.MSwitch { accent: UI.Theme.primary; checked: true; }
			Controls.MSwitch { accent: UI.Theme.secondary; checked: true; }
			Controls.MSwitch { accent: UI.Theme.info; checked: true; }
			Controls.MSwitch { accent: UI.Theme.success; checked: true; }
			Controls.MSwitch { accent: UI.Theme.warning; checked: true; }
			Controls.MSwitch { accent: UI.Theme.error; checked: true; }
        }

        TitleRow {
            title.text: qsTr("States")
            spacing: UI.Size.pixel36

			Controls.MSwitch { accent: UI.Theme.primary; checked: false; }
			Controls.MSwitch { accent: UI.Theme.primary; checked: true; }
			Controls.MSwitch { accent: UI.Theme.primary; checked: false; enabled: false; }
			Controls.MSwitch { accent: UI.Theme.primary; checked: true; enabled: false; }
        }

        TitleRow {
            title.text: qsTr("Size")
            spacing: UI.Size.pixel36

			Controls.MSwitch { accent: UI.Theme.primary; checked: false; size: UI.Size.Grade.S; }
			Controls.MSwitch { accent: UI.Theme.primary; checked: false; size: UI.Size.Grade.M; }
			Controls.MSwitch { accent: UI.Theme.primary; checked: true; size: UI.Size.Grade.S; }
			Controls.MSwitch { accent: UI.Theme.primary; checked: true; size: UI.Size.Grade.M; }
        }

        TitleRow {
            Layout.topMargin: UI.Size.pixel10

            title.text: qsTr("Label")
            spacing: UI.Size.pixel36

			Controls.MSwitch { accent: UI.Theme.primary; checked: false; text: qsTr("Label"); }
			Controls.MSwitch { accent: UI.Theme.primary; checked: true; text: qsTr("Label"); }
        }

        Item { Layout.fillHeight: true; }
    }
}

