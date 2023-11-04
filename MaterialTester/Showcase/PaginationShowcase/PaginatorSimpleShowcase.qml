import QtQuick 

import MMaterial

Item {
    objectName: "Pagination Simple"

    Item {
        anchors {
            fill: parent
            margins: Size.pixel32
        }

        CustomSwipeView {
            id: _simpleSwipeView

            anchors {
                fill: parent
            }
        }

        PaginatorSimple {
            id: _simplePaginator

            anchors {
                margins: Size.pixel14
                right: parent.right
                bottom: parent.bottom
            }

            indexView: _simpleSwipeView
        }
    }
}
