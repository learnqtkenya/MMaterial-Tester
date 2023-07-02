import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
import MMaterial
Item {
    objectName: "Alerts"
    visible: showcaseLoader.status == Loader.Ready

    Item{
        anchors{
            fill: parent
        }

        ColumnLayout{
            id: mainLayout
            anchors{
                left: parent.left
                bottom: parent.bottom
                top: parent.top
            }
            width: alertWidth
            property real alertWidth: parent.width * 0.6
            AlertContainer{
                id: standardContainer
                itemModel: standardModel
                title: "standard"
            }
            AlertContainer{
                id: outlinedContainer
                itemModel: outlinedModel
                title: "outlined"
            }
            AlertContainer{
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
            ObjectModel{
                id: outlinedModel
                CustomAlert{ severity: Alert.Severity.Info; variant: Alert.Variant.Outlined; Layout.topMargin: Size.pixel22; }
                CustomAlert{ severity: Alert.Severity.Success; variant: Alert.Variant.Outlined; }
                CustomAlert{ severity: Alert.Severity.Warning; variant: Alert.Variant.Outlined; }
                CustomAlert{ severity: Alert.Severity.Error; variant: Alert.Variant.Outlined; }
            }

            ObjectModel{
                id: filledModel
                CustomAlert{ severity: Alert.Severity.Info; variant: Alert.Variant.Filled; Layout.topMargin: Size.pixel22;}
                CustomAlert{ severity: Alert.Severity.Success; variant: Alert.Variant.Filled; }
                CustomAlert{ severity: Alert.Severity.Warning; variant: Alert.Variant.Filled; }
                CustomAlert{ severity: Alert.Severity.Error; variant: Alert.Variant.Filled; }
            }
        }

        ColumnLayout{
            id: options
            anchors{
                left: mainLayout.right
                leftMargin: Size.pixel20
                right: parent.right
                bottom: parent.bottom
                top: parent.top
            }
            TextField{
                id: alertTextInput
                Layout.preferredWidth: parent.width
                Layout.preferredHeight: Size.pixel32
                placeholderText: qsTr("Insert alert text here")
                text: "Message for alerts..."
                Layout.alignment: Qt.AlignRight
            }

            MButton{
                Layout.preferredHeight: recommendedHeight
                Layout.preferredWidth: recommendedWidth
                text: "Create alert"
                onClicked: {
                    let actionButton = {
                        text : "Action",
                        onClicked : function() {
                            console.log("Action clicked")
                        }
                    }
                    let dismissButton = {
                        text : "Close",
//                        onClicked : function() {
//                            console.log("Close clicked")
//                        }
                    }
                    let details = {
                        severity : severityGroup.checkedButton.severity,
                        variant : variantGroup.checkedButton.variant,
                        actionButton : yesButton.checked ? actionButton : null,
                        dismissButton : yesButton.checked ? dismissButton : null
                    }
                    alerts.activate(alertTextInput.text, details)

                }
                Layout.alignment:  Qt.AlignRight
                accent: Theme.info
            }
            ButtonGroup{
                id: severityGroup
                buttons: [infoButton, successButton, warningButton, errorButton]
            }
            ButtonGroup{
                id: variantGroup
                buttons: [filledButton, standardButton, outlinedButton]
            }
            ButtonGroup{
                id: buttonGroup
                buttons: [yesButton, noButton]
            }

            H6{
                Layout.alignment: Qt.AlignTop
                Layout.preferredWidth: Size.scale * 120
                text: "Severity"
                width: parent.width
                height: Size.pixel40
                color: Theme.text.disabled
                font {
                    pixelSize: Size.pixel12
                    capitalization: Font.AllUppercase
                }
            }
            RadioButton{ id: infoButton; text: qsTr("Info"); checked: true; property int severity: Alert.Severity.Info; }
            RadioButton{ id: successButton; text: qsTr("Success"); property int severity: Alert.Severity.Success }
            RadioButton{ id: warningButton; text: qsTr("Warning"); property int severity: Alert.Severity.Warning }
            RadioButton{ id: errorButton; text: qsTr("Error"); property int severity: Alert.Severity.Error }

            H6{
                Layout.alignment: Qt.AlignTop
                Layout.preferredWidth: Size.scale * 120
                Layout.topMargin: Size.pixel20
                text: "Variant"
                width: parent.width
                height: Size.pixel40
                color: Theme.text.disabled
                font {
                    pixelSize: Size.pixel12
                    capitalization: Font.AllUppercase
                }
            }
            RadioButton{ id: filledButton; text: qsTr("Filled"); checked: true; property int variant: Alert.Variant.Filled}
            RadioButton{ id: standardButton; text: qsTr("Standard"); property int variant: Alert.Variant.Standard}
            RadioButton{ id: outlinedButton; text: qsTr("Outlined"); property int variant: Alert.Variant.Outlined }

            H6{
                Layout.alignment: Qt.AlignTop
                Layout.preferredWidth: Size.scale * 120
                Layout.topMargin: Size.pixel20
                text: "Buttons"
                width: parent.width
                height: Size.pixel40
                color: Theme.text.disabled
                font {
                    pixelSize: Size.pixel12
                    capitalization: Font.AllUppercase
                }
            }
            RadioButton{ id: yesButton; text: qsTr("Yes"); checked: true; }
            RadioButton{ id: noButton; text: qsTr("No"); }

            Item{ Layout.fillHeight: true; }
        }
    }

    AlertController{
        id: alerts
    }
}
