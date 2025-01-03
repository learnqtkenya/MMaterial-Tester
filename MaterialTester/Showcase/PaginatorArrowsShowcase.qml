import QtQuick 

import MMaterial.UI as UI
import MMaterial.Controls.Pagination

Item {
    objectName: "Pagination Arrows"

    Item {
        anchors {
            fill: parent
            margins: UI.Size.pixel32
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
