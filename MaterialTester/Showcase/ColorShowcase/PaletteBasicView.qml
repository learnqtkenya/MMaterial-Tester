import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import MMaterial

ColumnLayout {
    id: basicViewRoot
    required property string title
    required property var palette
    spacing: 16
    H6{
        Layout.minimumHeight: 18
        Layout.fillWidth: true
        text: basicViewRoot.title
        verticalAlignment: Qt.AlignVCenter
    }

    RowLayout{
        Layout.fillHeight: true
        Layout.fillWidth: true
        spacing: 8
        ColorRect{
            id: mainRect
            color: basicViewRoot.palette.main
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        ColumnLayout{
            Layout.fillHeight: true
            Layout.preferredWidth: 45
            spacing: 8
            Repeater{
                model: [basicViewRoot.palette.lighter, basicViewRoot.palette.light, basicViewRoot.palette.dark, basicViewRoot.palette.darker]

                ColorRect{
                    Layout.minimumWidth: height * 1.8
                    Layout.fillHeight: true
                    color: modelData
                }
            }
        }
    }
}
