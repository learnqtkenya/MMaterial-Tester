pragma ComponentBehavior: Bound

import QtQuick

import MMaterial.UI as UI
import MMaterial.Media as Media
import MMaterial.Controls as Controls

Item {
    id: _root

    required property string title
	required property Media.IconData iconData

    signal finished(string time)

	UI.H2 {
        id: _header
        width: _root.width
        text: _root.title
    }

    Rectangle {
        id: _container

        anchors {
            left: _root.left
            right: _root.right
            top: _header.bottom; topMargin: UI.Size.pixel22
            bottom: _root.bottom
        }

        color: "transparent"
        radius: 8

        border {
			color: UI.Theme.primary.main
            width: 2
        }

        GridView {
            id: _grid

            anchors {
                fill: _container
                margins: UI.Size.pixel20
            }

            cellHeight: UI.Size.pixel28
            cellWidth: UI.Size.pixel28
            model: Math.max((_grid.height / cellHeight) * (_grid.width / cellWidth), 0)
            opacity: timer.finished ? 0.25 : 1

			delegate: Media.Icon {
                size: UI.Size.pixel24
                iconData: _root.iconData
				color: UI.Theme.text.primary.toString()

                Component.onCompleted: {
					if (!timer.finished)
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

        UI.B1 {
            id: _titleText

            anchors.centerIn: _container
            width: _container.width

            visible: timer.finished
            text: _root.title + " " + qsTr("finished in: ") + timer.time
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            font {
                bold: true
                pixelSize: UI.Size.pixel40 * 1.5
            }
        }

		Controls.MButton {

            anchors {
                horizontalCenter: _titleText.horizontalCenter
                top: _titleText.bottom
                topMargin: UI.Size.pixel12
            }

            visible: timer.finished
            text: qsTr("Next")

            onClicked: _root.finished(timer.time)
        }
    }
}
