import QtQuick

import MMaterial.Media as Media
import MMaterial.UI as UI

Item {
    id: _root
    objectName: "Intro"

	Media.Icon {
        id: _logo

        size: Math.min(Window.width, Window.height) * 0.3
        anchors.centerIn: parent

		iconData: Media.Icons.heavy.logo
		color: UI.Theme.primary.main.toString()
    }

	UI.Overline {
        anchors{
            top: _logo.bottom; topMargin: UI.Size.pixel40
            horizontalCenter: parent.horizontalCenter
        }

        width: parent.width * 0.8

        font.pixelSize: UI.Size.pixel20
		text: qsTr("MMaterial fdsComponent Library")
        horizontalAlignment: Qt.AlignHCenter
		color: UI.Theme.text.secondary
    }
}
