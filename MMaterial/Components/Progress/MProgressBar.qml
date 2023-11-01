import QtQuick 
import QtQuick.Layouts

import MMaterial

RowLayout {
    id: _progress

    property real lineWidth: Size.pixel4

    property var accent: Theme.primary
    property color foregroundColor: accent.main
    property color backgroundColor: accent.transparent.p24
    property bool showLabel: false
    
    property alias barHeight: _bar.height
    property alias label: _label

    property int progress: 50

    implicitWidth: 300
    implicitHeight: Size.pixel10

    Rectangle {
        id: _bar

        Layout.alignment: Qt.AlignVCenter
        Layout.fillWidth: true
        Layout.preferredHeight: _progress.lineWidth

        color: _progress.backgroundColor
        radius: 50

        Rectangle {
            id: _innerBar

            anchors {
                top: parent.top
                left: parent.left
                bottom: parent.bottom
            }

            width: _progress.progress * parent.width / 100

            color: _progress.foregroundColor
            radius: _bar.radius

            Behavior on width { SmoothedAnimation { duration: 50;} }
        }
    }
    Caption{
        id: _label

        Layout.preferredWidth: contentWidth
        Layout.alignment: Qt.AlignVCenter

        visible: _progress.showLabel
        color: Theme.text.secondary
        text: _progress.progress + "%"
        verticalAlignment: Qt.AlignVCenter

        onContentWidthChanged: font.pixelSize * 2.6
    }
}
