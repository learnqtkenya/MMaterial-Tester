import QtQuick
import QtQuick.Controls.Material

import MMaterial.Controls as Controls
import MMaterial.Controls.Inputs as Inputs
import MMaterial.UI as UI

Item {
    objectName: "DateTime"

	Inputs.DatePicker {
        id: datePicker

        closePolicy: Popup.NoAutoClose
        visible: true

        onDateAccepted: (startDate, endDate) => {}
    }

	Controls.MButton {
        y: datePicker.y + UI.Size.pixel12
        x: datePicker.x + UI.Size.pixel12
        text: qsTr("Open Date Picker")
		type: Controls.MButton.Type.Outlined

        onClicked: datePicker.open()
    }
}
