import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material

import MMaterial

import "../../Components/Common"

Item{
    objectName: "Toggle Buttons"
    ColumnLayout{
        anchors{
            fill: parent
            margins: Size.pixel32
        }
        spacing: 80 * Size.scale

        TitleRow{
            title: qsTr("Color")

            MToggleButton{ accent: Theme.primary; checked: true; }
            MToggleButton{ accent: Theme.secondary; checked: true; }
            MToggleButton{ accent: Theme.info; checked: true; }
            MToggleButton{ accent: Theme.success; checked: true; }
            MToggleButton{ accent: Theme.warning; checked: true; }
            MToggleButton{ accent: Theme.error; checked: true; }

            Item{ Layout.fillWidth: true; }
        }

        TitleRow{
            title: qsTr("States")

            MToggleButton{ accent: Theme.primary; checked: true; }
            MToggleButton{ accent: Theme.primary; checked: false; }
            MToggleButton{ accent: Theme.primary; enabled: false; }

            Item{ Layout.fillWidth: true; }
        }

        TitleRow{
            title: qsTr("Size")

            MToggleButton{ accent: Theme.primary; checked: true; size: Size.Grade.L; }
            MToggleButton{ accent: Theme.primary; checked: true; size: Size.Grade.M; }
            MToggleButton{ accent: Theme.primary; checked: true; size: Size.Grade.S; }

            Item{ Layout.fillWidth: true; }
        }

        Item{ Layout.fillHeight: true; }
    }
}
