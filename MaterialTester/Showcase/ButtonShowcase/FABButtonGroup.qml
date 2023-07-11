import QtQuick 2.15
import QtQuick.Layouts

import MMaterial

import "../../Components/Common"

ColumnLayout{
    id: groupRoot
    required property int buttonType
    required property string title
    Subtitle1{
        text: groupRoot.title
    }

    TitleRow{
        title: qsTr("Color")

        MFabButton{
            type: groupRoot.buttonType
            accent: Theme.primary
            text: "Primary"
        }
        MFabButton{
            type: groupRoot.buttonType
            accent: Theme.secondary
            text: "Secondary"
        }
        MFabButton{
            type: groupRoot.buttonType
            accent: Theme.info
            text: "Info"
        }
        MFabButton{
            type: groupRoot.buttonType
            accent: Theme.success
            text: "Success"
        }
        MFabButton{
            type: groupRoot.buttonType
            accent: Theme.warning
            text: "Warning"
        }
        MFabButton{
            type: groupRoot.buttonType
            accent: Theme.error
            text: "Error"
        }
    }

    TitleRow{
        title: qsTr("States")

        MFabButton{
            type: groupRoot.buttonType
            accent: Theme.primary
            text: mouseArea.containsMouse ? "Hovered" : "Enabled"
        }
        MFabButton{
            enabled: false
            type: groupRoot.buttonType
            accent: Theme.primary
            text: "Disabled"
        }
    }

    TitleRow{
        title: qsTr("Icon")

        MFabButton{
            type: groupRoot.buttonType
            accent: Theme.primary
            text: "Left Icon"
            leftIcon.path: IconList.logo
        }
        MFabButton{
            type: groupRoot.buttonType
            accent: Theme.primary
            text: "Left and Right Icon"
            leftIcon.path: IconList.logo
            rightIcon.path: IconList.logo
        }
        MFabButton{
            type: groupRoot.buttonType
            accent: Theme.primary
            text: "Right Icon"
            rightIcon.path: IconList.logo
        }
        MFabButton{
            type: groupRoot.buttonType
            accent: Theme.primary
            rightIcon.path: IconList.logo
        }
    }

    TitleRow{
        title: qsTr("Size")

        MFabButton{
            type: groupRoot.buttonType
            accent: Theme.primary
            size: Size.Grade.L
            text: "Large"
        }
        MFabButton{
            type: groupRoot.buttonType
            accent: Theme.primary
            size: Size.Grade.M
            text: "Medium"
        }
        MFabButton{
            type: groupRoot.buttonType
            accent: Theme.primary
            size: Size.Grade.S
            text: "Small"
        }
    }
    Item{ Layout.fillHeight: true; }
}
