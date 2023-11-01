import QtQuick 

import MMaterial

Item {
    objectName: "Pagination Arrows"
    visible: showcaseLoader.status == Loader.Ready

    Item {
        anchors {
            fill: parent
            margins: Size.pixel32
        }

        CustomSwipeView {
            id: _arrowSwipeView

            anchors {
                fill: parent
            }
        }

        PaginatorArrows {
            indexView: _arrowSwipeView
        }
    }
}
