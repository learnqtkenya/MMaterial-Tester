import QtQuick
import QtQuick.Layouts

import MMaterial.UI as UI

ColumnLayout {
    id: _basicViewRoot

    required property string title
	required property UI.PaletteBasic palette

    spacing: 16

	UI.H6 {
        Layout.minimumHeight: UI.Size.pixel18
        Layout.fillWidth: true

        text: _basicViewRoot.title
        verticalAlignment: Qt.AlignVCenter
    }

    RowLayout {
        Layout.fillHeight: true
        Layout.fillWidth: true

        spacing: UI.Size.pixel8

        ColorRect {
            id: mainRect

            Layout.fillHeight: true
            Layout.fillWidth: true

            color: _basicViewRoot.palette.main
        }

        ColumnLayout {
            Layout.fillHeight: true
            Layout.minimumWidth: UI.Size.pixel20
            Layout.maximumWidth: UI.Size.pixel40 * 2
            Layout.fillWidth: true

            spacing: 8

            Repeater {
                model: [_basicViewRoot.palette.lighter, _basicViewRoot.palette.light, _basicViewRoot.palette.dark, _basicViewRoot.palette.darker]

                ColorRect {
					required property var modelData

                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    color: modelData
                }
            }
        }
    }
}
