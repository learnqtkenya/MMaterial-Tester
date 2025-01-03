import QtQuick

import MMaterial.Controls as Controls
import MMaterial.UI as UI

Item {
    id: root

	Controls.BusyIndicator{
        id: busyIndicator

        anchors.centerIn: root
        show: true
    }

	Controls.MFabButton {
        text: busyIndicator.show ? qsTr("Hide") : qsTr("Show")
		type: busyIndicator.show ? Controls.MButton.Type.Outlined : Controls.MButton.Type.Contained

        anchors {
            bottom: root.bottom; bottomMargin: UI.Size.pixel28
            horizontalCenter: root.horizontalCenter
        }

        onClicked: busyIndicator.show = !busyIndicator.show
    }

}
