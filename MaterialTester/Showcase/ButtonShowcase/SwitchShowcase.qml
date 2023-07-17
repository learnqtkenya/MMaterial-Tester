import QtQuick 2.15
import QtQuick.Layouts

import MMaterial

import "../../Components/Common"
Flickable{
    objectName: "Radio Button"
    contentHeight: _mainLayout.implicitHeight
    ColumnLayout {
        id: _mainLayout
        anchors.fill: parent
        visible: showcaseLoader.status == Loader.Ready
        spacing: Size.pixel40
        Subtitle1{ text: "Radio Button" }
        TitleRow{
            title: qsTr("Default")
            width: parent.width
            spacing: Size.pixel36
            Layout.topMargin: Size.pixel10

            MSwitch{ accent: Theme.primary; checked: false; }
            MSwitch{ accent: Theme.primary; checked: true; }
        }
        TitleRow{
            title: qsTr("Color")
            width: parent.width
            spacing: Size.pixel36

            MSwitch{ accent: Theme.primary; checked: true; }
            MSwitch{ accent: Theme.secondary; checked: true; }
            MSwitch{ accent: Theme.info; checked: true; }
            MSwitch{ accent: Theme.success; checked: true; }
            MSwitch{ accent: Theme.warning; checked: true; }
            MSwitch{ accent: Theme.error; checked: true; }
        }
        TitleRow{
            title: qsTr("States")
            width: parent.width
            spacing: Size.pixel36

            MSwitch{ accent: Theme.primary; checked: false; }
            MSwitch{ accent: Theme.primary; checked: true; }
            MSwitch{ accent: Theme.primary; checked: false; enabled: false; }
            MSwitch{ accent: Theme.primary; checked: true; enabled: false; }
        }
        TitleRow{
            title: qsTr("Size")
            width: parent.width
            spacing: Size.pixel36

            MSwitch{ accent: Theme.primary; checked: false; size: Size.Grade.S; }
            MSwitch{ accent: Theme.primary; checked: false; size: Size.Grade.M; }
            MSwitch{ accent: Theme.primary; checked: true; size: Size.Grade.S; }
            MSwitch{ accent: Theme.primary; checked: true; size: Size.Grade.M; }
        }
        TitleRow{
            title: qsTr("Label")
            width: parent.width
            spacing: Size.pixel36
            Layout.topMargin: Size.pixel10

            MSwitch{ accent: Theme.primary; checked: false; text: qsTr("Label"); }
            MSwitch{ accent: Theme.primary; checked: true; text: qsTr("Label"); }
        }
        Item{ Layout.fillHeight: true; }

    }
}

