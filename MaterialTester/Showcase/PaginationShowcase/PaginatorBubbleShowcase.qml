import QtQuick 

import MMaterial

Item {
    objectName: "Pagination Bubble"

    Item {
        anchors {
            fill: parent
            margins: Size.pixel32
        }

        CustomSwipeView {
            id: _bubbleSwipeView

            anchors {
                bottomMargin: _bubble.height + Size.pixel10
                fill: parent
            }
        }

        PaginatorBubble {
            id: _bubble

            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
            }

            indexView: _bubbleSwipeView
        }
    }
}
