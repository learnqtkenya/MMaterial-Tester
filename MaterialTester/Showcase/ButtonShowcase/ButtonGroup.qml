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
            height: recommendedHeight
            width: recommendedWidth
        }
        MButton{
            type: groupRoot.buttonType
            accent: Theme.secondary
            text: "Secondary"
            height: recommendedHeight
            width: recommendedWidth
        }
        MButton{
            type: groupRoot.buttonType
            accent: Theme.info
            text: "Info"
            height: recommendedHeight
            width: recommendedWidth
        }
        MButton{
            type: groupRoot.buttonType
            accent: Theme.success
            text: "Success"
            height: recommendedHeight
            width: recommendedWidth
        }
        MButton{
            type: groupRoot.buttonType
            accent: Theme.warning
            text: "Warning"
            height: recommendedHeight
            width: recommendedWidth
        }
        MButton{
            type: groupRoot.buttonType
            accent: Theme.error
            text: "Error"
            height: recommendedHeight
            width: recommendedWidth
        }
        Item{ Layout.fillWidth: true; }
    }

    TitleRow{
        title: qsTr("States")

        MButton{
            type: groupRoot.buttonType
            accent: Theme.primary
            text: mouseArea.containsMouse ? "Hovered" : "Enabled"
            height: recommendedHeight
            width: recommendedWidth
        }
        MButton{
            enabled: false
            type: groupRoot.buttonType
            accent: Theme.primary
            text: "Disabled"
            height: recommendedHeight
            width: recommendedWidth
        }
        Item{ Layout.fillWidth: true; }
    }

    TitleRow{
        title: qsTr("Icon")

        MButton{
            type: groupRoot.buttonType
            accent: Theme.primary
            text: "Left Icon"
            leftIcon.path: IconList.logo
            height: recommendedHeight
            width: recommendedWidth
        }
        MButton{
            type: groupRoot.buttonType
            accent: Theme.primary
            text: "Left and Right Icon"
            leftIcon.path: IconList.logo
            rightIcon.path: IconList.logo
            height: recommendedHeight
            width: recommendedWidth
        }
        MButton{
            type: groupRoot.buttonType
            accent: Theme.primary
            text: "Right Icon"
            rightIcon.path: IconList.logo
            height: recommendedHeight
            width: recommendedWidth
        }
        Item{ Layout.fillWidth: true; }
    }

    TitleRow{
        title: qsTr("Size")

        MButton{
            type: groupRoot.buttonType
            accent: Theme.primary
            size: Size.Grade.L
            text: "Large"
            height: recommendedHeight
            width: recommendedWidth
        }
        MButton{
            type: groupRoot.buttonType
            accent: Theme.primary
            size: Size.Grade.M
            text: "Medium"
            height: recommendedHeight
            width: recommendedWidth
        }
        MButton{
            type: groupRoot.buttonType
            accent: Theme.primary
            size: Size.Grade.S
            text: "Small"
            height: recommendedHeight
            width: recommendedWidth
        }
        Item{ Layout.fillWidth: true; }
    }
    Item{ Layout.fillHeight: true; }
}
