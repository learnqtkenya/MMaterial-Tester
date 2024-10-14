import QtQuick 
import QtQuick.Layouts
import QtQuick.Controls.Material

import MMaterial

import "../../Components/Common"

Flickable {
    objectName: "Checkbox"

    contentHeight: _mainLayout.implicitHeight

    ScrollIndicator.vertical: MScrollIndicator{}

    ColumnLayout {
        id: _mainLayout

        anchors.fill: parent

        spacing: Size.pixel40

        Subtitle1 { text: "Checkbox" }

        TitleRow {
            Layout.topMargin: Size.pixel10

            title.text: qsTr("Default")
            spacing: Size.pixel36

            MCheckbox { accent: Theme.primary; checked: false; }
            MCheckbox { accent: Theme.primary; checked: true; }
        }

        TitleRow {
            title.text: qsTr("Color")
            spacing: Size.pixel36

            MCheckbox { accent: Theme.primary; checked: true; }
            MCheckbox { accent: Theme.secondary; checked: true; }
            MCheckbox { accent: Theme.info; checked: true; }
            MCheckbox { accent: Theme.success; checked: true; }
            MCheckbox { accent: Theme.warning; checked: true; }
            MCheckbox { accent: Theme.error; checked: true; }
        }

        TitleRow {
            title.text: qsTr("States")
            spacing: Size.pixel36

            MCheckbox { accent: Theme.primary; checked: false; }
            MCheckbox { accent: Theme.primary; checked: true; }
            MCheckbox { accent: Theme.primary; checked: false; enabled: false; }
            MCheckbox { accent: Theme.primary; checked: true; enabled: false; }
        }

        Item { Layout.fillHeight: true; }
    }
}
