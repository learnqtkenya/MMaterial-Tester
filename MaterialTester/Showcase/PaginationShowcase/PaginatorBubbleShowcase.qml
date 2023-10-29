import QtQuick 

import MMaterial

Item {
    objectName: "Pagination Bubble"
    visible: showcaseLoader.status == Loader.Ready
    Item{
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
        PaginatorBubble{
            id: _bubble
            indexView: _bubbleSwipeView
            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
            }
        }
    }


}
