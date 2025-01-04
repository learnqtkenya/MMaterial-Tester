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

			Controls.MRadioButton { accent: UI.Theme.primary; checked: false; Layout.preferredWidth: height; }
			Controls.MRadioButton { accent: UI.Theme.primary; checked: true; Layout.preferredWidth: height; }
        }

        TitleRow {
            title.text: qsTr("Color")
            spacing: UI.Size.pixel36

			Controls.MRadioButton { accent: UI.Theme.primary; checked: true; Layout.preferredWidth: height; }
			Controls.MRadioButton { accent: UI.Theme.secondary; checked: true; Layout.preferredWidth: height; }
			Controls.MRadioButton { accent: UI.Theme.info; checked: true; Layout.preferredWidth: height; }
			Controls.MRadioButton { accent: UI.Theme.success; checked: true; Layout.preferredWidth: height; }
			Controls.MRadioButton { accent: UI.Theme.warning; checked: true; Layout.preferredWidth: height; }
			Controls.MRadioButton { accent: UI.Theme.error; checked: true; Layout.preferredWidth: height; }
        }

        TitleRow {
            title.text: qsTr("States")
            spacing: UI.Size.pixel36

			Controls.MRadioButton { accent: UI.Theme.primary; checked: false; Layout.preferredWidth: height; }
			Controls.MRadioButton { accent: UI.Theme.primary; checked: true; Layout.preferredWidth: height; }
			Controls.MRadioButton { accent: UI.Theme.primary; checked: false; enabled: false; Layout.preferredWidth: height; }
			Controls.MRadioButton { accent: UI.Theme.primary; checked: true; enabled: false; Layout.preferredWidth: height; }
        }

        TitleRow {
            Layout.topMargin: UI.Size.pixel10
            title.text: qsTr("Label")
            spacing: UI.Size.pixel36

			Controls.MRadioButton { accent: UI.Theme.primary; checked: false; text: qsTr("Label"); }
			Controls.MRadioButton { accent: UI.Theme.primary; checked: true; text: qsTr("Label"); }
        }

        Item { Layout.fillHeight: true; }
    }
}
