import QtQuick

QtObject{
    required property color lighter
    required property color light
    required property color main
    required property color dark
    required property color darker
    required property color contrastText

    property color transparent8: Qt.rgba(main.r, main.g, main.b, 0.08)
    property color transparent12: Qt.rgba(main.r, main.g, main.b, 0.12)
    property color transparent16: Qt.rgba(main.r, main.g, main.b, 0.16)
    property color transparent24: Qt.rgba(main.r, main.g, main.b, 0.24)
    property color transparent32: Qt.rgba(main.r, main.g, main.b, 0.32)
    property color transparent48: Qt.rgba(main.r, main.g, main.b, 0.48)
}
