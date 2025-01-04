import QtQuick
import QtQuick.Controls.Material

import MMaterial.Controls as Controls
import MMaterial.Controls.Inputs as Inputs
import MMaterial.UI as UI

Item {
    objectName: "DateTime"

	Controls.MButton {
        y: timePicker.y + UI.Size.pixel12
        x: timePicker.x + UI.Size.pixel12
        text: qsTr("Open Time Picker")
		type: Controls.MButton.Type.Outlined

        onClicked: timePicker.open()
    }

	Inputs.TimePicker {
        id: timePicker

        visible: true
        closePolicy: Popup.NoAutoClose

        onTimeAccepted: (date) => {
                            timeLabel.text = timePicker.formatTime(date)
                        }
    }

	UI.Overline {
        id: timeLabel

        visible: timePicker.opened
        text: qsTr("Press OK")
		color: UI.Theme.text.secondary
        width: timePicker.width
        horizontalAlignment: Qt.AlignHCenter
        x: timePicker.x
        y: timePicker.y + timePicker.height + UI.Size.pixel48
    }
}
