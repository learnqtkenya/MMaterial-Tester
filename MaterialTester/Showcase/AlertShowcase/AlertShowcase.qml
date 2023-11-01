import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import MMaterial
Item {
    objectName: "Alerts"
    visible: showcaseLoader.status == Loader.Ready

    Flickable {
        anchors.fill: parent

        contentHeight: mainLayout.implicitHeight
        contentWidth: parent.width < 600 ? 600 : parent.width

        ScrollIndicator.horizontal: MScrollIndicator{}

        Item {
            anchors.fill: parent

            ColumnLayout {
                id: mainLayout

                property real alertWidth: parent.width * 0.6

                anchors.fill: parent

                spacing: Size.pixel40
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

                    CustomAlert{ severity: Alert.Severity.Info; variant: Alert.Variant.Standard; }
                    CustomAlert{ severity: Alert.Severity.Success; variant: Alert.Variant.Standard; }
                    CustomAlert{ severity: Alert.Severity.Warning; variant: Alert.Variant.Standard; }
                    CustomAlert{ severity: Alert.Severity.Error; variant: Alert.Variant.Standard; }
                }

                ObjectModel {
                    id: outlinedModel

                    CustomAlert{ severity: Alert.Severity.Info; variant: Alert.Variant.Outlined; Layout.topMargin: Size.pixel22; }
                    CustomAlert{ severity: Alert.Severity.Success; variant: Alert.Variant.Outlined; }
                    CustomAlert{ severity: Alert.Severity.Warning; variant: Alert.Variant.Outlined; }
                    CustomAlert{ severity: Alert.Severity.Error; variant: Alert.Variant.Outlined; }
                }

                ObjectModel {
                    id: filledModel

                    CustomAlert{ severity: Alert.Severity.Info; variant: Alert.Variant.Filled; Layout.topMargin: Size.pixel22;}
                    CustomAlert{ severity: Alert.Severity.Success; variant: Alert.Variant.Filled; }
                    CustomAlert{ severity: Alert.Severity.Warning; variant: Alert.Variant.Filled; }
                    CustomAlert{ severity: Alert.Severity.Error; variant: Alert.Variant.Filled; }
                }

                H3 {
                    Layout.topMargin: Size.pixel24

                    text: qsTr("Create your own alert")
                    color: Theme.text.primary
                }

                RowLayout {
                    Layout.topMargin: -Size.pixel40
                    Layout.fillWidth: true
                    Layout.preferredHeight: implicitHeight

                    CheckedGroup{
                        id: severityGroup

                        checkables: [infoButton, successButton, warningButton, errorButton]
                    }
                    CheckedGroup{
                        id: variantGroup

                        checkables: [filledButton, standardButton, outlinedButton]
                    }
                    CheckedGroup{
                        id: buttonGroup

                        checkables: [yesButton, noButton]
                    }

                    ColumnLayout {
                        Layout.fillWidth: true

                        H6 {
                            Layout.topMargin: Size.pixel20
                            Layout.alignment: Qt.AlignTop
                            Layout.fillWidth: true

                            width: parent.width
                            height: Size.pixel40

                            text: "Severity"
                            color: Theme.text.disabled

                            font {
                                pixelSize: Size.pixel12
                                capitalization: Font.AllUppercase
                            }
                        }

                        MRadioButton { id: infoButton; text: qsTr("Info"); checked: true; property int severity: Alert.Severity.Info; }
                        MRadioButton { id: successButton; text: qsTr("Success"); property int severity: Alert.Severity.Success }
                        MRadioButton { id: warningButton; text: qsTr("Warning"); property int severity: Alert.Severity.Warning }
                        MRadioButton { id: errorButton; text: qsTr("Error"); property int severity: Alert.Severity.Error }

                        Item { Layout.fillHeight: true }
                    }

                    ColumnLayout {
                        Layout.fillWidth: true

                        H6 {
                            Layout.alignment: Qt.AlignTop
                            Layout.fillWidth: true
                            Layout.topMargin: Size.pixel20

                            width: parent.width
                            height: Size.pixel40

                            text: "Variant"
                            color: Theme.text.disabled

                            font {
                                pixelSize: Size.pixel12
                                capitalization: Font.AllUppercase
                            }
                        }

                        MRadioButton { id: filledButton; text: qsTr("Filled"); checked: true; property int variant: Alert.Variant.Filled}
                        MRadioButton { id: standardButton; text: qsTr("Standard"); property int variant: Alert.Variant.Standard}
                        MRadioButton { id: outlinedButton; text: qsTr("Outlined"); property int variant: Alert.Variant.Outlined }

                        Item { Layout.fillHeight: true }
                    }

                    ColumnLayout {
                        Layout.fillWidth: true

                        H6 {
                            Layout.alignment: Qt.AlignTop
                            Layout.fillWidth: true
                            Layout.topMargin: Size.pixel20

                            width: parent.width
                            height: Size.pixel40

                            text: "Buttons"
                            color: Theme.text.disabled

                            font {
                                pixelSize: Size.pixel12
                                capitalization: Font.AllUppercase
                            }
                        }

                        MRadioButton { id: yesButton; text: qsTr("Yes"); checked: true; }
                        MRadioButton { id: noButton; text: qsTr("No"); }

                        Item { Layout.fillHeight: true }
                    }

                    ColumnLayout {
                        Layout.fillWidth: true

                        H6 {
                            Layout.topMargin: Size.pixel20
                            Layout.alignment: Qt.AlignTop
                            Layout.fillWidth: true

                            width: parent.width
                            height: Size.pixel40

                            text: "Edge Of"
                            color: Theme.text.disabled

                            font {
                                pixelSize: Size.pixel12
                                capitalization: Font.AllUppercase
                            }
                        }

                        MRadioButton { id: bottomLeftButton; text: qsTr("Bottom Left"); checked: alerts.edgeOf == Item.BottomLeft; customCheckImplementaiton: true; onClicked: { alerts.edgeOf = Item.BottomLeft } }
                        MRadioButton { id: bottomRightButton; text: qsTr("Bottom Right"); checked: alerts.edgeOf == Item.BottomRight; customCheckImplementaiton: true; onClicked: { alerts.edgeOf = Item.BottomRight } }
                        MRadioButton { id: topLeftButton; text: qsTr("Top Left"); checked: alerts.edgeOf == Item.TopLeft; customCheckImplementaiton: true; onClicked: { alerts.edgeOf = Item.TopLeft } }
                        MRadioButton { id: topRightButton; text: qsTr("Top Right"); checked: alerts.edgeOf == Item.TopRight; customCheckImplementaiton: true; onClicked: { alerts.edgeOf = Item.TopRight } }

                        Item { Layout.fillHeight: true }
                    }
                }

                MTextField {
                    id: alertTextInput

                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignRight

                    placeholder: qsTr("Message")
                    text: "Message for alerts..."
                    type: MTextField.Type.Outlined
                }

                MButton {
                    id: _createAlertButton

                    Layout.alignment:  Qt.AlignLeft

                    accent: Theme.info
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

                        alerts.activate(alertTextInput.text, details)
                    }
                }

                Item { Layout.fillHeight: true; }
            }
        }
    }

    AlertController {
        id: alerts

        width: parent.width > 400 ? 400 * Size.scale : parent.width * 0.9
    }
}
