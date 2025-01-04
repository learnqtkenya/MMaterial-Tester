import QtQuick 
import QtQuick.Layouts

import MMaterial.UI as UI
import MMaterial.Controls as Controls
import MMaterial.Controls.Pagination

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
                bottomMargin: _paginator.height + UI.Size.pixel10
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
                top: _paginator.bottom; topMargin: UI.Size.pixel28
                horizontalCenter: _paginator.horizontalCenter
            }

			Controls.MFabButton {
                text: "Contained"
				type: Controls.MButton.Type.Contained

                onClicked: _paginator.selectedType = type
            }

			Controls.MFabButton {
                text: "Outlined"
				type: Controls.MButton.Type.Outlined

                onClicked: _paginator.selectedType = type
            }

			Controls.MFabButton {
                text: "Soft"
				type: Controls.MButton.Type.Soft

                onClicked: _paginator.selectedType = type
            }
        }
    }
}
