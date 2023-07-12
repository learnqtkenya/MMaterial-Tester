import QtQuick
import QtQuick.Controls

import MMaterial

Item{
    id: _paginator
    height: Size.pixel36
    anchors {
        left: indexView.left
        right: indexView.right
        verticalCenter: indexView.verticalCenter
        margins: Size.pixel16
    }

    required property SwipeView indexView

    Rectangle{
        id: _leftArrow
        height: parent.height
        width: height
        color: _leftMouseArea.pressed ? Theme.main.p700 : Theme.main.p800
        radius: 10
        anchors {
            left: parent.left
        }
        enabled: _paginator.indexView.currentIndex > 0
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
            onClicked: {
                _paginator.indexView.decrementCurrentIndex();
            }
        }
    }

    Rectangle{
        id: _rightArrow
        height: parent.height
        width: height
        color: _rightMouseArea.pressed ? Theme.main.p700 : Theme.main.p800
        radius: 10
        anchors {
            right: parent.right
        }
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
            onClicked: {
                _paginator.indexView.incrementCurrentIndex();
            }
        }
    }
}
