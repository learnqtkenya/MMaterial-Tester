import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import MMaterial as MMaterial

Item {
    id: root

    component ListELement: Rectangle {
        id: elementRoot

        signal clicked

        height: MMaterial.Size.pixel40
        width: chartEditorList.width

        color: elementMA.containsMouse ? MMaterial.Theme.background.neutral : "transparent"
        radius: MMaterial.Size.pixel8
        opacity: elementMA.pressed ? 0.8 : 1

        border {
            width: 1
            color: MMaterial.Theme.text.disabled
        }

        MouseArea {
            id: elementMA

            anchors.fill: elementRoot
            hoverEnabled: true
            onClicked: elementRoot.clicked()
        }
    }

    QtObject {
        id: d

        readonly property bool isWide: root.width > root.height
    }

    ColumnLayout {
        id: controlLayout

        height: d.isWide ? root.height : root.height / 2 - MMaterial.Size.pixel30
        width: d.isWide ? root.width / 2 - MMaterial.Size.pixel30 : root.width
        spacing: MMaterial.Size.pixel20

        anchors {
            right: root.right
            top: root.top
        }

        Item { Layout.fillHeight: true }

        MMaterial.MSwitch {
            text: qsTr("Orientation")
            checked: barChart.orientation == ListView.Horizontal
            onCheckedChanged: barChart.orientation = checked ? ListView.Horizontal : ListView.Vertical
        }

        MMaterial.MSwitch {
            text: qsTr("Auto Resize")
            checked: barChart.autoResize
            onCheckedChanged: barChart.autoResize = checked
        }

        ListView {
            id: chartEditorList

            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.maximumWidth: root.width / 2 - MMaterial.Size.pixel30

            footerPositioning: ListView.OverlayFooter
            model: barChart.chartModel
            spacing: MMaterial.Size.pixel10


            delegate: ListELement {
                id: chartDelRoot

                RowLayout {
                    anchors {
                        fill: chartDelRoot
                        leftMargin: MMaterial.Size.pixel10
                        rightMargin: MMaterial.Size.pixel10
                    }

                    TextInput {
                        id: input
                        Layout.alignment: Qt.AlignVCenter
                        Layout.preferredWidth: contentWidth
                        Layout.leftMargin: MMaterial.Size.pixel10
                        verticalAlignment: Qt.AlignVCenter
                        color: MMaterial.Theme.text.primary
                        text: name

                        onTextEdited: name = text

                        font {
                            family: MMaterial.PublicSans.regular
                            pixelSize: MMaterial.Size.pixel16
                        }
                    }

                    Item { Layout.fillWidth: true }

                    ListView {
                        id: barRectList

                        Layout.preferredHeight: MMaterial.Size.pixel28
                        Layout.alignment: Qt.AlignVCenter
                        Layout.preferredWidth: contentWidth
                        Layout.leftMargin: MMaterial.Size.pixel20
                        Layout.maximumWidth: parent.width - input.width + spacing

                        spacing: MMaterial.Size.pixel10
                        orientation: ListView.Horizontal
                        interactive: false
                        model: element
                        clip: true

                        delegate: Rectangle {
                            id: barRect

                            height: barRectList.height
                            width: height
                            color: barColor
                            radius: chartDelRoot.radius * 0.6

                            border {
                                width: rectMA.containsMouse ? 2 : 1
                                color: MMaterial.Theme.text.primary
                            }

                            MouseArea {
                                id: rectMA

                                anchors.fill: barRect
                                hoverEnabled: true

                                onClicked: {}
                            }
                        }

                        footer: Item {
                            height: barRectList.height
                            width: height + barRectList.spacing

                            Rectangle {
                                id: barRectFooter

                                anchors.right: parent.right

                                height: barRectList.height
                                width: height

                                color: "transparent"
                                radius: chartDelRoot.radius * 0.6

                                border {
                                    width: rectFooterMA.containsMouse ? 2 : 1
                                    color: MMaterial.Theme.text.primary
                                }

                                MMaterial.Icon {
                                    anchors.centerIn: barRectFooter
                                    size: MMaterial.Size.pixel14
                                    iconData: MMaterial.Icons.light.add
                                    color: MMaterial.Theme.text.disabled
                                }

                                MouseArea {
                                    id: rectFooterMA

                                    anchors.fill: barRectFooter
                                    hoverEnabled: true

                                    onClicked: element.insertEmpty(barRectList.count)
                                }
                            }
                        }
                    }
                }

                onClicked: input.forceActiveFocus()
            }

            footer: ListELement {
                MMaterial.Icon {
                    anchors.centerIn: parent
                    size: MMaterial.Size.pixel24
                    iconData: MMaterial.Icons.light.add
                    color: MMaterial.Theme.text.disabled

                }

                onClicked: barChart.chartModel.insertEmpty(barChart.chartModel.count)
            }
        }

        Item { Layout.fillHeight: true }
    }

    ColumnLayout {
        id: chartContainer

        height: d.isWide ? root.height : root.height / 2 - MMaterial.Size.pixel30
        width: d.isWide ? root.width / 2 - MMaterial.Size.pixel30 : root.width

        anchors {
            left: root.left
            bottom: root.bottom
        }

        MMaterial.BarChart {
            id: barChart

            Layout.alignment: Qt.AlignCenter

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.maximumHeight: 500 * MMaterial.Size.scale
            Layout.maximumWidth: 700 * MMaterial.Size.scale
            Layout.minimumHeight: 200 * MMaterial.Size.scale
            Layout.minimumWidth: 300 * MMaterial.Size.scale

            model: [
                MMaterial.ChartElement {
                    name: qsTr("Serbia")
                    bars: [
                        MMaterial.ChartElementBar { value: 1197714; name: qsTr("Belgrade"); color: "#A12D2E" },
                        MMaterial.ChartElementBar { value: 280763; name: qsTr("Novi Sad"); color: "#0C4077" },
                        MMaterial.ChartElementBar { value: 182797; name: qsTr("Niš"); color: "#FFFFFF" }
                    ]
                },
                MMaterial.ChartElement {
                    name: qsTr("Poland")
                    bars: [
                        MMaterial.ChartElementBar { value: 673743; name: qsTr("Wrocław"); color: "#FFFFFF" },
                        MMaterial.ChartElementBar { value: 652015; name: qsTr("Łódź"); color: "#DC143C" }
                    ]
                },
                MMaterial.ChartElement {
                    name: qsTr("Hungary")
                    bars: [
                        MMaterial.ChartElementBar { value: 880371; name: qsTr("Budapest"); color: "#CE2939" },
                        MMaterial.ChartElementBar { value: 76000; name: qsTr("Paradsasvar"); color: "#FFFFFF" },
                        MMaterial.ChartElementBar { value: 75474; name: qsTr("Szolnok"); color: "#477050" }
                    ]
                }
            ]
        }
    }
}
