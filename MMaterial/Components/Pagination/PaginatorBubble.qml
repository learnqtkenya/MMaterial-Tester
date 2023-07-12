import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import MMaterial

ListView{
    id: _pagination
    height: recommendedHeight
    width: recommendedWidth

    Layout.preferredWidth: recommendedWidth
    Layout.preferredHeight: recommendedHeight

    readonly property real recommendedWidth: childrenRect.width
    readonly property real recommendedHeight: Size.pixel24

    required property SwipeView indexView

    property int numberOfPages: indexView.count

    interactive: false
    model: numberOfPages
    spacing: 0
    orientation: ListView.Horizontal
    clip: true
    currentIndex: indexView.currentIndex

    onCurrentIndexChanged: {
        positionViewAtIndex(currentIndex, ListView.Center)
    }

    delegate: Item{
        height: _pagination.height
        width: height
        Rectangle{
            id: _dot
            anchors.centerIn: parent
            height: _pagination.height / 3
            width: height
            radius: 100
            color: Theme.primary.main
            property bool checked: _pagination.currentIndex === index

            states: [
                //checked and unchecked
                State {
                    name: "checked"
                    when: _dot.checked
                    PropertyChanges {
                        target: _dot
                        opacity: 1
                        width: height * 2.2
                    }
                },
                State {
                    when: true
                    name: "unchecked"
                    PropertyChanges {
                        target: _dot
                        opacity: 0.32
                        width: height
                    }
                }
            ]

            transitions: [
                //opacity transition
                Transition {
                    from: "*"
                    NumberAnimation {
                        properties: "width"
                        duration: 1300
                        easing.type: Easing.OutElastic
                    }
                    NumberAnimation {
                        properties: "opacity"
                        duration: 300
                    }
                }
            ]
        }

        MouseArea{
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: {
                _pagination.indexView.currentIndex = index;
            }
        }
    }
}
