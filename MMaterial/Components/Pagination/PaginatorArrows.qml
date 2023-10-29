import QtQuick
import QtQuick.Controls

import MMaterial

Item{
    id: _paginator

    required property SwipeView indexView

    anchors {
        left: indexView.left
        right: indexView.right
        verticalCenter: indexView.verticalCenter
        margins: Size.pixel16
    }

    height: Size.pixel36

    Rectangle{
        id: _leftArrow

        anchors.left: parent.left

        height: parent.height
        width: height

        enabled: _paginator.indexView.currentIndex > 0
        color: _leftMouseArea.pressed ? Theme.main.p700 : Theme.main.p800
        radius: 10
        opacity: enabled ? 1 : 0.48

        Icon{
            id: _leftIcon

            path: IconList.arrow
            color: Theme.common.white
            sourceSize.height: parent.height * 0.2
            anchors.centerIn: parent
            rotation: 90
        }

        MouseArea{
            id: _leftMouseArea

            anchors.fill: parent

            hoverEnabled: parent.enabled
            cursorShape: Qt.PointingHandCursor

            onClicked: _paginator.indexView.decrementCurrentIndex();
        }
    }

    Rectangle{
        id: _rightArrow

        anchors.right: parent.right

        height: parent.height
        width: height

        color: _rightMouseArea.pressed ? Theme.main.p700 : Theme.main.p800
        radius: 10

        enabled: _paginator.indexView.currentIndex < _paginator.indexView.count - 1
        opacity: enabled ? 1 : 0.48

        Icon{
            path: IconList.arrow
            color: Theme.common.white
            sourceSize.height: parent.height * 0.2
            anchors.centerIn: parent
            rotation: -90
        }

        MouseArea{
            id: _rightMouseArea

            anchors.fill: parent

            hoverEnabled: parent.enabled
            cursorShape: Qt.PointingHandCursor

            onClicked: _paginator.indexView.incrementCurrentIndex();
        }
    }
}
