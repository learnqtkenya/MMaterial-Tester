import QtQuick
import QtQuick.Controls.Material

import MMaterial

Item {
    objectName: "DateTime"

    DatePicker {
        id: datePicker

        closePolicy: Popup.NoAutoClose
        visible: true

        onDateAccepted: (startDate, endDate) => {}
    }

    MButton {
        y: datePicker.y + Size.pixel12
        x: datePicker.x + Size.pixel12
        text: qsTr("Open Date Picker")
        type: MButton.Type.Outlined

        onClicked: datePicker.open()
    }
}
