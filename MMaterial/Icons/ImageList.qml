import QtQuick

pragma Singleton

QtObject{
    //Icons
    readonly property string iconBasePath: Qt.resolvedUrl("./assets/png/")

    readonly property string woman: iconBasePath + "programmer-female.png"
    readonly property string womanSitting: iconBasePath + "programmer-female2.png"
    readonly property string man: iconBasePath + "programmer-male.png"
    readonly property string manSitting: iconBasePath + "programmer-male2.png"
}
