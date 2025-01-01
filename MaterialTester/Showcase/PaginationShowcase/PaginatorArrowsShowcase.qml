import QtQuick 

import MMaterial
import MMaterial.Controls.Pagination

Item {
    objectName: "Pagination Arrows"

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
