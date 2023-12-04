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

        MFabButton {
            type: groupRoot.buttonType
            accent: Theme.primary
            text: "Primary"

            onClicked: isLoading = !isLoading
        }

        MFabButton {
            type: groupRoot.buttonType
            accent: Theme.secondary
            text: "Secondary"

            onClicked: isLoading = !isLoading
        }

        MFabButton {
            type: groupRoot.buttonType
            accent: Theme.info
            text: "Info"

            onClicked: isLoading = !isLoading
        }

        MFabButton {
            type: groupRoot.buttonType
            accent: Theme.success
            text: "Success"

            onClicked: isLoading = !isLoading
        }

        MFabButton {
            type: groupRoot.buttonType
            accent: Theme.warning
            text: "Warning"

            onClicked: isLoading = !isLoading
        }

        MFabButton {
            type: groupRoot.buttonType
            accent: Theme.error
            text: "Error"

            onClicked: isLoading = !isLoading
        }
    }

    TitleRow {
        title.text: qsTr("States")

        MFabButton {
            type: groupRoot.buttonType
            accent: Theme.primary
            text: mouseArea.containsMouse ? "Hovered" : "Enabled"
        }

        MFabButton {
            enabled: false
            type: groupRoot.buttonType
            accent: Theme.primary
            text: "Disabled"
        }
    }

    TitleRow {
        title.text: qsTr("Icon")

        MFabButton {
            type: groupRoot.buttonType
            accent: Theme.primary
            text: "Left Icon"
            leftIcon.iconData: Icons.light.logo
        }

        MFabButton {
            type: groupRoot.buttonType
            accent: Theme.primary
            text: "Left and Right Icon"
            leftIcon.iconData: Icons.light.logo
            rightIcon.iconData: Icons.light.logo
        }

        MFabButton {
            type: groupRoot.buttonType
            accent: Theme.primary
            text: "Right Icon"
            rightIcon.iconData: Icons.light.logo
        }

        MFabButton {
            type: groupRoot.buttonType
            accent: Theme.primary
            rightIcon.iconData: Icons.light.logo
        }
    }

    TitleRow {
        title.text: qsTr("Size")

        MFabButton {
            type: groupRoot.buttonType
            accent: Theme.primary
            size: Size.Grade.L
            text: "Large"
        }

        MFabButton {
            type: groupRoot.buttonType
            accent: Theme.primary
            size: Size.Grade.M
            text: "Medium"
        }

        MFabButton {
            type: groupRoot.buttonType
            accent: Theme.primary
            size: Size.Grade.S
            text: "Small"
        }
    }

    Item { Layout.fillHeight: true; }
}
