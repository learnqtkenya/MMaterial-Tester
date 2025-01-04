import QtQuick 

import MMaterial.UI as UI
import MMaterial.Controls.Pagination

Item {
    objectName: "Pagination Simple"

    Item {
        anchors {
            fill: parent
            margins: UI.Size.pixel32
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
                margins: UI.Size.pixel14
                right: parent.right
                bottom: parent.bottom
            }

            indexView: _simpleSwipeView
        }
    }
}
