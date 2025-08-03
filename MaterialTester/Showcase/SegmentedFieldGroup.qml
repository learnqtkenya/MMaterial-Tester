import QtQuick
import QtQuick.Layouts

import MMaterial.UI as UI
import MMaterial.Controls.Inputs as Inputs
import MMaterial.Media as Media
import MaterialTester.Components

ColumnLayout {
    id: groupRoot

    required property int type
    required property string title

    property int columnCount: Window.width > (1920 * UI.Size.scale) ? 3 : (Window.width > 1180 * UI.Size.scale ? 2 : 1)

    UI.Subtitle1 {
        text: groupRoot.title
    }

    TitleRow {
        title.text: qsTr("Verification Codes")
        grid.columns: groupRoot.columnCount

        Inputs.SegmentedField {
            type: groupRoot.type
            accent: UI.Theme.primary
            segmentCount: 6
            placeholderText: "000000"
        }

        Inputs.SegmentedField {
            type: groupRoot.type
            accent: UI.Theme.primary
            segmentCount: 4
            text: "1234"
            placeholderText: "0000"
        }

        Inputs.SegmentedField {
            enabled: false
            type: groupRoot.type
            accent: UI.Theme.primary
            segmentCount: 5
            text: "12345"
            placeholderText: "00000"
        }
    }

    TitleRow {
        title.text: qsTr("PIN Entry")
        grid.columns: groupRoot.columnCount

        Inputs.SegmentedField {
            type: groupRoot.type
            accent: UI.Theme.success
            segmentCount: 4
            placeholderText: "••••"
            validator: RegularExpressionValidator { regularExpression: /^[0-9]$/ }
        }

        Inputs.SegmentedField {
            type: groupRoot.type
            accent: UI.Theme.warning
            segmentCount: 6
            placeholderText: "••••••"
            validator: RegularExpressionValidator { regularExpression: /^[0-9]$/ }
        }

        Inputs.SegmentedField {
            type: groupRoot.type
            accent: UI.Theme.info
            segmentCount: 8
            spacing: UI.Size.pixel12
            placeholderText: "••••••••"
            validator: RegularExpressionValidator { regularExpression: /^[0-9]$/ }
        }
    }

    TitleRow {
        title.text: qsTr("Responsive Wrapping")
        grid.columns: groupRoot.columnCount

        Inputs.SegmentedField {
            type: groupRoot.type
            accent: UI.Theme.secondary
            segmentCount: 12
            placeholderText: "ABCDEFGHIJKL"
            validator: RegularExpressionValidator { regularExpression: /^[A-Z0-9]$/ }
        }

        Inputs.SegmentedField {
            type: groupRoot.type
            accent: UI.Theme.error
            segmentCount: 4
            acceptableInput: false
            text: "ERR0"
            placeholderText: "CODE"
            validator: RegularExpressionValidator { regularExpression: /^[A-Z0-9]$/ }
        }

        Inputs.SegmentedField {
            type: groupRoot.type
            accent: UI.Theme.primary
            segmentCount: 3
            spacing: UI.Size.pixel16
            segmentSize: UI.Size.pixel54
            placeholderText: "XYZ"
            validator: RegularExpressionValidator { regularExpression: /^[A-Z]$/ }
        }
    }

    Item { Layout.fillHeight: true; }
}
