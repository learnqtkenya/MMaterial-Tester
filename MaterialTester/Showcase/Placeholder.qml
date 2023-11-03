import QtQuick 

import MMaterial

Item {
    objectName: "Intro"

    Icon {
        id: _logo

        size: Math.min(Window.width, Window.height) * 0.3
        anchors.centerIn: parent

        iconData: Icons.heavy.logo
        color: Theme.primary.main
    }

    Overline {
        anchors{
            top: _logo.bottom; topMargin: Size.pixel40
            horizontalCenter: parent.horizontalCenter
        }

        width: parent.width * 0.8

        font.pixelSize: Size.pixel20
        text: qsTr("MMaterial Component Library")
        horizontalAlignment: Qt.AlignHCenter
        color: Theme.text.secondary
    }
}
