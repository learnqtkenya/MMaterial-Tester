import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls

import MMaterial

import "../../Components/Common"
Flickable{
    objectName: "Radio Button"
    contentHeight: _mainLayout.implicitHeight

    ScrollIndicator.vertical: MScrollIndicator{}
    ColumnLayout {
        id: _mainLayout
        anchors.fill: parent
        visible: showcaseLoader.status == Loader.Ready
        spacing: Size.pixel40
        Subtitle1{ text: "Radio Button" }
        TitleRow{
            title.text: qsTr("Default")
            width: parent.width
            spacing: Size.pixel36
            Layout.topMargin: Size.pixel10

            MRadioButton{ accent: Theme.primary; checked: false; Layout.preferredWidth: height; }
            MRadioButton{ accent: Theme.primary; checked: true; Layout.preferredWidth: height; }
        }
        TitleRow{
            title.text: qsTr("Color")
            width: parent.width
            spacing: Size.pixel36

            MRadioButton{ accent: Theme.primary; checked: true; Layout.preferredWidth: height; }
            MRadioButton{ accent: Theme.secondary; checked: true; Layout.preferredWidth: height; }
            MRadioButton{ accent: Theme.info; checked: true; Layout.preferredWidth: height; }
            MRadioButton{ accent: Theme.success; checked: true; Layout.preferredWidth: height; }
            MRadioButton{ accent: Theme.warning; checked: true; Layout.preferredWidth: height; }
            MRadioButton{ accent: Theme.error; checked: true; Layout.preferredWidth: height; }
        }
        TitleRow{
            title.text: qsTr("States")
            width: parent.width
            spacing: Size.pixel36

            MRadioButton{ accent: Theme.primary; checked: false; Layout.preferredWidth: height; }
            MRadioButton{ accent: Theme.primary; checked: true; Layout.preferredWidth: height; }
            MRadioButton{ accent: Theme.primary; checked: false; enabled: false; Layout.preferredWidth: height; }
            MRadioButton{ accent: Theme.primary; checked: true; enabled: false; Layout.preferredWidth: height; }
        }
        TitleRow{
            title.text: qsTr("Label")
            width: parent.width
            spacing: Size.pixel36
            Layout.topMargin: Size.pixel10

            MRadioButton{ accent: Theme.primary; checked: false; text: qsTr("Label"); }
            MRadioButton{ accent: Theme.primary; checked: true; text: qsTr("Label"); }
        }
        Item{ Layout.fillHeight: true; }

    }
}
