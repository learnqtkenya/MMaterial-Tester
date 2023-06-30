import QtQuick

pragma Singleton

QtObject{
    //Icons
    readonly property string iconBasePath: Qt.resolvedUrl("./assets/")

    readonly property string android: iconBasePath + "android.svg"
    readonly property string mail: iconBasePath + "mail.svg"
    readonly property string arrow: iconBasePath + "arrow.svg"
    readonly property string logo: iconBasePath + "logo.svg"
    readonly property string alternativeLogo: iconBasePath + "alternativeLogo.svg"
    readonly property string closeX: iconBasePath + "closeX.svg"
    readonly property string menu: iconBasePath + "menu.svg"
    readonly property string sun: iconBasePath + "sun.svg"
    readonly property string moon: iconBasePath + "moon.svg"

    readonly property string info: iconBasePath + "info.svg"
    readonly property string success: iconBasePath + "success.svg"
    readonly property string alert: iconBasePath + "alert.svg"
}
