import QtQuick
import QtQuick.Layouts

import MMaterial

Item {
    component ColorFrame: ColumnLayout {
        id: colorFrame

        required property string title
        property alias color: circle.color

        H6 {
            Layout.fillWidth: true

            horizontalAlignment: Qt.AlignHCenter
            text: colorFrame.title
            color: Theme.text.disabled

            font {
                pixelSize: Size.pixel12
                capitalization: Font.AllUppercase
            }
        }

        Rectangle {
            id: circle

            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: Size.pixel8
            Layout.preferredWidth: Size.pixel48 * 2
            Layout.preferredHeight: width

            radius: height / 2

            border {
                width: 1
                color: Theme.text.primary
            }
        }
    }

    MButton {
        x: colorPicker.x + Size.pixel8
        y: colorPicker.y + Size.pixel8

        text: qsTr("Open")

        onClicked: colorPicker.open()
    }

    ColorPicker {
        id: colorPicker

        visible: true
    }

    RowLayout {
        width: colorPicker.implicitWidth

        y: colorPicker.height + Size.pixel24

        ColorFrame {
            title: qsTr("Current Color")
            color: colorPicker.currentColor
        }

        Item { Layout.fillWidth: true }

        ColorFrame {
            title: qsTr("Selected Color")
            color: colorPicker.selectedColor
        }
    }
}
