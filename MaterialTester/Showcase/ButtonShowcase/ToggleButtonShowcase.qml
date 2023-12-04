import QtQuick 
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material

import MMaterial

import "../../Components/Common"

Flickable {
    objectName: "Toggle Button"

    contentHeight: _mainLayout.implicitHeight

    ScrollIndicator.vertical: MScrollIndicator{}

    ColumnLayout {
        id: _mainLayout

        anchors.fill: parent

        spacing: 80 * Size.scale

        Subtitle1 { text: "Toggle Button" }

        TitleRow {
            Layout.topMargin: -Size.pixel40

            title.text: qsTr("Color")

            MToggleButton { accent: Theme.primary; checked: true; }
            MToggleButton { accent: Theme.secondary; checked: true; }
            MToggleButton { accent: Theme.info; checked: true; }
            MToggleButton { accent: Theme.success; checked: true; }
            MToggleButton { accent: Theme.warning; checked: true; }
            MToggleButton { accent: Theme.error; checked: true; }
        }

        TitleRow {
            title.text: qsTr("States")

            MToggleButton { accent: Theme.primary; checked: true; }
            MToggleButton { accent: Theme.primary; checked: false; }
            MToggleButton { accent: Theme.primary; enabled: false; }
        }

        TitleRow {
            title.text: qsTr("Size")

            MToggleButton { accent: Theme.primary; checked: true; size: Size.Grade.L; }
            MToggleButton { accent: Theme.primary; checked: true; size: Size.Grade.M; }
            MToggleButton { accent: Theme.primary; checked: true; size: Size.Grade.S; }
        }

        Item { Layout.fillHeight: true; }
    }
}
