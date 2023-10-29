import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import MMaterial

Rectangle {
    id: _paginator

    required property SwipeView indexView

    property int numberOfPages: indexView.count

    implicitWidth: height * 3 - Size.pixel4
    implicitHeight: Size.pixel32

    anchors.bottom: parent.bottom

    radius: 8
    color: Theme.main.p800

    Item{
        id: _leftArrow

        anchors.left: parent.left

        height: parent.height
        width: height

        Icon{
            anchors.centerIn: parent

            path: IconList.arrow
            color: Theme.common.white
            sourceSize.height: parent.height * 0.2
            rotation: 90
            interactive: true
            enabled: _paginator.indexView.currentIndex > 0
            opacity: enabled ? 1 : 0.48

            onClicked: _paginator.indexView.decrementCurrentIndex();
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

        anchors.right: parent.right

        height: parent.height
        width: height

        Icon{
            anchors.centerIn: parent

            path: IconList.arrow
            color: Theme.common.white
            sourceSize.height: parent.height * 0.2
            rotation: -90
            interactive: true
            enabled: _paginator.indexView.currentIndex < _paginator.indexView.count - 1
            opacity: enabled ? 1 : 0.48

            onClicked: _paginator.indexView.incrementCurrentIndex();
        }
    }
}
