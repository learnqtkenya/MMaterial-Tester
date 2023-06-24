import QtQuick

pragma Singleton

QtObject{
    //Icons
    readonly property string iconBasePath: Qt.resolvedUrl("./assets/")

    readonly property string android: iconBasePath + "android.svg"
    readonly property string mail: iconBasePath + "mail.svg"
}
