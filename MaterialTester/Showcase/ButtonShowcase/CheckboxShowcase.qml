import QtQuick 2.15
import QtQuick.Layouts

import MMaterial

import "../../Components/Common"

ColumnLayout {
    objectName: "Checkbox"
    visible: showcaseLoader.status == Loader.Ready
    spacing: Size.pixel40
    TitleRow{
        title: qsTr("Default")
        width: parent.width
        spacing: Size.pixel36

        MCheckbox{ accent: Theme.primary; checked: false; }
        MCheckbox{ accent: Theme.primary; checked: true; }
        Item{ Layout.fillWidth: true; }
    }
    TitleRow{
        title: qsTr("Color")
        width: parent.width
        spacing: Size.pixel36

        MCheckbox{ accent: Theme.primary; checked: true; }
        MCheckbox{ accent: Theme.secondary; checked: true; }
        MCheckbox{ accent: Theme.info; checked: true; }
        MCheckbox{ accent: Theme.success; checked: true; }
        MCheckbox{ accent: Theme.warning; checked: true; }
        MCheckbox{ accent: Theme.error; checked: true; }
        Item{ Layout.fillWidth: true; }
    }
    TitleRow{
        title: qsTr("States")
        width: parent.width
        spacing: Size.pixel36

        MCheckbox{ accent: Theme.primary; checked: false; }
        MCheckbox{ accent: Theme.primary; checked: true; }
        MCheckbox{ accent: Theme.primary; checked: false; enabled: false; }
        MCheckbox{ accent: Theme.primary; checked: true; enabled: false; }
        Item{ Layout.fillWidth: true; }
    }
    Item{ Layout.fillHeight: true; }

}
