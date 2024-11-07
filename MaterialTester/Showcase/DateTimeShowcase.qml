import QtQuick
import QtQuick.Controls.Material

import MMaterial

Item {
    objectName: "DateTime"

    MButton {
        y: timePicker.y + Size.pixel12
        x: timePicker.x + Size.pixel12
        text: qsTr("Open Time Picker")
        type: MButton.Type.Outlined

        onClicked: timePicker.open()
    }

    TimePicker {
        id: timePicker

        visible: true
        closePolicy: Popup.NoAutoClose

        onTimeAccepted: (date) => {
                            timeLabel.text = timePicker.formatTime(date)
                        }
    }

    Overline {
        id: timeLabel

        visible: timePicker.opened
        text: qsTr("Press OK")
        color: Theme.text.secondary
        width: timePicker.width
        horizontalAlignment: Qt.AlignHCenter
        x: timePicker.x
        y: timePicker.y + timePicker.height + Size.pixel48
    }

    DatePicker {
        id: datePicker

        closePolicy: Popup.NoAutoClose
        visible: true
        x: timePicker.x
        y: timeLabel.y + timeLabel.height + Size.pixel24

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
