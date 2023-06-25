import QtQuick 2.15
import "../../Fonts/Texts"
import "../../Colors"
import "../../Settings"

Rectangle{
    id: _badge
    radius: 100
    color: _badge.accent.main
    height: number.implicitHeight + verticalPadding
    width: Math.max(number.implicitWidth + horizontalPadding, height)

    property real verticalPadding: pixelSize/2
    property real horizontalPadding: pixelSize
    property var accent: Theme.error //Needs to be PaletteBasic type
    property int quantity: 1
    property int maxQuantity: 999
    property int pixelSize: Size.pixel24

    H4{
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
