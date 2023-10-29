import QtQuick 

import MMaterial

Item {
    objectName: "Intro"

    Icon{
        id: _logo
        sourceSize.height: Math.min(Window.width, Window.height) * 0.3
        anchors.centerIn: parent
        path: IconList.logo
        color: Theme.primary.main
    }

    Overline{
        anchors{
            top: _logo.bottom; topMargin: Size.pixel40
            horizontalCenter: parent.horizontalCenter
        }
        font.pixelSize: Size.pixel20
        text: qsTr("MMaterial Component Library")
        width: parent.width * 0.8
        horizontalAlignment: Qt.AlignHCenter
        color: Theme.text.secondary
    }
}
