import QtQuick
import QtQuick.Layouts

import MMaterial.UI as UI

Item {
    objectName: "Colors"

    ColumnLayout {
        id: rootLayout

        anchors.fill: parent

        GridLayout {
            id: grid

            property int preferredColumnSpan: Window.width > 900 ? 1 : 2

            Layout.preferredHeight: parent.height * 0.66
            Layout.fillWidth: true
            uniformCellWidths: true

            columns: 4

            rowSpacing: UI.Size.pixel40
            columnSpacing: UI.Size.pixel40

            PaletteBasicView {
                id: primaryView

                Layout.columnSpan: 2

                title: "Primary"
				palette: UI.Theme.primary
            }

            PaletteBasicView {
                Layout.columnSpan: 2

                title: "Secondary"
				palette: UI.Theme.secondary
            }

            PaletteBasicView {
                Layout.columnSpan: grid.preferredColumnSpan

                title: "Info"
				palette: UI.Theme.info
            }

            PaletteBasicView {
                Layout.columnSpan: grid.preferredColumnSpan

                title: "Success"
				palette: UI.Theme.success
            }

            PaletteBasicView {
                Layout.columnSpan: grid.preferredColumnSpan

                title: "Warning"
				palette: UI.Theme.warning
            }

            PaletteBasicView {
                Layout.columnSpan: grid.preferredColumnSpan

                title: "Error"
				palette: UI.Theme.error
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.34
            Layout.topMargin: UI.Size.pixel40

            UI.H6 {
                Layout.minimumHeight: 18
                Layout.fillWidth: true

                text: "Grey"
                verticalAlignment: Qt.AlignVCenter
            }

            RowLayout {
                id: greyLayout

                Layout.fillHeight: true
                Layout.fillWidth: true

                Repeater {
					property UI.PaletteGrey colors: UI.Theme.main

                    model: [colors.p100, colors.p200, colors.p300, colors.p400, colors.p500, colors.p600, colors.p700, colors.p800, colors.p900]

                    delegate: ColorRect {
						required property color modelData

                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignBottom
                        Layout.fillHeight: true
                        Layout.minimumWidth: UI.Size.pixel10

                        color: modelData
                    }
                }
            }
        }
    }
}
