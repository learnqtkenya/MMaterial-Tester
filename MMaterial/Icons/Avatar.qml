import QtQuick
import QtQuick.Controls

import "../Fonts/Texts"
import "../Colors"

Rectangle{
    id: avatarRoot
    radius: 100
    color: accent.main
    height: 150
    width: 150
    anchors.centerIn: parent
    clip: true

    property var accent: Theme.error //Needs to be PaletteBasic type
    property string text: "A"
    property string iconPath: ""

    Subtitle2{
        id: title
        anchors.centerIn: parent
        text: avatarRoot.text ? avatarRoot.text[0] : ""
        color: avatarRoot.accent.contrastText
        visible: !icon.visible
        font.pixelSize: avatarRoot.height * 0.3
        verticalAlignment: Qt.AlignVCenter
    }

    Icon{
        id: icon
        path: avatarRoot.iconPath
        sourceSize.height: parent.height * 0.3
        anchors.centerIn: parent
        color: avatarRoot.accent.contrastText
        visible: path != ""
    }
    //TODO: Image cropping
//        Image{
//            id: profileImage
//            anchors.fill: parent
//            source: "https://sm.ign.com/ign_ap/cover/a/avatar-gen/avatar-generations_hugw.jpg"
//            asynchronous: true
//            fillMode: Image.PreserveAspectFit
//        }
}




