import QtQuick 
import QtQuick.Layouts

import MMaterial

import "../../Components/Common"

ColumnLayout {
    id: groupRoot

    required property int type
    required property string title

    property int columnCount: Window.width > (1920 * Size.scale) ? 4 : (Window.width > 1180 * Size.scale ? 2 : 1)

    Subtitle1 {
        text: groupRoot.title
    }

    TitleRow {
        title.text: qsTr("States")
        grid.columns: groupRoot.columnCount

        MTextField {
            type: groupRoot.type
            accent: Theme.primary
        }

        MTextField {
            type: groupRoot.type
            accent: Theme.primary
            text: qsTr("Value (Enabled)")
        }

        MTextField {
            enabled: false
            type: groupRoot.type
            accent: Theme.primary
            text: qsTr("Value (Disabled)")
        }

        MTextField {
            type: groupRoot.type
            accent: Theme.primary
            text: qsTr("Value (Incorrect)")
            input.validator: RegularExpressionValidator{ regularExpression: /^[\d]+$/ }
        }
    }

    TitleRow {
        title.text: qsTr("Icon")
        grid.columns: groupRoot.columnCount

        MTextField {
            type: groupRoot.type
            accent: Theme.primary
            text: qsTr("Left Icon")
            leftIcon.iconData: Icons.light.logo
        }

        MTextField {
            type: groupRoot.type
            accent: Theme.primary
            text: qsTr("Left and Right Icon")
            leftIcon.iconData: Icons.light.logo
            rightIcon.iconData: Icons.light.logo
        }

        MTextField {
            type: groupRoot.type
            accent: Theme.primary
            text: qsTr("Right Icon")
            rightIcon.iconData: Icons.light.logo
        }
    }

    Item { Layout.fillHeight: true; }
}
