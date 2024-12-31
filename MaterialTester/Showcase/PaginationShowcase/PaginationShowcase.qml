import QtQuick 
import QtQuick.Layouts

import MMaterial

Item {
    objectName: "Pagination"

    Item {
        anchors {
            fill: parent
            margins: Math.min(Window.width * 0.1, Window.height * 0.1)
        }

        CustomSwipeView {
            id: _paginatorSwipeView

            anchors {
                bottomMargin: _paginator.height + Size.pixel10
                fill: parent
            }
        }

        Paginator {
            id: _paginator

            anchors {
                horizontalCenter: parent.horizontalCenter
                bottom: parent.bottom
            }

            indexView: _paginatorSwipeView
        }

        RowLayout {
            anchors {
                top: _paginator.bottom; topMargin: Size.pixel28
                horizontalCenter: _paginator.horizontalCenter
            }

            MFabButton {
                text: "Contained"
                type: MButton.Type.Contained

                onClicked: _paginator.selectedType = type
            }

            MFabButton {
                text: "Outlined"
                type: MButton.Type.Outlined

                onClicked: _paginator.selectedType = type
            }

            MFabButton {
                text: "Soft"
                type: MButton.Type.Soft

                onClicked: _paginator.selectedType = type
            }
        }
    }
}
