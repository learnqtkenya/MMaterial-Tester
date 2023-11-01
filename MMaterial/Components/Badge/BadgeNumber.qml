import QtQuick 

import MMaterial

Rectangle {
    id: _badge

    property real verticalPadding: pixelSize/2
    property real horizontalPadding: pixelSize
    property var accent: Theme.error //Needs to be PaletteBasic type
    property int quantity: 1
    property int maxQuantity: 999
    property int pixelSize: Size.pixel24

    height: number.implicitHeight + verticalPadding
    width: Math.max(number.implicitWidth + horizontalPadding, height)

    radius: 100
    color: _badge.accent.main

    H4 {
        id: number

        anchors.centerIn: parent

        text: _badge.quantity > _badge.maxQuantity ? _badge.maxQuantity + "+" : _badge.quantity
        color: _badge.accent.contrastText
        font.pixelSize: _badge.pixelSize
        verticalAlignment: Qt.AlignVCenter
        font.bold: true
        lineHeight: 1
    }
}
