import QtQuick 
import QtQuick.Controls
import MMaterial
import QtQuick.Effects
import QtQuick.Layouts
Item {

    Rectangle {
        id: _avatar

        property string title: "A"
        property var accent: Theme.primary

        implicitHeight: Size.pixel48
        implicitWidth: Size.pixel48

        radius: 100
        color: accent.main

        Subtitle2 {
            id: _title

            anchors.centerIn: parent

            color: _avatar.accent.contrastText
            verticalAlignment: Qt.AlignVCenter
            text: _avatar.title.length >= 1 ?_avatar.title[0] : ""

            font {
                capitalization: Font.AllUppercase
                pixelSize: parent.height * 0.4
            }
        }
    }
}
