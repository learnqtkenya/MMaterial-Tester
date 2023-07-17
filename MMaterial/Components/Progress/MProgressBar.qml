import QtQuick 2.15
import QtQuick.Layouts

import MMaterial

RowLayout{
    id: _progress

    height: recommendedHeight
    width: recommendedWidth
    Layout.preferredHeight: recommendedHeight
    Layout.preferredWidth: recommendedWidth

    property real recommendedWidth: 300
    property real recommendedHeight: Size.pixel10
    property real lineWidth: Size.pixel4

    property var accent: Theme.primary
    property color foregroundColor: accent.main
    property color backgroundColor: accent.transparent.p24
    property bool showLabel: false
    
    property alias barHeight: _bar.height
    property alias label: _label

    property int progress: 50


    Rectangle{
        id: _bar

        Layout.alignment: Qt.AlignVCenter
        Layout.fillWidth: true
        Layout.preferredHeight: _progress.lineWidth
        color: _progress.backgroundColor
        radius: 50

        Rectangle{
            id: _innerBar

            Behavior on width { SmoothedAnimation { duration: 50;} }
            anchors {
                top: parent.top
                left: parent.left
                bottom: parent.bottom
            }
            width: _progress.progress * parent.width / 100
            color: _progress.foregroundColor
            radius: _bar.radius
        }
    }
    Caption{
        id: _label
        visible: _progress.showLabel
        color: Theme.text.secondary
        text: _progress.progress + "%"
        Layout.preferredWidth: contentWidth
        onContentWidthChanged: font.pixelSize * 2.6
        Layout.alignment: Qt.AlignVCenter
        verticalAlignment: Qt.AlignVCenter
    }
}
