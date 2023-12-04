import QtQuick 
import QtQuick.Controls

import MMaterial

SwipeView {
    id: _swipeView

    component ImagePreview: Rectangle {

        property alias iconData: _icon.iconData

        color: Theme.common.white
        radius: 10

        border {
            color: Theme.primary.main
            width: Size.pixel1*2
        }

        Icon {
            id: _icon
            anchors {
                margins: parent.border.width
                fill: parent
            }

            iconData: _swipeView.images[index]
            size: parent.height
        }
    }

    property list<IconData> images: [
        Images.man,
        Images.manSitting,
        Images.woman,
        Images.womanSitting
    ]

    function preventResizing() : void {
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

    //Using a repeater causes the currentIndex to go to the last element in an async loader
    ImagePreview { iconData: _swipeView.images[0] }
    ImagePreview { iconData: _swipeView.images[1] }
    ImagePreview { iconData: _swipeView.images[2] }
    ImagePreview { iconData: _swipeView.images[3] }
}
