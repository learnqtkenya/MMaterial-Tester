import QtQuick 
import QtQuick.Controls
import MMaterial
import QtQuick.Effects
import QtQuick.Layouts
Item {
    visible: showcaseLoader.status == Loader.Ready

    Rectangle{
        id: _avatar
        color: accent.main
        radius: 100
        property string title: "A"
        property var accent: Theme.primary

        property real recommendedHeight: Size.pixel48
        property real recommendedWidth: Size.pixel48

        height: recommendedHeight
        width: recommendedWidth

        Layout.preferredHeight: recommendedHeight
        Layout.preferredWidth: recommendedWidth

        Subtitle2{
            id: _title
            anchors.centerIn: parent
            font.pixelSize: parent.height * 0.4
            color: _avatar.accent.contrastText
            verticalAlignment: Qt.AlignVCenter
            font.capitalization: Font.AllUppercase
            text: _avatar.title.length >= 1 ?_avatar.title[0] : ""
        }
    }

}
