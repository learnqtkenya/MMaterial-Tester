import QtQuick
import QtQuick.Layouts

import MMaterial
import MaterialTester

Item {
    id: _root

    component CustomSlider: MSlider {
        Layout.fillWidth: true
        from: 0
        value: 50
        to: 100
    }

    Overline {
        id: _title

        width: _root.width
        color: Theme.text.disabled
        font.capitalization: Font.AllUppercase
        text: "MSlider"
    }

    ColumnLayout {
        anchors {
            top: _title.bottom; topMargin: Size.pixel40
            bottom: _root.bottom
            left: _root.left; leftMargin: Size.pixel20
            right: _root.right; rightMargin: Size.pixel20
        }

        CustomSlider { accent: Theme.primary }

        CustomSlider { accent: Theme.secondary }

        CustomSlider { accent: Theme.info }

        CustomSlider { accent: Theme.success }

        CustomSlider { accent: Theme.warning }

        CustomSlider { accent: Theme.error }

        Item { Layout.fillHeight: true }
    }
}
