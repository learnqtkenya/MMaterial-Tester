import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import MMaterial

ColumnLayout {
    id: basicViewRoot

    required property string title
    required property var palette

    Layout.fillWidth: true

    spacing: 16

    H6 {
        Layout.minimumHeight: Size.pixel18
        Layout.fillWidth: true

        text: basicViewRoot.title
        verticalAlignment: Qt.AlignVCenter
    }

    RowLayout {
        Layout.fillHeight: true
        Layout.fillWidth: true

        spacing: Size.pixel8

        ColorRect {
            id: mainRect

            Layout.fillHeight: true
            Layout.fillWidth: true

            color: basicViewRoot.palette.main
        }

        ColumnLayout {
            Layout.fillHeight: true
            Layout.minimumWidth: Size.pixel20
            Layout.maximumWidth: parent.width/3
            Layout.fillWidth: true

            spacing: 8

            Repeater {
                model: [basicViewRoot.palette.lighter, basicViewRoot.palette.light, basicViewRoot.palette.dark, basicViewRoot.palette.darker]

                ColorRect {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    color: modelData
                }
            }
        }
    }
}
