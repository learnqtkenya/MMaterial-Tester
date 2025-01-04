import QtQuick
import QtQuick.Layouts

import MMaterial.UI as UI
import MMaterial.Controls as Controls
import MMaterial.Controls.Inputs as Inputs

Item {
    component ColorFrame: ColumnLayout {
        id: colorFrame

        required property string title
        property alias color: circle.color

        UI.H6 {
            Layout.fillWidth: true

            horizontalAlignment: Qt.AlignHCenter
            text: colorFrame.title
			color: UI.Theme.text.disabled

            font {
                pixelSize: UI.Size.pixel12
                capitalization: Font.AllUppercase
            }
        }

        Rectangle {
            id: circle

            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: UI.Size.pixel8
            Layout.preferredWidth: UI.Size.pixel48 * 2
            Layout.preferredHeight: width

            radius: height / 2

            border {
                width: 1
				color: UI.Theme.text.primary
            }
        }
    }

	Controls.MButton {
        x: colorPicker.x + UI.Size.pixel8
        y: colorPicker.y + UI.Size.pixel8

        text: qsTr("Open")

        onClicked: colorPicker.open()
    }

	Inputs.ColorPicker {
        id: colorPicker

        visible: true
    }

    RowLayout {
        width: colorPicker.implicitWidth

        y: colorPicker.height + UI.Size.pixel24

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
