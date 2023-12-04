import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

import "../../Settings"
import "../../Colors"

Loader {
    id: _root

    property alias busyIndicator: _busyIndicator

    BusyIndicator{
        id: _busyIndicator

        anchors.centerIn: _root

        z: 2
        height: Math.min(_root.height * 0.5, _root.width * 0.5, Size.pixel48 * 2)
        width: height

        visible: _root.status == Loader.Loading
        Material.accent: Theme.primary.main
    }
}
