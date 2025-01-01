import QtQuick
import QtQuick.Layouts
import QtQuick.Dialogs
import QtQuick.Controls.Material

import MMaterial as MMaterial
import MMaterial.Charts as Charts

Item {
    id: root

    component ListELement: Rectangle {
        id: elementRoot

        readonly property bool hovered: elementMA.containsMouse
        signal clicked

        implicitHeight: MMaterial.Size.pixel40
        implicitWidth: chartEditorList.width

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

        height: d.isWide ? root.height : root.height / 2 - MMaterial.Size.pixel30
        width: d.isWide ? root.width / 2 - MMaterial.Size.pixel30 : root.width
        spacing: MMaterial.Size.pixel20

        anchors {
            right: root.right
            top: root.top
        }

        MMaterial.MSwitch {
            Layout.alignment: Qt.AlignVCenter
            Layout.leftMargin: controlLayout.layoutLeftMargin
            text: qsTr("Orientation")
            checked: barChart.orientation == ListView.Horizontal
            onCheckedChanged: barChart.orientation = checked ? ListView.Horizontal : ListView.Vertical
        }

        MMaterial.MSwitch {
            Layout.alignment: Qt.AlignVCenter
            Layout.leftMargin: controlLayout.layoutLeftMargin
            text: qsTr("Auto Resize")
            checked: barChart.autoResize
            onCheckedChanged: barChart.autoResize = checked
        }

        ListELement {
            id: footerElement

            Layout.alignment: Qt.AlignHCenter
            Layout.preferredHeight: MMaterial.Size.pixel36
            Layout.preferredWidth: chartEditorList.width
            enabled: chartEditorList.count < 7
            opacity: enabled ? 1 : 0.5

            MMaterial.Icon {
                anchors.centerIn: parent
                size: MMaterial.Size.pixel24
                iconData: MMaterial.Icons.light.add
                color: MMaterial.Theme.text.disabled

            }

            onClicked: {
                barChart.chartModel.insertEmpty(barChart.chartModel.count)
            }
        }

        ListView {
            id: chartEditorList

            Layout.alignment: Qt.AlignVCenter
            Layout.fillHeight: true
            Layout.maximumHeight: d.isWide ? controlLayout.height : barChart.height - MMaterial.Size.pixel40
            Layout.minimumHeight: MMaterial.Size.pixel40
            Layout.preferredWidth: barChart.width
            Layout.maximumWidth: d.isWide ? controlLayout.width : barChart.width
            Layout.leftMargin: controlLayout.layoutLeftMargin

            footerPositioning: ListView.InlineFooter
            model: barChart.chartModel
            spacing: MMaterial.Size.pixel10
            clip: true

            onContentHeightChanged: chartEditorList.positionViewAtEnd()

            add: Transition {
                ParallelAnimation {
                    NumberAnimation { properties: "opacity"; from: 0; to: 1; duration: 150 }
                    NumberAnimation { properties: "height"; from: 0; to: MMaterial.Size.pixel40 * 2; duration: 250; easing.type: Easing.OutQuad }
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

                height: MMaterial.Size.pixel40 * 2

                RowLayout {
                    anchors {
                        fill: chartDelRoot
                        topMargin: MMaterial.Size.pixel10
                        bottomMargin: MMaterial.Size.pixel10
                        leftMargin: MMaterial.Size.pixel10
                        rightMargin: MMaterial.Size.pixel10
                    }

                    MMaterial.MTextField {
                        id: input

                        Layout.alignment: Qt.AlignTop
                        Layout.preferredWidth: chartDelRoot.width * 0.2
                        Layout.maximumWidth: chartDelRoot.width * 0.25
                        Layout.leftMargin: MMaterial.Size.pixel10

                        placeholder: qsTr("Name")
                        text: name

                        input {
                            verticalAlignment: Qt.AlignVCenter
                            font.pixelSize: MMaterial.Size.pixel16

                            onTextEdited: name = text
                            onAccepted: {
                                if (barRectList.count == 0) {
                                    element.insertEmpty(barRectList.count)
                                }
                            }
                        }

                        Component.onCompleted: input.input.forceActiveFocus()
                    }

                    ListView {
                        id: barRectList

                        Layout.fillHeight: true
                        Layout.alignment: Qt.AlignTop | Qt.AlignRight
                        Layout.fillWidth: true
                        Layout.minimumWidth: height * 2 + spacing
                        Layout.maximumWidth: parent.width - input.width + spacing
                        Layout.leftMargin: MMaterial.Size.pixel20

                        spacing: MMaterial.Size.pixel10
                        orientation: ListView.Horizontal
                        interactive: width < contentWidth
                        model: element
                        clip: true

                        onContentWidthChanged: barRectList.positionViewAtEnd()
                        onCountChanged: {
                            let barElement = barRectList.itemAtIndex(barRectList.count - 1);
                            if (barElement)
                                barElement.barNameInput.input.forceActiveFocus();
                        }

                        add: Transition {
                            ParallelAnimation {
                                NumberAnimation { properties: "opacity"; from: 0; to: 1; duration: 150 }
                                NumberAnimation { properties: "width"; from: 0; to: MMaterial.Size.pixel64 * 2; duration: 250; easing.type: Easing.OutQuad }
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

                            property alias barNameInput: barNameInput

                            function setBarColor(color) {
                                barColor = color
                            }

                            height: barRectList.height
                            width: MMaterial.Size.pixel64 * 2

                            ColumnLayout {
                                spacing: MMaterial.Size.pixel6
                                anchors.fill: rectDelegateRoot

                                RowLayout {
                                    Layout.minimumWidth: rectDelegateRoot.width
                                    Layout.preferredWidth: rectDelegateRoot.width
                                    Layout.minimumHeight: MMaterial.Size.pixel20

                                    Rectangle {
                                        id: barRect

                                        Layout.fillHeight: true
                                        Layout.minimumHeight: rectDelegateRoot.height / 2  - rectDelegateRoot.spacing / 2
                                        Layout.preferredWidth: height
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

                                            onClicked: {
                                                colorDialog.selectedColor = barColor;
                                                colorDialog.elementItem = rectDelegateRoot;
                                                colorDialog.open();
                                            }
                                        }
                                    }

                                    MMaterial.MTextField {
                                        id: barNameInput

                                        Layout.alignment: Qt.AlignHCenter
                                        Layout.fillHeight: true
                                        Layout.minimumHeight: MMaterial.Size.pixel20
                                        Layout.minimumWidth: barRect.width
                                        Layout.fillWidth: true
                                        Layout.maximumWidth: rectDelegateRoot.width

                                        input.font.pixelSize: MMaterial.Size.pixel12
                                        type: MMaterial.MTextField.Type.Outlined
                                        text: barName
                                        horizontalMargins: MMaterial.Size.pixel8
                                        placeholder: barNameInput.text != "" || barNameInput.input.activeFocus ? "" : qsTr("Bar name")

                                        input {
                                            KeyNavigation.tab: barValueInput.input
                                            onEditingFinished: barName = input.text
                                            onActiveFocusChanged: if (input.focus) barRectList.positionViewAtIndex(index, ListView.Beginning);
                                        }
                                    }
                                }

                                RowLayout {
                                    Layout.minimumWidth: rectDelegateRoot.width
                                    Layout.preferredWidth: rectDelegateRoot.width
                                    Layout.minimumHeight: MMaterial.Size.pixel20


                                    MMaterial.MToggleButton {
                                        Layout.fillHeight: true
                                        Layout.preferredWidth: height

                                        opacity: enabled ? 1 : 0.5
                                        customCheckImplementation: true
                                        checked: true
                                        size: MMaterial.Size.Grade.S
                                        accent: MMaterial.Theme.warning

                                        icon.iconData: MMaterial.Icons.light.remove

                                        onClicked: element.remove(index)
                                    }

                                    MMaterial.MTextField {
                                        id: barValueInput

                                        Layout.alignment: Qt.AlignHCenter
                                        Layout.fillHeight: true
                                        Layout.minimumHeight: MMaterial.Size.pixel20
                                        Layout.minimumWidth: barRect.width
                                        Layout.fillWidth: true
                                        Layout.maximumWidth: rectDelegateRoot.width

                                        input.font.pixelSize: MMaterial.Size.pixel12
                                        type: MMaterial.MTextField.Type.Outlined
                                        text: Number(barValue).toLocaleString(Qt.locale(), 'f', 0)
                                        horizontalMargins: MMaterial.Size.pixel8
                                        placeholder: barValueInput.text != "" || barValueInput.input.activeFocus ? "" : qsTr("Value")

                                        input {
                                            KeyNavigation.tab: barNameInput.input
                                            inputMethodHints: Qt.ImhFormattedNumbersOnly

                                            validator: RegularExpressionValidator {
                                                regularExpression: /^[0-9]+$/
                                            }

                                            onEditingFinished: barValue = input.text
                                            onActiveFocusChanged: if (input.focus) barRectList.positionViewAtIndex(index, ListView.Beginning);
                                        }
                                    }
                                }
                            }
                        }

                    }

                    ColumnLayout {
                        Layout.preferredWidth: MMaterial.Size.pixel18

                        MMaterial.MToggleButton {
                            id: barRectFooter

                            Layout.fillHeight: true
                            Layout.preferredWidth: height

                            enabled: barRectList.count < 5
                            opacity: enabled ? 1 : 0.5
                            customCheckImplementation: true
                            checked: true
                            size: MMaterial.Size.Grade.S

                            icon.iconData: MMaterial.Icons.light.add

                            onClicked: element.insertEmpty(barRectList.count)
                        }

                        MMaterial.MToggleButton {
                            Layout.fillHeight: true
                            Layout.preferredWidth: height

                            opacity: enabled ? 1 : 0.5
                            customCheckImplementation: true
                            checked: true
                            size: MMaterial.Size.Grade.S
                            accent: MMaterial.Theme.error

                            icon.iconData: MMaterial.Icons.light.remove

                            onClicked: barChart.chartModel.remove(index)
                        }
                    }
                }

                onClicked: input.forceActiveFocus()
            }
        }
    }

    ColumnLayout {
        id: chartContainer

        height: d.isWide ? root.height : root.height / 2 - MMaterial.Size.pixel30
        width: d.isWide ? root.width / 2 - MMaterial.Size.pixel30 : root.width

        anchors {
            left: root.left
            bottom: root.bottom
        }

        Charts.BarChart {
            id: barChart

            graphContainer.width: barChart.width - MMaterial.Size.pixel30 * 2
            Layout.alignment: Qt.AlignCenter

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.maximumHeight: 500 * MMaterial.Size.scale
            Layout.maximumWidth: 700 * MMaterial.Size.scale
            Layout.minimumHeight: 200 * MMaterial.Size.scale
            Layout.minimumWidth: 300 * MMaterial.Size.scale

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
