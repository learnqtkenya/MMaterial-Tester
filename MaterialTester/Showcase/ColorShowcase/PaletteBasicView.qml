import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import MMaterial

ColumnLayout {
    id: _basicViewRoot

    required property string title
    required property PaletteBasic palette

    spacing: 16

    H6 {
        Layout.minimumHeight: Size.pixel18
        Layout.fillWidth: true

        text: _basicViewRoot.title
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

            color: _basicViewRoot.palette.main
        }

        ColumnLayout {
            Layout.fillHeight: true
            Layout.minimumWidth: Size.pixel20
            Layout.maximumWidth: Size.pixel40 * 2
            Layout.fillWidth: true

            spacing: 8

            Repeater {
                model: [_basicViewRoot.palette.lighter, _basicViewRoot.palette.light, _basicViewRoot.palette.dark, _basicViewRoot.palette.darker]

                ColorRect {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    color: modelData
                }
            }
        }
    }
}
