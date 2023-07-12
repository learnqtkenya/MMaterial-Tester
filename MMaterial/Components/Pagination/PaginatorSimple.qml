import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import MMaterial

Rectangle {
    id: _paginator
    anchors {
        bottom: parent.bottom
    }
    radius: 8
    height: recommendedHeight
    width: recommendedWidth

    Layout.preferredWidth: recommendedWidth
    Layout.preferredHeight: recommendedHeight

    color: Theme.main.p800

    readonly property real recommendedWidth: height * 3 - Size.pixel4
    readonly property real recommendedHeight: Size.pixel32

    required property SwipeView indexView

    property int numberOfPages: indexView.count

    Item{
        id: _leftArrow
        height: parent.height
        width: height
        anchors {
            left: parent.left
        }
        Icon{
            path: IconList.arrow
            color: Theme.common.white
            sourceSize.height: parent.height * 0.2
            anchors.centerIn: parent
            rotation: 90
            interactive: true
            onClicked: _paginator.indexView.decrementCurrentIndex();
            enabled: _paginator.indexView.currentIndex > 0
            opacity: enabled ? 1 : 0.48
        }
    }

    Subtitle2{
        anchors{
            left: _leftArrow.right
            right: _rightArrow.left
        }
        height: parent.height
        verticalAlignment: Qt.AlignVCenter
        horizontalAlignment: Qt.AlignHCenter
        text: _paginator.indexView.currentIndex + 1 + "/" + _paginator.numberOfPages
        color: Theme.common.white
        font {
            bold: true
            pixelSize: parent.height * 0.45
        }
    }

    Item{
        id: _rightArrow
        height: parent.height
        width: height
        anchors {
            right: parent.right
        }
        Icon{
            path: IconList.arrow
            color: Theme.common.white
            sourceSize.height: parent.height * 0.2
            anchors.centerIn: parent
            rotation: -90
            interactive: true
            onClicked: _paginator.indexView.incrementCurrentIndex();
            enabled: _paginator.indexView.currentIndex < _paginator.indexView.count - 1
            opacity: enabled ? 1 : 0.48
        }
    }
}
