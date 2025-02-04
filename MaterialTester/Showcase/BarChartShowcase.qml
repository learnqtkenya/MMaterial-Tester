pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import QtQuick.Dialogs

import MMaterial.UI as UI
import MMaterial.Charts as Charts
import MMaterial.Controls as Controls
import MMaterial.Controls.Inputs as Inputs
import MMaterial.Media as Media

Item {
    id: root

    component ListELement: Rectangle {
        id: elementRoot

        readonly property bool hovered: elementMA.containsMouse
        signal clicked

        implicitHeight: UI.Size.pixel40
        implicitWidth: chartEditorList.width

        color: elementMA.containsMouse ? UI.Theme.background.neutral : "transparent"
        radius: UI.Size.pixel8
        opacity: elementMA.pressed ? 0.8 : 1

        border {
            width: 1
            color: UI.Theme.text.disabled
        }

        MouseArea {
            id: elementMA

            anchors.fill: elementRoot
            hoverEnabled: true
            onClicked: elementRoot.clicked()
        }
    }

    ColorDialog {
        id: colorDialog

        property Item elementItem: null

        selectedColor: "black"
        onAccepted: {
            if (colorDialog.elementItem)
                elementItem.setBarColor(colorDialog.selectedColor);
        }
    }

    QtObject {
        id: d

        readonly property bool isWide: false
    }

    ColumnLayout {
        id: controlLayout

        readonly property real layoutLeftMargin: d.isWide ? 0 : Math.max(0, controlLayout.width / 2 - chartEditorList.width / 2)

        height: d.isWide ? root.height : root.height / 2 - UI.Size.pixel30
        width: d.isWide ? root.width / 2 - UI.Size.pixel30 : root.width
        spacing: UI.Size.pixel20

        anchors {
            right: root.right
            top: root.top
        }

		Controls.MSwitch {
            Layout.alignment: Qt.AlignVCenter
            Layout.leftMargin: controlLayout.layoutLeftMargin
            text: qsTr("Orientation")
            checked: barChart.orientation == ListView.Horizontal
            onCheckedChanged: barChart.orientation = checked ? ListView.Horizontal : ListView.Vertical
        }

		Controls.MSwitch {
            Layout.alignment: Qt.AlignVCenter
            Layout.leftMargin: controlLayout.layoutLeftMargin
            text: qsTr("Auto Resize")
            checked: barChart.autoResize
            onCheckedChanged: barChart.autoResize = checked
        }

        ListELement {
            id: footerElement

            Layout.alignment: Qt.AlignHCenter
            Layout.preferredHeight: UI.Size.pixel36
            Layout.preferredWidth: chartEditorList.width
            enabled: chartEditorList.count < 7
            opacity: enabled ? 1 : 0.5

            Media.Icon {
                anchors.centerIn: parent
                size: UI.Size.pixel24
                iconData: Media.Icons.light.add
				color: UI.Theme.text.disabled.toString()

            }

            onClicked: {
                barChart.chartModel.insertEmpty(barChart.chartModel.count)
            }
        }

        ListView {
            id: chartEditorList

            Layout.alignment: Qt.AlignVCenter
            Layout.fillHeight: true
            Layout.maximumHeight: d.isWide ? controlLayout.height : barChart.height - UI.Size.pixel40
            Layout.minimumHeight: UI.Size.pixel40
            Layout.preferredWidth: barChart.width
            Layout.maximumWidth: d.isWide ? controlLayout.width : barChart.width
            Layout.leftMargin: controlLayout.layoutLeftMargin

            footerPositioning: ListView.InlineFooter
            model: barChart.chartModel
            spacing: UI.Size.pixel10
            clip: true

            onContentHeightChanged: chartEditorList.positionViewAtEnd()

            add: Transition {
                ParallelAnimation {
                    NumberAnimation { properties: "opacity"; from: 0; to: 1; duration: 150 }
                    NumberAnimation { properties: "height"; from: 0; to: UI.Size.pixel40 * 2; duration: 250; easing.type: Easing.OutQuad }
                }
            }

            remove: Transition {
                ParallelAnimation {
                    NumberAnimation { properties: "opacity"; to: 0; duration: 150 }
                    NumberAnimation { properties: "height"; to: 0; duration: 250; easing.type: Easing.OutQuad }
                }
            }

            displaced: Transition {
                NumberAnimation { properties: "x, y, height, width"; duration: 250 }
            }

            delegate: ListELement {
                id: chartDelRoot

				required property int index
				required property string name
				required property var model
				required property Charts.ChartElement element

                height: UI.Size.pixel40 * 2

                RowLayout {
                    anchors {
                        fill: chartDelRoot
                        topMargin: UI.Size.pixel10
                        bottomMargin: UI.Size.pixel10
                        leftMargin: UI.Size.pixel10
                        rightMargin: UI.Size.pixel10
                    }

					Inputs.TextField {
                        id: input

                        Layout.alignment: Qt.AlignTop
                        Layout.preferredWidth: chartDelRoot.width * 0.2
                        Layout.maximumWidth: chartDelRoot.width * 0.25
                        Layout.leftMargin: UI.Size.pixel10

						placeholderText: qsTr("Name")
						text: chartDelRoot.name

						verticalAlignment: Qt.AlignVCenter
						font.pixelSize: UI.Size.pixel16

						onTextEdited: chartDelRoot.model.name = text
						onAccepted: {
							if (barRectList.count === 0) {
								chartDelRoot.element.insertEmpty(barRectList.count)
							}
						}

						Component.onCompleted: input.forceActiveFocus()
                    }

                    ListView {
                        id: barRectList

                        Layout.fillHeight: true
                        Layout.alignment: Qt.AlignTop | Qt.AlignRight
                        Layout.fillWidth: true
                        Layout.minimumWidth: height * 2 + spacing
                        Layout.maximumWidth: parent.width - input.width + spacing
                        Layout.leftMargin: UI.Size.pixel20

                        spacing: UI.Size.pixel10
                        orientation: ListView.Horizontal
                        interactive: width < contentWidth
						model: chartDelRoot.element
                        clip: true

                        onContentWidthChanged: barRectList.positionViewAtEnd()
                        onCountChanged: {
                            let barElement = barRectList.itemAtIndex(barRectList.count - 1);
                            if (barElement)
								barElement.barNameInput.forceActiveFocus();
                        }

                        add: Transition {
                            ParallelAnimation {
                                NumberAnimation { properties: "opacity"; from: 0; to: 1; duration: 150 }
                                NumberAnimation { properties: "width"; from: 0; to: UI.Size.pixel64 * 2; duration: 250; easing.type: Easing.OutQuad }
                            }
                        }

                        remove: Transition {
                            ParallelAnimation {
                                NumberAnimation { properties: "opacity"; to: 0; duration: 150 }
                                NumberAnimation { properties: "width"; to: 0; duration: 250; easing.type: Easing.OutQuad }
                            }
                        }

                        displaced: Transition {
                            NumberAnimation { properties: "x, y"; duration: 250 }
                        }

                        addDisplaced: Transition {
                            NumberAnimation { properties: "x,y"; duration: 250 }
                        }

                        delegate: Item {
                            id: rectDelegateRoot

							required property int index
							required property double barValue
							required property color barColor
							required property string barName
							required property var model

                            property alias barNameInput: barNameInput

                            function setBarColor(color) {
								rectDelegateRoot.model.barColor = color
                            }

                            height: barRectList.height
                            width: UI.Size.pixel64 * 2

                            ColumnLayout {
                                spacing: UI.Size.pixel6
                                anchors.fill: rectDelegateRoot

                                RowLayout {
                                    Layout.minimumWidth: rectDelegateRoot.width
                                    Layout.preferredWidth: rectDelegateRoot.width
                                    Layout.minimumHeight: UI.Size.pixel20

                                    Rectangle {
                                        id: barRect

                                        Layout.fillHeight: true
										Layout.minimumHeight: rectDelegateRoot.height / 2  - barRectList.spacing / 2
                                        Layout.preferredWidth: height
										color: rectDelegateRoot.barColor
                                        radius: chartDelRoot.radius * 0.6

                                        border {
                                            width: rectMA.containsMouse ? 2 : 1
                                            color: UI.Theme.text.primary
                                        }

                                        MouseArea {
                                            id: rectMA

                                            anchors.fill: barRect
                                            hoverEnabled: true

                                            onClicked: {
												colorDialog.selectedColor = rectDelegateRoot.barColor;
                                                colorDialog.elementItem = rectDelegateRoot;
                                                colorDialog.open();
                                            }
                                        }
                                    }

									Inputs.TextField {
                                        id: barNameInput

                                        Layout.alignment: Qt.AlignHCenter
                                        Layout.fillHeight: true
                                        Layout.minimumHeight: UI.Size.pixel20
                                        Layout.minimumWidth: barRect.width
                                        Layout.fillWidth: true
                                        Layout.maximumWidth: rectDelegateRoot.width

										font.pixelSize: UI.Size.pixel12
										type: Inputs.TextField.Type.Outlined
										text: rectDelegateRoot.barName
                                        horizontalMargins: UI.Size.pixel8
										placeholderText: barNameInput.text != "" || barNameInput.activeFocus ? "" : qsTr("Bar name")

										KeyNavigation.tab: barValueInput
										onEditingFinished: rectDelegateRoot.model.barName = barNameInput.text
										onActiveFocusChanged: if (barNameInput.focus) barRectList.positionViewAtIndex(rectDelegateRoot.index, ListView.Beginning);

                                    }
                                }

                                RowLayout {
                                    Layout.minimumWidth: rectDelegateRoot.width
                                    Layout.preferredWidth: rectDelegateRoot.width
                                    Layout.minimumHeight: UI.Size.pixel20


									Controls.MToggleButton {
                                        Layout.fillHeight: true
                                        Layout.preferredWidth: height

                                        opacity: enabled ? 1 : 0.5
                                        customCheckImplementation: true
                                        checked: true
                                        size: UI.Size.Grade.S
                                        accent: UI.Theme.warning

                                        icon.iconData: Media.Icons.light.remove

										onClicked: chartDelRoot.element.remove(rectDelegateRoot.index)
                                    }

									Inputs.TextField {
                                        id: barValueInput

                                        Layout.alignment: Qt.AlignHCenter
                                        Layout.fillHeight: true
                                        Layout.minimumHeight: UI.Size.pixel20
                                        Layout.minimumWidth: barRect.width
                                        Layout.fillWidth: true
                                        Layout.maximumWidth: rectDelegateRoot.width

										font.pixelSize: UI.Size.pixel12
										type: Inputs.TextField.Type.Outlined
										text: Number(rectDelegateRoot.barValue).toLocaleString(Qt.locale(), 'f', 0)
                                        horizontalMargins: UI.Size.pixel8
										placeholderText: barValueInput.text != "" || barValueInput.activeFocus ? "" : qsTr("Value")

										KeyNavigation.tab: barNameInput
										inputMethodHints: Qt.ImhFormattedNumbersOnly

										validator: RegularExpressionValidator {
											regularExpression: /^[0-9]+$/
										}

										onEditingFinished: rectDelegateRoot.model.barValue = barValueInput.text
										onActiveFocusChanged: if (barValueInput.focus) barRectList.positionViewAtIndex(rectDelegateRoot.index, ListView.Beginning);
                                    }
                                }
                            }
                        }
                    }

                    ColumnLayout {
                        Layout.preferredWidth: UI.Size.pixel18

						Controls.MToggleButton {
                            id: barRectFooter

                            Layout.fillHeight: true
                            Layout.preferredWidth: height

                            enabled: barRectList.count < 5
                            opacity: enabled ? 1 : 0.5
                            customCheckImplementation: true
                            checked: true
                            size: UI.Size.Grade.S

                            icon.iconData: Media.Icons.light.add

							onClicked: chartDelRoot.element.insertEmpty(barRectList.count)
                        }

						Controls.MToggleButton {
                            Layout.fillHeight: true
                            Layout.preferredWidth: height

                            opacity: enabled ? 1 : 0.5
                            customCheckImplementation: true
                            checked: true
                            size: UI.Size.Grade.S
                            accent: UI.Theme.error

                            icon.iconData: Media.Icons.light.remove

							onClicked: barChart.chartModel.remove(chartDelRoot.index)
                        }
                    }
                }

                onClicked: input.forceActiveFocus()
            }
        }
    }

    ColumnLayout {
        id: chartContainer

        height: d.isWide ? root.height : root.height / 2 - UI.Size.pixel30
        width: d.isWide ? root.width / 2 - UI.Size.pixel30 : root.width

        anchors {
            left: root.left
            bottom: root.bottom
        }

        Charts.BarChart {
            id: barChart

            graphContainer.width: barChart.width - UI.Size.pixel30 * 2
            Layout.alignment: Qt.AlignCenter

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.maximumHeight: 500 * UI.Size.scale
            Layout.maximumWidth: 700 * UI.Size.scale
            Layout.minimumHeight: 200 * UI.Size.scale
            Layout.minimumWidth: 300 * UI.Size.scale

            model: [
                Charts.ChartElement {
                    name: qsTr("Serbia")
                    bars: [
                        Charts.ChartElementBar { value: 1197714; name: qsTr("Belgrade"); color: "#A12D2E" },
                        Charts.ChartElementBar { value: 280763; name: qsTr("Novi Sad"); color: "#0C4077" },
                        Charts.ChartElementBar { value: 182797; name: qsTr("Niš"); color: "#FFFFFF" }
                    ]
                },
                Charts.ChartElement {
                    name: qsTr("Poland")
                    bars: [
                        Charts.ChartElementBar { value: 673743; name: qsTr("Wrocław"); color: "#FFFFFF" },
                        Charts.ChartElementBar { value: 652015; name: qsTr("Łódź"); color: "#DC143C" }
                    ]
                },
                Charts.ChartElement {
                    name: qsTr("Hungary")
                    bars: [
                        Charts.ChartElementBar { value: 880371; name: qsTr("Budapest"); color: "#CE2939" },
                        Charts.ChartElementBar { value: 76000; name: qsTr("Paradsasvar"); color: "#FFFFFF" },
                        Charts.ChartElementBar { value: 75474; name: qsTr("Szolnok"); color: "#477050" }
                    ]
                }
            ]
        }
    }
}
