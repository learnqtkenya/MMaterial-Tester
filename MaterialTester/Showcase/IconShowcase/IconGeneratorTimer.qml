import QtQuick
import QtQuick.Layouts

import MMaterial

Item {
    id: _root

    required property string title
    required property IconData iconData

    signal finished(string time)

    H2 {
        id: _header
        width: _root.width
        text: _root.title
    }

    Rectangle {
        id: _container

        anchors {
            left: _root.left
            right: _root.right
            top: _header.bottom; topMargin: Size.pixel22
            bottom: _root.bottom
        }

        color: "transparent"
        radius: 8

        border {
            color: Theme.primary.main
            width: 2
        }

        GridView {
            id: _grid

            anchors {
                fill: _container
                margins: Size.pixel20
            }

            cellHeight: Size.pixel28
            cellWidth: Size.pixel28
            model: Math.max((_grid.height / cellHeight) * (_grid.width / cellWidth), 0)
            opacity: timer.finished ? 0.25 : 1

            delegate: Icon {
                size: Size.pixel24
                iconData: _root.iconData
                color: Theme.text.primary

                Component.onCompleted: {
                    if (!timer.running)
                        timer.start()
                }

                onStatusChanged: {
                    if (status == Loader.Ready) {
                        timer.loadedElements++;

                        if(timer.loadedElements === _grid.count)
                            timer.stop();
                    }
                }
            }

            QtObject {
                id: timer

                property int loadedElements: 0

                property bool finished: false
                property string time: ""

                property real startTime: 0

                function start() {
                    timer.startTime = new Date().getTime();
                }

                function stop() {
                    timer.time = (new Date().getTime() - timer.startTime) + "ms";
                    timer.finished = true;
                }
            }
        }

        B1 {
            id: _titleText

            anchors.centerIn: _container
            width: _container.width

            visible: timer.finished
            text: _root.title + " " + qsTr("finished in: ") + timer.time
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            font {
                bold: true
                pixelSize: Size.pixel40 * 1.5
            }
        }

        MButton {

            anchors {
                horizontalCenter: _titleText.horizontalCenter
                top: _titleText.bottom
                topMargin: Size.pixel12
            }

            visible: timer.finished
            text: qsTr("Next")

            onClicked: _root.finished(timer.time)
        }
    }
}
