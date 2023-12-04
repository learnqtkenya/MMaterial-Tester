import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import MMaterial

Rectangle {
    id: colorRectRoot
    radius: 8

    border {
        color: Theme.currentTheme.objectName === "Dark Theme" ? Qt.lighter(color, 1.5) : Qt.darker(color, 1.5)
        width: mouseArea.containsMouse ? 2 : 0
    }

    MToolTip {
        visible: mouseArea.containsMouse
        text: color
        delay: 0
        timeout: 5000
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        hoverEnabled: true
    }
}
