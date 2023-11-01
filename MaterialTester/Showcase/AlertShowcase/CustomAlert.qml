import QtQuick 

import MMaterial

Alert {
    width: standardContainer.container.width;

    severity: Alert.Severity.Error;
    variant: Alert.Variant.Standard;

    text: alertTextInput.text;

    actionButton.text: qsTr("Action")
    dismissButton.text: qsTr("Dismiss")
}
