import QtQuick 
import QtQuick.Controls

import MMaterial

Item {
    id: _root
    objectName: "Intro"

    H1 {
        anchors.top: parent.top
        text: qsTr("%1:%2").arg(d.angleToHour(secondRotation.angle)).arg(d.angleToMinute(secondRotation.angle))
    }

    Rectangle {
        id: clockFace

        property real clockNumbersMargin: Size.scale * 18
        property alias hand: secondHand

        implicitWidth: 300
        implicitHeight: 300

        radius: height / 2
        color: "lightblue"
        anchors.centerIn: parent

        Rectangle {
            id: secondHand
            anchors {
                centerIn: parent
                verticalCenterOffset: -height / 2
            }
            width: 1.69 * Size.scale
            height: clockFace.width / 2 - clockFace.clockNumbersMargin
            color: "red"
            antialiasing: true

            transform: Rotation {
                id: secondRotation
                origin.x: secondHand.width / 2
                origin.y: secondHand.height
                angle: 0
                onAngleChanged: console.log(secondRotation.angle % 12)
            }

            Rectangle {
                height: Size.pixel6
                width: height
                radius: height / 2
                color: secondHand.color

                anchors {
                    top: secondHand.bottom
                    horizontalCenter: secondHand.horizontalCenter
                }
            }

            Rectangle {
                height: clockFace.clockNumbersMargin * 2
                width: height
                radius: height / 2
                color: secondHand.color
                scale: secondRotation.angle % 30 === 0 ? 1 : 0.2

                anchors {
                    top: secondHand.top
                    topMargin: -height / 2
                    horizontalCenter: secondHand.horizontalCenter
                }

                Behavior on scale { NumberAnimation { duration: 80 } }
            }
        }

        Repeater {
            model: [12, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
            delegate: H1 {
                text: modelData
                font.pixelSize: Size.pixel20
                color: "black"
                x: clockFace.width / 2 + Math.cos(Math.PI / 6 * index - Math.PI / 2) * (clockFace.width / 2 - clockFace.clockNumbersMargin) - width / 2
                y: clockFace.height / 2 + Math.sin(Math.PI / 6 * index - Math.PI / 2) * (clockFace.height / 2 - clockFace.clockNumbersMargin) - height / 2
            }
        }

        MouseArea {
            id: mouseArea

            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true
            onPositionChanged: (mouse) => {
                                   if (!mouseArea.pressed)
                                   return;

                                   // Inline angle calculation
                                   const centerX = clockFace.width / 2;
                                   const centerY = clockFace.height / 2;
                                   const dx = mouse.x - centerX;
                                   const dy = mouse.y - centerY;
                                   let angle = Math.atan2(dy, dx) * (180 / Math.PI) + 90;
                                   if (angle < 0) {
                                       angle += 360;
                                   }
                                   secondRotation.angle = Math.round(angle);
                               }
        }

        QtObject {
            id: d

            function angleToHour(angle) {
                // Normalize the angle to the range [0, 360)
                let normalizedAngle = angle % 360;
                if (normalizedAngle < 0) {
                    normalizedAngle += 360;
                }

                // Calculate the hour based on the angle
                let hour = Math.floor(normalizedAngle / 30);
                if (hour > 12) {
                    hour -= 12;
                }
                return hour;
            }

            function angleToMinute(angle) {
                // Normalize the angle to the range [0, 360)
                let normalizedAngle = angle % 360;
                if (normalizedAngle < 0) {
                    normalizedAngle += 360;
                }

                // Calculate the minute based on the angle
                let minute = Math.floor((normalizedAngle / 6)) % 60;
                return minute;
            }
        }
    }
}
