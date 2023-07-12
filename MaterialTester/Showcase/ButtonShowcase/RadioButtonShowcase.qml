import QtQuick 2.15
import QtQuick.Layouts

import MMaterial

import "../../Components/Common"

ColumnLayout {
    objectName: "Radio Button"
    visible: showcaseLoader.status == Loader.Ready
    spacing: Size.pixel40
    Subtitle1{ text: "Radio Button" }
    TitleRow{
        title: qsTr("Default")
        width: parent.width
        spacing: Size.pixel36
        Layout.topMargin: Size.pixel10

        MRadioButton{ accent: Theme.primary; checked: false; }
        MRadioButton{ accent: Theme.primary; checked: true; }
    }
    TitleRow{
        title: qsTr("Color")
        width: parent.width
        spacing: Size.pixel36

        MRadioButton{ accent: Theme.primary; checked: true; }
        MRadioButton{ accent: Theme.secondary; checked: true; }
        MRadioButton{ accent: Theme.info; checked: true; }
        MRadioButton{ accent: Theme.success; checked: true; }
        MRadioButton{ accent: Theme.warning; checked: true; }
        MRadioButton{ accent: Theme.error; checked: true; }
    }
    TitleRow{
        title: qsTr("States")
        width: parent.width
        spacing: Size.pixel36

        MRadioButton{ accent: Theme.primary; checked: false; }
        MRadioButton{ accent: Theme.primary; checked: true; }
        MRadioButton{ accent: Theme.primary; checked: false; enabled: false; }
        MRadioButton{ accent: Theme.primary; checked: true; enabled: false; }
    }
    Item{ Layout.fillHeight: true; }

}
