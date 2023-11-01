import QtQuick 
import QtQuick.Controls

import MMaterial

SwipeView {
    id: _swipeView

    property var images: [
        ImageList.man,
        ImageList.manSitting,
        ImageList.woman,
        ImageList.womanSitting
    ]

    function preventResizing(){
        _swipeView.visible = false;
        _resizingPreventionTimer.restart();
    }

    spacing: Size.pixel20
    currentIndex: 0
    clip: true

    onWidthChanged: preventResizing();
    onHeightChanged: preventResizing();

    Timer {
        id: _resizingPreventionTimer

        interval: 50

        onTriggered: _swipeView.visible = true
    }

    Repeater {
        model: _swipeView.images.length

        delegate: Rectangle {
            color: Theme.common.white
            radius: 10

            border {
                color: Theme.primary.main
                width: Size.pixel1*2
            }

            Icon {
                anchors {
                    margins: parent.border.width
                    fill: parent
                }

                path: _swipeView.images[index]
                sourceSize.height: parent.height
            }
        }
    }
}
