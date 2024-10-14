import QtQuick 
import QtQuick.Layouts
import QtQuick.Controls.Material

import MMaterial

import "../../Components/Common"

Flickable {
    objectName: "Radio Button"
    contentHeight: _mainLayout.implicitHeight

    ScrollIndicator.vertical: MScrollIndicator{}

    ColumnLayout {
        id: _mainLayout

        anchors.fill: parent

        spacing: Size.pixel40

        Subtitle1 { text: "Radio Button" }

        TitleRow {
            Layout.topMargin: Size.pixel10

            title.text: qsTr("Default")
            spacing: Size.pixel36

            MSwitch{ accent: Theme.primary; checked: false; }
            MSwitch{ accent: Theme.primary; checked: true; }
        }

        TitleRow {
            title.text: qsTr("Color")
            spacing: Size.pixel36

            MSwitch{ accent: Theme.primary; checked: true; }
            MSwitch{ accent: Theme.secondary; checked: true; }
            MSwitch{ accent: Theme.info; checked: true; }
            MSwitch{ accent: Theme.success; checked: true; }
            MSwitch{ accent: Theme.warning; checked: true; }
            MSwitch{ accent: Theme.error; checked: true; }
        }

        TitleRow {
            title.text: qsTr("States")
            spacing: Size.pixel36

            MSwitch{ accent: Theme.primary; checked: false; }
            MSwitch{ accent: Theme.primary; checked: true; }
            MSwitch{ accent: Theme.primary; checked: false; enabled: false; }
            MSwitch{ accent: Theme.primary; checked: true; enabled: false; }
        }

        TitleRow {
            title.text: qsTr("Size")
            spacing: Size.pixel36

            MSwitch{ accent: Theme.primary; checked: false; size: Size.Grade.S; }
            MSwitch{ accent: Theme.primary; checked: false; size: Size.Grade.M; }
            MSwitch{ accent: Theme.primary; checked: true; size: Size.Grade.S; }
            MSwitch{ accent: Theme.primary; checked: true; size: Size.Grade.M; }
        }

        TitleRow {
            Layout.topMargin: Size.pixel10

            title.text: qsTr("Label")
            spacing: Size.pixel36

            MSwitch{ accent: Theme.primary; checked: false; text: qsTr("Label"); }
            MSwitch{ accent: Theme.primary; checked: true; text: qsTr("Label"); }
        }

        Item { Layout.fillHeight: true; }
    }
}

