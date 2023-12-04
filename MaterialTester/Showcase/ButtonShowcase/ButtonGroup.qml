import QtQuick 
import QtQuick.Layouts

import MMaterial

import "../../Components/Common"

ColumnLayout {
    id: groupRoot

    required property int buttonType
    required property string title

    Subtitle1 {
        text: groupRoot.title
    }

    TitleRow {
        title.text: qsTr("Color")

        MButton {
            Layout.alignment: Qt.AlignLeft

            type: groupRoot.buttonType
            accent: Theme.primary
            text: "Primary"


            onClicked: isLoading = !isLoading
        }

        MButton {
            type: groupRoot.buttonType
            accent: Theme.secondary
            text: "Secondary"

            onClicked: isLoading = !isLoading
        }

        MButton {
            type: groupRoot.buttonType
            accent: Theme.info
            text: "Info"

            onClicked: isLoading = !isLoading
        }

        MButton {
            type: groupRoot.buttonType
            accent: Theme.success
            text: "Success"

            onClicked: isLoading = !isLoading
        }

        MButton {
            type: groupRoot.buttonType
            accent: Theme.warning
            text: "Warning"

            onClicked: isLoading = !isLoading
        }

        MButton {
            type: groupRoot.buttonType
            accent: Theme.error
            text: "Error"

            onClicked: isLoading = !isLoading
        }
    }

    TitleRow {
        title.text: qsTr("States")

        MButton {
            type: groupRoot.buttonType
            accent: Theme.primary
            text: mouseArea.containsMouse ? "Hovered" : "Enabled"
        }

        MButton {
            enabled: false
            type: groupRoot.buttonType
            accent: Theme.primary
            text: "Disabled"
        }
    }

    TitleRow {
        title.text: qsTr("Icon")

        MButton {
            type: groupRoot.buttonType
            accent: Theme.primary
            text: "Left Icon"
            leftIcon.iconData: Icons.light.logo
        }

        MButton {
            type: groupRoot.buttonType
            accent: Theme.primary
            text: "Left and Right Icon"
            leftIcon.iconData: Icons.light.logo
            rightIcon.iconData: Icons.light.logo
        }

        MButton {
            type: groupRoot.buttonType
            accent: Theme.primary
            text: "Right Icon"
            rightIcon.iconData: Icons.light.logo
        }
    }

    TitleRow {
        title.text: qsTr("Size")

        MButton {
            type: groupRoot.buttonType
            accent: Theme.primary
            size: Size.Grade.L
            text: "Large"
        }

        MButton {
            type: groupRoot.buttonType
            accent: Theme.primary
            size: Size.Grade.M
            text: "Medium"
        }

        MButton {
            type: groupRoot.buttonType
            accent: Theme.primary
            size: Size.Grade.S
            text: "Small"
        }
    }

    Item { Layout.fillHeight: true; }
}
