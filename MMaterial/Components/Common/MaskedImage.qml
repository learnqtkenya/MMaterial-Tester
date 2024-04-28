import QtQuick
import QtQuick.Effects

import MMaterial as MMaterial

Item {
    id: control

    property alias source: sourceImageItem.source
    property alias radius: mask.radius
    property alias fillMode: sourceImageItem.fillMode

    implicitHeight: MMaterial.Size.pixel48
    implicitWidth: MMaterial.Size.pixel48

    Image {
        id: sourceImageItem

        anchors.fill: control
        visible: false
        asynchronous: true
        fillMode: Image.PreserveAspectCrop
    }

    MultiEffect {
        source: sourceImageItem
        anchors.fill: sourceImageItem
        maskEnabled: true
        maskSource: mask
        maskThresholdMin: 0.5
        maskSpreadAtMin: 1
        maskSpreadAtMax: 1
    }

    Rectangle {
        id: mask

        width: sourceImageItem.width
        height: sourceImageItem.height
        layer.enabled: true
        visible: false
        radius: width / 2
        color: "black"
        antialiasing: true
    }
}
