import QtQuick 

import MMaterial

Alert{
    severity: Alert.Severity.Error;
    variant: Alert.Variant.Standard;
    width: standardContainer.container.width;
    text: alertTextInput.text;
    actionButton.text: qsTr("Action")
    dismissButton.text: qsTr("Dismiss")
}
