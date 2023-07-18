import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls

import MMaterial

import "../../Components/Common"

Flickable{
    objectName: "Checkbox"
    contentHeight: _mainLayout.implicitHeight
    ScrollIndicator.vertical: MScrollIndicator{}
    ColumnLayout {
        id: _mainLayout
        anchors.fill: parent
        visible: showcaseLoader.status == Loader.Ready
        spacing: Size.pixel40
        Subtitle1{ text: "Checkbox" }
        TitleRow{
            title.text: qsTr("Default")
            width: parent.width
            spacing: Size.pixel36
            Layout.topMargin: Size.pixel10

            MCheckbox{ accent: Theme.primary; checked: false; }
            MCheckbox{ accent: Theme.primary; checked: true; }
        }
        TitleRow{
            title.text: qsTr("Color")
            width: parent.width
            spacing: Size.pixel36

            MCheckbox{ accent: Theme.primary; checked: true; }
            MCheckbox{ accent: Theme.secondary; checked: true; }
            MCheckbox{ accent: Theme.info; checked: true; }
            MCheckbox{ accent: Theme.success; checked: true; }
            MCheckbox{ accent: Theme.warning; checked: true; }
            MCheckbox{ accent: Theme.error; checked: true; }
        }
        TitleRow{
            title.text: qsTr("States")
            width: parent.width
            spacing: Size.pixel36

            MCheckbox{ accent: Theme.primary; checked: false; }
            MCheckbox{ accent: Theme.primary; checked: true; }
            MCheckbox{ accent: Theme.primary; checked: false; enabled: false; }
            MCheckbox{ accent: Theme.primary; checked: true; enabled: false; }
        }
        Item{ Layout.fillHeight: true; }

    }
}
