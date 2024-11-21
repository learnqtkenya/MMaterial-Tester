import QtQuick
import QtQuick.Layouts

import MMaterial as MMaterial

Item {
    id: root

    MMaterial.BusyIndicator{
        id: busyIndicator

        anchors.centerIn: root
        show: true
    }

    MMaterial.MFabButton {
        text: busyIndicator.show ? qsTr("Hide") : qsTr("Show")
        type: busyIndicator.show ? MMaterial.MButton.Type.Outlined : MMaterial.MButton.Type.Contained

        anchors {
            bottom: root.bottom; bottomMargin: MMaterial.Size.pixel28
            horizontalCenter: root.horizontalCenter
        }

        onClicked: busyIndicator.show = !busyIndicator.show
    }

}
