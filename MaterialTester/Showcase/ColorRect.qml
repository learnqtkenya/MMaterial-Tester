import QtQuick

import MMaterial.Controls as Controls
import MMaterial.UI as UI

Rectangle {
    id: colorRectRoot
    radius: 8

    border {
		color: UI.Theme.currentTheme.objectName === "Dark UI.Theme" ? Qt.lighter(color, 1.5) : Qt.darker(color, 1.5)
        width: mouseArea.containsMouse ? 2 : 0
    }

	Controls.MToolTip {
        visible: mouseArea.containsMouse
		text: colorRectRoot.color.toString()
        delay: 0
        timeout: 5000
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        hoverEnabled: true
    }
}
