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

        MButton{
            type: groupRoot.buttonType
            accent: Theme.primary
            text: "Primary"
            Layout.alignment: Qt.AlignLeft
        }
        MButton{
            type: groupRoot.buttonType
            accent: Theme.secondary
            text: "Secondary"
        }
        MButton{
            type: groupRoot.buttonType
            accent: Theme.info
            text: "Info"
        }
        MButton{
            type: groupRoot.buttonType
            accent: Theme.success
            text: "Success"
        }
        MButton{
            type: groupRoot.buttonType
            accent: Theme.warning
            text: "Warning"
        }
        MButton{
            type: groupRoot.buttonType
            accent: Theme.error
            text: "Error"
        }
    }

    TitleRow{
        title: qsTr("States")

        MButton{
            type: groupRoot.buttonType
            accent: Theme.primary
            text: mouseArea.containsMouse ? "Hovered" : "Enabled"
        }
        MButton{
            enabled: false
            type: groupRoot.buttonType
            accent: Theme.primary
            text: "Disabled"
        }
    }

    TitleRow{
        title: qsTr("Icon")

        MButton{
            type: groupRoot.buttonType
            accent: Theme.primary
            text: "Left Icon"
            leftIcon.path: IconList.logo
        }
        MButton{
            type: groupRoot.buttonType
            accent: Theme.primary
            text: "Left and Right Icon"
            leftIcon.path: IconList.logo
            rightIcon.path: IconList.logo
        }
        MButton{
            type: groupRoot.buttonType
            accent: Theme.primary
            text: "Right Icon"
            rightIcon.path: IconList.logo
        }
    }

    TitleRow{
        title: qsTr("Size")

        MButton{
            type: groupRoot.buttonType
            accent: Theme.primary
            size: Size.Grade.L
            text: "Large"
        }
        MButton{
            type: groupRoot.buttonType
            accent: Theme.primary
            size: Size.Grade.M
            text: "Medium"
        }
        MButton{
            type: groupRoot.buttonType
            accent: Theme.primary
            size: Size.Grade.S
            text: "Small"
        }
    }
    Item{ Layout.fillHeight: true; }
}
