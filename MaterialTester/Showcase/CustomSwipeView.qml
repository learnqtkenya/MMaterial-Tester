pragma ComponentBehavior: Bound

import QtQuick 
import QtQuick.Controls.Material

import MMaterial.UI as UI
import MMaterial.Media as Media

SwipeView {
    id: _swipeView

    component ImagePreview: Rectangle {
		id: del

		required property int index
        property alias iconData: _icon.iconData

		color: UI.Theme.common.white
        radius: 10

        border {
            color: UI.Theme.primary.main
            width: UI.Size.pixel1*2
        }

		Media.Icon {
            id: _icon
            anchors {
                margins: parent.border.width
                fill: parent
            }

			iconData: _swipeView.images[del.index]
            size: parent.height
        }
    }

    property list<Media.IconData> images: [
		Media.Images.man,
		Media.Images.manSitting,
		Media.Images.woman,
        Media.Images.womanSitting
    ]

    function preventResizing() : void {
        _swipeView.visible = false;
        _resizingPreventionTimer.restart();
    }

    spacing: UI.Size.pixel20
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
	ImagePreview { index: 0; iconData: _swipeView.images[0] }
	ImagePreview { index: 1; iconData: _swipeView.images[1] }
	ImagePreview { index: 2; iconData: _swipeView.images[2] }
	ImagePreview { index: 3; iconData: _swipeView.images[3] }
}
