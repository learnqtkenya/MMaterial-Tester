import QtQuick
import QtQuick.Layouts

import MMaterial.UI as UI
import MMaterial.Controls.Inputs as Inputs
import MMaterial.Media as Media
import MaterialTester.Components

ColumnLayout {
    id: groupRoot

    required property string title

    property int columnCount: Window.width > (1920 * UI.Size.scale) ? 3 : (Window.width > 1180 * UI.Size.scale ? 2 : 1)

    UI.Subtitle1 {
        text: groupRoot.title
    }

    TitleRow {
        title.text: qsTr("Verification Codes")
        grid.columns: groupRoot.columnCount

        Inputs.SegmentedField {
            length: 6
            accent: UI.Theme.primary
        }

        Inputs.SegmentedField {
            length: 4
            accent: UI.Theme.primary
            text: "1234"
        }

        Inputs.SegmentedField {
            enabled: false
            length: 5
            accent: UI.Theme.primary
            text: "12345"
        }
    }

    TitleRow {
        title.text: qsTr("PIN Entry")
        grid.columns: groupRoot.columnCount

        Inputs.SegmentedField {
            length: 4
            accent: UI.Theme.success
            validator: RegularExpressionValidator { regularExpression: /^[0-9]$/ }
        }

        Inputs.SegmentedField {
            length: 6
            accent: UI.Theme.warning
            validator: RegularExpressionValidator { regularExpression: /^[0-9]$/ }
        }

        Inputs.SegmentedField {
            length: 8
            accent: UI.Theme.info
            spacing: UI.Size.pixel12
            validator: RegularExpressionValidator { regularExpression: /^[0-9]$/ }
        }
    }

    TitleRow {
        title.text: qsTr("Custom Styling")
        grid.columns: groupRoot.columnCount

        Inputs.SegmentedField {
            length: 6
            accent: UI.Theme.secondary
            validator: RegularExpressionValidator { regularExpression: /^[A-Z0-9]$/ }
            inputMethodHints: Qt.ImhUppercaseOnly | Qt.ImhNoPredictiveText
        }

        Inputs.SegmentedField {
            length: 4
            accent: UI.Theme.error
            acceptableInput: false
            text: "ERR0"
            validator: RegularExpressionValidator { regularExpression: /^[A-Z0-9]$/ }
        }

        Inputs.SegmentedField {
            length: 3
            accent: UI.Theme.primary
            spacing: UI.Size.pixel16
            segmentSize: UI.Size.pixel54
            fontSize: UI.Size.pixel32
            validator: RegularExpressionValidator { regularExpression: /^[A-Z]$/ }
            inputMethodHints: Qt.ImhUppercaseOnly | Qt.ImhNoPredictiveText
        }
    }

    TitleRow {
        title.text: qsTr("Different Lengths")
        grid.columns: groupRoot.columnCount

        Inputs.SegmentedField {
            length: 2
            accent: UI.Theme.primary
            spacing: UI.Size.pixel20
        }

        Inputs.SegmentedField {
            length: 7
            accent: UI.Theme.secondary
            spacing: UI.Size.pixel6
        }

        Inputs.SegmentedField {
            length: 10
            accent: UI.Theme.info
            spacing: UI.Size.pixel4
            segmentSize: UI.Size.pixel40
            fontSize: UI.Size.pixel24
        }
    }

    Item { Layout.fillHeight: true; }
}
