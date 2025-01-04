import QtQuick 

import MMaterial.UI as UI
import MMaterial.Controls.Pagination

Item {
    objectName: "Pagination Bubble"

    Item {
        anchors {
            fill: parent
            margins: UI.Size.pixel32
        }

        CustomSwipeView {
            id: _bubbleSwipeView

            anchors {
                bottomMargin: _bubble.height + UI.Size.pixel10
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
