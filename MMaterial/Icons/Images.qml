pragma Singleton

import QtQuick

QtObject{
    id: _root

    readonly property string iconBasePath: Qt.resolvedUrl("./assets/png/")

    readonly property IconData woman: IconData { path: _root.iconBasePath + "programmer-female.png"; type: IconData.Heavy }
    readonly property IconData womanSitting: IconData { path: _root.iconBasePath + "programmer-female2.png"; type: IconData.Heavy }
    readonly property IconData man: IconData { path: _root.iconBasePath + "programmer-male.png"; type: IconData.Heavy }
    readonly property IconData manSitting: IconData { path: _root.iconBasePath + "programmer-male2.png"; type: IconData.Heavy }
}
