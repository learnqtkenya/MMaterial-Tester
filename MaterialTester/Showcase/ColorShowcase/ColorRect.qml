import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import MMaterial

Rectangle{
    id: colorRectRoot
    radius: 8

    border.color: Theme.currentTheme.objectName === "Dark Theme" ? Qt.lighter(color, 1.5) : Qt.darker(color, 1.5)
    border.width: mouseArea.containsMouse ? 2 : 0
    ToolTip.visible: mouseArea.containsMouse
    ToolTip.text: color
    ToolTip.delay: 0
    ToolTip.timeout: 5000
    MouseArea{
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
    }
}
