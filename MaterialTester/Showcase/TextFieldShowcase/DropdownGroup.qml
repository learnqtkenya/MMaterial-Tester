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

        MDropdown {
            type: groupRoot.type
            accent: Theme.primary
        }

        MDropdown {
            type: groupRoot.type
            accent: Theme.primary
        }

        MDropdown {
            enabled: false
            type: groupRoot.type
            accent: Theme.primary
        }

        MDropdown {
            type: groupRoot.type
            accent: Theme.primary
            input.validator: RegularExpressionValidator{ regularExpression: /^[\d]+$/ }
        }
    }

    TitleRow {
        title.text: qsTr("Icon")
        grid.columns: groupRoot.columnCount

        MDropdown {
            type: groupRoot.type
            accent: Theme.primary
            leftIcon.path: IconList.logo
        }

        MDropdown {
            type: groupRoot.type
            accent: Theme.primary
            leftIcon.path: IconList.logo
        }

        MDropdown {
            type: groupRoot.type
            accent: Theme.primary
        }
    }

    Item { Layout.fillHeight: true; }
}
