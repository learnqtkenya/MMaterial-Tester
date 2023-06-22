import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import MMaterial
Item {
    objectName: "Colors"

    ColumnLayout{
        id: rootLayout
        anchors{
            fill: parent
            margins: 40
        }
        GridLayout{
            id: grid
            Layout.preferredHeight: parent.height * 0.66
            Layout.fillWidth: true
            columns: 4
            rowSpacing: 40
            columnSpacing: 40

            PaletteBasicView{
                id: primaryView
                Layout.columnSpan: 2
                title: "Primary"
                palette: Theme.primary
            }
            PaletteBasicView{
                Layout.columnSpan: 2
                title: "Secondary"
                palette: Theme.secondary
            }
            PaletteBasicView{
                title: "Info"
                palette: Theme.info
            }
            PaletteBasicView{
                title: "Success"
                palette: Theme.success
            }
            PaletteBasicView{
                title: "Warning"
                palette: Theme.warning
            }
            PaletteBasicView{
                title: "Error"
                palette: Theme.error
            }
        }

        ColumnLayout{
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.34
            Layout.topMargin: 40
            H6{
                Layout.minimumHeight: 18
                Layout.fillWidth: true
                text: "Grey"
                verticalAlignment: Qt.AlignVCenter
            }
            RowLayout{
                id: greyLayout
                Layout.fillHeight: true
                Layout.fillWidth: true

                Repeater{
                    property var colors: Theme.main
                    model: [colors.p100, colors.p200, colors.p300, colors.p400, colors.p500, colors.p600, colors.p700, colors.p800, colors.p900]
                    delegate: ColorRect{
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignBottom
                        Layout.fillHeight: true
                        color: modelData
                    }
                }
            }
        }
    }
}
