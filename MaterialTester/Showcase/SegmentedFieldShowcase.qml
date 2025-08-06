pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import MMaterial.UI as UI
import MMaterial.Controls as Controls
import MMaterial.Controls.Inputs as Inputs

Item {
    objectName: "SegmentedField"

    ListView {
        id: listView

        anchors.fill: parent

        spacing: 80 * UI.Size.scale
        clip: true

        model: [
            { "category": "basic", "name": "Basic Examples" },
            { "category": "interactive", "name": "Interactive Demo" }
        ]

        delegate: Item {
            id: del

            required property int index

            width: listView.width
            height: del.index === 0 ? segmentedFieldGroup.height : interactiveDemo.height

            SegmentedFieldGroup {
                id: segmentedFieldGroup
                visible: del.index === 0
                width: parent.width
                title: listView.model[del.index].name
            }

            // Interactive Demo Section
            ColumnLayout {
                id: interactiveDemo
                visible: del.index === 1
                width: parent.width
                spacing: UI.Size.pixel32

                UI.Subtitle1 {
                    text: listView.model[del.index].name
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: UI.Size.pixel16

                    UI.Subtitle2 {
                        text: qsTr("Live Examples")
                    }

                    RowLayout {
                        spacing: UI.Size.pixel16

                        Column {
                            spacing: UI.Size.pixel8

                            UI.Caption {
                                text: qsTr("6-digit Code")
                            }

                            Inputs.SegmentedField {
                                id: codeField
                                length: 6
                                accent: UI.Theme.primary

                                onEditingFinished: {
                                    console.log("Code entered:", text)
                                }

                                onInputTextChanged: (text) => {
                                    console.log("Current input:", text)
                                }
                            }

                            Controls.MButton {
                                text: qsTr("Clear")
                                onClicked: codeField.clear()
                            }
                        }

                        Column {
                            spacing: UI.Size.pixel8

                            UI.Caption {
                                text: qsTr("PIN (4 digits)")
                            }

                            Inputs.SegmentedField {
                                id: pinField
                                length: 4
                                accent: UI.Theme.success
                                validator: RegularExpressionValidator {
                                    regularExpression: /^[0-9]$/
                                }

                                onEditingFinished: {
                                    if (text.length === length) {
                                        console.log("PIN complete:", text)
                                    }
                                }
                            }

                            Controls.MButton {
                                text: qsTr("Clear PIN")
                                onClicked: pinField.clear()
                            }
                        }
                    }

                    // Status display
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: UI.Size.pixel64
                        color: UI.Theme.background.paper
                        border.color: UI.Theme.action.disabledBackground
                        border.width: 1
                        radius: UI.Size.pixel8

                        RowLayout {
                            anchors.fill: parent
                            anchors.margins: UI.Size.pixel12

                            UI.Caption {
                                text: qsTr("Code: '%1' (%2/%3)").arg(codeField.text).arg(codeField.text.length).arg(codeField.length)
                            }

                            Item { Layout.fillWidth: true }

                            UI.Caption {
                                text: qsTr("PIN: '%1' (%2/%3)").arg(pinField.text).arg(pinField.text.length).arg(pinField.length)
                            }
                        }
                    }
                }

                Item { Layout.fillHeight: true }
            }
        }
    }
}
