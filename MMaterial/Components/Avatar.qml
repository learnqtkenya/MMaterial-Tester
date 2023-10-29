import QtQuick 
import QtQuick.Layouts

import MMaterial

Rectangle{
    id: _avatar

    property string title: "A"
    property PaletteBasic accent: Theme.primary

    color: enabled ? accent.main : Theme.action.disabled
    radius: 100

    implicitHeight: Size.pixel48
    implicitWidth: Size.pixel48

    Subtitle2{
        id: _title

        anchors.centerIn: parent

        verticalAlignment: Qt.AlignVCenter
        horizontalAlignment: Qt.AlignHCenter

        color: _avatar.accent.contrastText
        text: _avatar.title.length >= 1 ?_avatar.title[0] : ""

        font {
            pixelSize: parent.height * 0.4
            capitalization: Font.AllUppercase
        }
    }
}
