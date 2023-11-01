import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import MMaterial

ListView {
    id: _pagination

    required property SwipeView indexView

    property int numberOfPages: indexView.count

    implicitWidth: childrenRect.width
    implicitHeight: Size.pixel24

    model: numberOfPages
    currentIndex: indexView.currentIndex

    clip: true
    interactive: false
    spacing: 0
    orientation: ListView.Horizontal

    onCurrentIndexChanged: positionViewAtIndex(currentIndex, ListView.Center);

    delegate: Item {
        height: _pagination.height
        width: height

        Rectangle {
            id: _dot

            property bool checked: _pagination.currentIndex === index

            anchors.centerIn: parent

            height: _pagination.height / 3
            width: height

            radius: 100
            color: Theme.primary.main

            states: [
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

        MouseArea {
            anchors.fill: parent

            cursorShape: Qt.PointingHandCursor

            onClicked: _pagination.indexView.currentIndex = index;
        }
    }
}
