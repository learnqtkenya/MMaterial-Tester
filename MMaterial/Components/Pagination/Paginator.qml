import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import MMaterial

Item{
    id: _pagination
    height: recommendedHeight
    width: recommendedWidth

    Layout.preferredWidth: recommendedWidth
    Layout.preferredHeight: recommendedHeight

    readonly property real recommendedWidth: _decrementButton.width + _incrementButton.width + (Math.min(visiblePageCount, _listView.count) * (Size.pixel40 + _listView.spacing) + _listView.spacing)
    readonly property real recommendedHeight: Size.pixel40

    required property SwipeView indexView

    property int visiblePageCount: 3
    property int numberOfPages: indexView.count

    property int selectedType: MFabButton.Type.Soft
    property int radius: 10
    MFabButton{
        id: _decrementButton
        height: parent.height
        width: height
        anchors.left: parent.left
        radius: _pagination.radius
        horizontalPadding: 0
        verticalPadding: 0
        type: MFabButton.Type.Text
        enabled: _listView.currentIndex > 0
        accent: Theme.defaultNeutral
        leftIcon {
            rotation: 90
            path: IconList.arrow
            sourceSize.height: _listView.height * 0.15
        }

        onClicked: _pagination.indexView.decrementCurrentIndex();
    }
    ListView{
        id: _listView
        anchors{
            left: _decrementButton.right
            right: _incrementButton.left
            margins: _listView.spacing
        }
        height: parent.height
        model: _pagination.numberOfPages
        spacing: Size.pixel6
        orientation: ListView.Horizontal
        clip: true
        currentIndex: _pagination.indexView.currentIndex

        onCurrentIndexChanged: {
            positionViewAtIndex(currentIndex, ListView.Center)
        }

        delegate: MFabButton{
            height: _pagination.height
            width: height
            radius: _pagination.radius
            text: (modelData+1)
            horizontalPadding: 0
            verticalPadding: 0
            title.font {
                bold: ListView.isCurrentItem
                family: ListView.isCurrentItem ? PublicSans.semiBold : PublicSans.regular
            }
            accent: ListView.isCurrentItem ? Theme.primary : Theme.defaultNeutral
            type: ListView.isCurrentItem ? _pagination.selectedType : MFabButton.Type.Text
            onClicked: {
                _pagination.indexView.currentIndex = index;
            }
        }
    }
    MFabButton{
        id: _incrementButton
        height: parent.height
        width: height
        anchors.right: parent.right
        radius: _pagination.radius
        horizontalPadding: 0
        verticalPadding: 0
        accent: Theme.defaultNeutral
        type: MFabButton.Type.Text
        enabled: _listView.currentIndex < _listView.count-1
        leftIcon {
            rotation: -90
            path: IconList.arrow
            sourceSize.height: _listView.height * 0.15
        }
        onClicked: _pagination.indexView.incrementCurrentIndex();
    }
}
