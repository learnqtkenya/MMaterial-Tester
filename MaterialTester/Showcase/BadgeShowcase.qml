import QtQuick 2.15
import QtQuick.Layouts

import MMaterial

Item {
    objectName: "Badge"
    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 32
        H6{
            text: qsTr("Number")
        }
        GridLayout{
            id: numberBadgeGrid
            Layout.topMargin: 24
            Layout.fillWidth: true
            columns: 7
            rowSpacing: 40
            columnSpacing: 40

            Badge{
                accent: Theme.primary
                type: Badge.Type.Number
                onClicked: quantity = 0
            }
            Badge{
                accent: Theme.secondary
                type: Badge.Type.Number
                onClicked: quantity = 0
            }
            Badge{
                accent: Theme.info
                type: Badge.Type.Number
                onClicked: quantity = 0
            }
            Badge{
                accent: Theme.success
                type: Badge.Type.Number
                onClicked: quantity = 0
            }
            Badge{
                accent: Theme.warning
                type: Badge.Type.Number
                onClicked: quantity = 0
            }
            Badge{
                accent: Theme.error
                type: Badge.Type.Number
                onClicked: quantity = 0
            }
            Badge{
                accent: Theme.success
                type: Badge.Type.Number
                onClicked: quantity = 0
            }
            Badge{
                accent: Theme.error
                type: Badge.Type.Number
                quantity: 1
                onClicked: quantity = 0
            }
            Badge{
                accent: Theme.error
                type: Badge.Type.Number
                quantity: 1500
                maxQuantity: 99
                onClicked: quantity = 0
            }
            Badge{
                accent: Theme.error
                type: Badge.Type.Number
                quantity: 1500
                maxQuantity: 999
                onClicked: quantity = 0
            }
        }
        H6{

            Layout.topMargin: 48
            text: qsTr("Dot")
        }
        GridLayout{
            id: dotBadgeGrid
            Layout.topMargin: 24
            Layout.fillWidth: true
            columns: 7
            rowSpacing: 40
            columnSpacing: 40

            Badge{
                accent: Theme.primary
                onClicked: quantity = 0
            }
            Badge{
                accent: Theme.secondary
                onClicked: quantity = 0
            }
            Badge{
                accent: Theme.info
                onClicked: quantity = 0
            }
            Badge{
                accent: Theme.success
                onClicked: quantity = 0
            }
            Badge{
                accent: Theme.warning
                onClicked: quantity = 0
            }
            Badge{
                accent: Theme.error
                onClicked: quantity = 0
            }
            Badge{
                accent: Theme.success
                onClicked: quantity = 0
            }
        }
        Item{ Layout.fillHeight: true; }
    }
}
