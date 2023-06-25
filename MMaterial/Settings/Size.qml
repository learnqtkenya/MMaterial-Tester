import QtQuick 2.15

pragma Singleton

Item {
    property real scale: 1.0
    property real pixel1: 1 * scale
    property real pixel4: 4 * scale
    property real pixel8: 8 * scale
    property real pixel10: 10 * scale
    property real pixel12: 12 * scale
    property real pixel14: 14 * scale
    property real pixel16: 16 * scale
    property real pixel18: 18 * scale
    property real pixel20: 20 * scale
    property real pixel22: 22 * scale
    property real pixel24: 24 * scale
    property real pixel32: 32 * scale
    property real pixel40: 40 * scale
    property real pixel48: 48 * scale
    property real pixel64: 64 * scale

    enum Grade {
        S,
        M,
        L
    }
}
