import QtQuick
import QtQuick.Layouts

import MMaterial.UI as UI
import MMaterial.Controls as Controls

Item {
    id: _root

	component CustomSlider: Controls.MSlider {
        Layout.fillWidth: true
        from: 0
        value: 50
        to: 100
    }

	UI.Overline {
        id: _title

        width: _root.width
		color: UI.Theme.text.disabled
        font.capitalization: Font.AllUppercase
        text: "MSlider"
    }

    ColumnLayout {
        anchors {
            top: _title.bottom; topMargin: UI.Size.pixel40
            bottom: _root.bottom
            left: _root.left; leftMargin: UI.Size.pixel20
            right: _root.right; rightMargin: UI.Size.pixel20
        }

		CustomSlider { accent: UI.Theme.primary }

		CustomSlider { accent: UI.Theme.secondary }

		CustomSlider { accent: UI.Theme.info }

		CustomSlider { accent: UI.Theme.success }

		CustomSlider { accent: UI.Theme.warning }

		CustomSlider { accent: UI.Theme.error }

        Item { Layout.fillHeight: true }
    }
}
