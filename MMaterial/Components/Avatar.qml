import QtQuick 
import QtQuick.Layouts

import MMaterial

Rectangle {
    id: _root

    property string title: "A"
    property PaletteBasic accent: Theme.primary

    color: enabled ? accent.main : Theme.action.disabled
    radius: 100

    implicitHeight: Size.pixel48
    implicitWidth: Size.pixel48

    Subtitle2 {
        id: _title

        anchors.centerIn: _root

        verticalAlignment: Qt.AlignVCenter
        horizontalAlignment: Qt.AlignHCenter

        color: _root.accent.contrastText
        text: _root.title.length >= 1 ?_root.title[0] : ""

        font {
            pixelSize: _root.height * 0.4
            capitalization: Font.AllUppercase
        }
    }
}
