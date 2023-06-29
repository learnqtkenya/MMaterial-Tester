import QtQuick 2.15

import MMaterial

Alert{
    severity: Alert.Severity.Error;
    variant: Alert.Variant.Standard;
    width: standardContainer.container.width;
    text: alertTextInput.text;
    actionButton.text: qsTr("Action")
    dismissButton.text: qsTr("Dismiss")
}
