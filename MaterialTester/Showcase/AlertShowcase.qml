import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material

import MMaterial.UI as UI
import MMaterial.Controls as Controls
import MMaterial.Controls.Inputs as Inputs

Item {
    id: root

    objectName: "Alerts"

    Flickable {
        anchors.fill: parent

        contentHeight: mainLayout.implicitHeight
        contentWidth: parent.width < 300 ? 300 : parent.width

		ScrollIndicator.horizontal: Controls.MScrollIndicator{}

        Item {
            anchors.fill: parent

            ColumnLayout {
                id: mainLayout

                property real alertWidth: parent.width * 0.6

                anchors.fill: parent

                spacing: UI.Size.pixel40
                width: alertWidth

                AlertContainer {
                    id: standardContainer

                    itemModel: standardModel
                    title: "standard"
                }

                AlertContainer {
                    id: outlinedContainer

                    itemModel: outlinedModel
                    title: "outlined"
                }

                AlertContainer {
                    id: filledContainer

                    itemModel: filledModel
                    title: "filled"
                }

                ObjectModel {
                    id: standardModel

					CustomAlert{ severity: Controls.Alert.Severity.Info; variant: Controls.Alert.Variant.Standard; width: standardContainer.container.width; text: alertTextInput.text; }
					CustomAlert{ severity: Controls.Alert.Severity.Success; variant: Controls.Alert.Variant.Standard; width: standardContainer.container.width; text: alertTextInput.text; }
					CustomAlert{ severity: Controls.Alert.Severity.Warning; variant: Controls.Alert.Variant.Standard; width: standardContainer.container.width; text: alertTextInput.text; }
					CustomAlert{ severity: Controls.Alert.Severity.Error; variant: Controls.Alert.Variant.Standard; width: standardContainer.container.width; text: alertTextInput.text; }
                }

                ObjectModel {
                    id: outlinedModel

					CustomAlert{ severity: Controls.Alert.Severity.Info; variant: Controls.Alert.Variant.Outlined; Layout.topMargin: UI.Size.pixel22; width: standardContainer.container.width; text: alertTextInput.text; }
					CustomAlert{ severity: Controls.Alert.Severity.Success; variant: Controls.Alert.Variant.Outlined; width: standardContainer.container.width; text: alertTextInput.text; }
					CustomAlert{ severity: Controls.Alert.Severity.Warning; variant: Controls.Alert.Variant.Outlined; width: standardContainer.container.width; text: alertTextInput.text; }
					CustomAlert{ severity: Controls.Alert.Severity.Error; variant: Controls.Alert.Variant.Outlined; width: standardContainer.container.width; text: alertTextInput.text; }
                }

                ObjectModel {
                    id: filledModel

					CustomAlert{ severity: Controls.Alert.Severity.Info; variant: Controls.Alert.Variant.Filled; Layout.topMargin: UI.Size.pixel22; width: standardContainer.container.width; text: alertTextInput.text;}
					CustomAlert{ severity: Controls.Alert.Severity.Success; variant: Controls.Alert.Variant.Filled; width: standardContainer.container.width; text: alertTextInput.text; }
					CustomAlert{ severity: Controls.Alert.Severity.Warning; variant: Controls.Alert.Variant.Filled; width: standardContainer.container.width; text: alertTextInput.text; }
					CustomAlert{ severity: Controls.Alert.Severity.Error; variant: Controls.Alert.Variant.Filled; width: standardContainer.container.width; text: alertTextInput.text; }
                }

				UI.H3 {
                    Layout.topMargin: UI.Size.pixel24

                    text: qsTr("Create your own alert")
					color: UI.Theme.text.primary
                }

				Controls.CheckedGroup{
                    id: severityGroup

                    checkables: [infoButton, successButton, warningButton, errorButton]
                }
				Controls.CheckedGroup{
                    id: variantGroup

                    checkables: [filledButton, standardButton, outlinedButton]
                }
				Controls.CheckedGroup{
                    id: buttonGroup

                    checkables: [yesButton, noButton]
                }

                RowLayout {
					Layout.topMargin: -UI.Size.pixel40
                    Layout.fillWidth: true
                    Layout.preferredHeight: implicitHeight


                    ColumnLayout {
                        Layout.fillWidth: true
                        Layout.minimumWidth: root.width / 2

                        UI.H6 {
                            Layout.topMargin: UI.Size.pixel20
                            Layout.alignment: Qt.AlignTop
                            Layout.fillWidth: true
                            Layout.preferredHeight: UI.Size.pixel40

                            text: "Severity"
							color: UI.Theme.text.disabled

                            font {
                                pixelSize: UI.Size.pixel12
                                capitalization: Font.AllUppercase
                            }
                        }

						Controls.MRadioButton { id: infoButton; text: qsTr("Info"); checked: true; property int severity: Controls.Alert.Severity.Info; }
						Controls.MRadioButton { id: successButton; text: qsTr("Success"); property int severity: Controls.Alert.Severity.Success }
						Controls.MRadioButton { id: warningButton; text: qsTr("Warning"); property int severity: Controls.Alert.Severity.Warning }
						Controls.MRadioButton { id: errorButton; text: qsTr("Error"); property int severity: Controls.Alert.Severity.Error }

                        Item { Layout.fillHeight: true }
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        Layout.minimumWidth: root.width / 2

                        UI.H6 {
                            Layout.alignment: Qt.AlignTop
                            Layout.fillWidth: true
                            Layout.topMargin: UI.Size.pixel20
                            Layout.preferredHeight: UI.Size.pixel40

                            text: "Variant"
							color: UI.Theme.text.disabled

                            font {
                                pixelSize: UI.Size.pixel12
                                capitalization: Font.AllUppercase
                            }
                        }

						Controls.MRadioButton { id: filledButton; text: qsTr("Filled"); checked: true; property int variant: Controls.Alert.Variant.Filled}
						Controls.MRadioButton { id: standardButton; text: qsTr("Standard"); property int variant: Controls.Alert.Variant.Standard}
						Controls.MRadioButton { id: outlinedButton; text: qsTr("Outlined"); property int variant: Controls.Alert.Variant.Outlined }

                        Item { Layout.fillHeight: true }
                    }
                }

                RowLayout {
                    Layout.fillWidth: true
                    Layout.preferredHeight: implicitHeight

                    ColumnLayout {
                        Layout.fillWidth: true
                        Layout.minimumWidth: root.width / 2

                        UI.H6 {
                            Layout.alignment: Qt.AlignTop
                            Layout.fillWidth: true
                            Layout.topMargin: UI.Size.pixel20
                            Layout.preferredHeight: UI.Size.pixel40

                            text: "Buttons"
							color: UI.Theme.text.disabled

                            font {
                                pixelSize: UI.Size.pixel12
                                capitalization: Font.AllUppercase
                            }
                        }

						Controls.MRadioButton { id: yesButton; text: qsTr("Yes"); checked: true; }
						Controls.MRadioButton { id: noButton; text: qsTr("No"); }

                        Item { Layout.fillHeight: true }
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        Layout.minimumWidth: root.width / 2

                        UI.H6 {
                            Layout.topMargin: UI.Size.pixel20
                            Layout.alignment: Qt.AlignTop
                            Layout.fillWidth: true
                            Layout.preferredHeight: UI.Size.pixel40

                            text: "Edge Of"
							color: UI.Theme.text.disabled

                            font {
                                pixelSize: UI.Size.pixel12
                                capitalization: Font.AllUppercase
                            }
                        }

						Controls.MRadioButton { id: bottomLeftButton; text: qsTr("Bottom Left"); checked: alerts.edgeOf == Item.BottomLeft; customCheckImplementation: true; onClicked: { alerts.edgeOf = Item.BottomLeft } }
						Controls.MRadioButton { id: bottomRightButton; text: qsTr("Bottom Right"); checked: alerts.edgeOf == Item.BottomRight; customCheckImplementation: true; onClicked: { alerts.edgeOf = Item.BottomRight } }
						Controls.MRadioButton { id: topLeftButton; text: qsTr("Top Left"); checked: alerts.edgeOf == Item.TopLeft; customCheckImplementation: true; onClicked: { alerts.edgeOf = Item.TopLeft } }
						Controls.MRadioButton { id: topRightButton; text: qsTr("Top Right"); checked: alerts.edgeOf == Item.TopRight; customCheckImplementation: true; onClicked: { alerts.edgeOf = Item.TopRight } }

                        Item { Layout.fillHeight: true }
                    }
                }

				Inputs.TextField {
                    id: alertTextInput

                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignRight

					placeholderText: qsTr("Message")
                    text: "Message for alerts..."
					type: Inputs.TextField.Type.Outlined
                }

				Controls.MButton {
                    id: _createAlertButton

                    Layout.alignment:  Qt.AlignLeft

					accent: UI.Theme.info
                    text: qsTr("Create alert")

                    onClicked: {
                        let actionButton = {
                            text : "Action",
                            onClicked : function() {
                                console.log("Action clicked")
                            }
                        }

                        let dismissButton = {
                            text : "Close",
                        }

                        let details = {
                            severity : severityGroup.checkedButton.severity,
                            variant : variantGroup.checkedButton.variant,
                            actionButton : yesButton.checked ? actionButton : null,
                            dismissButton : yesButton.checked ? dismissButton : null
                        }

						Controls.AlertController.alert(alertTextInput.text, details, 3500, alerts.objectName)
                    }
                }

                Item { Layout.fillHeight: true; }
            }
        }
    }

	Controls.AlertGenerator {
        id: alerts

		objectName: "AlertShowcaseGenerator"
        width: parent.width > 400 ? 400 * UI.Size.scale : parent.width * 0.9
    }
}
