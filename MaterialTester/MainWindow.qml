import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import MMaterial

import "./Showcase"
import "./Showcase/ColorShowcase"
import "./Showcase/AvatarShowcase"
import "./Showcase/ButtonShowcase"
import "./Showcase/AlertShowcase"

import "./Components/AppSettings"

Rectangle{
    color: Theme.background.main



    RowLayout{
        id: header
        spacing: Size.pixel14
        height: 56 * Size.scale
        width: parent.width* 0.95
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }

        H6{
            Layout.fillWidth: true
            text: showcaseLoader.currentItem ? showcaseLoader.currentItem.objectName : ""
            color: Theme.main.p500
            font {
                capitalization: Font.AllUppercase
            }
        }

        Icon{
            path: IconList.menu
            sourceSize.height: parent.height/4
            interactive: true
            color: Theme.text.primary
            onClicked: appSettings.toggle();
        }
    }
    Rectangle{
        height: 1
        width: parent.width
        color: Theme.other.divider
        anchors.bottom: parent.bottom
    }

    StackView{
        id: showcaseLoader
        anchors{
            top: header.bottom
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        initialItem: toggleButtonShowcase
    }

    Component{ id: fontShowcase;  FontShowcase{ } }
    Component{ id: colorShowcase; ColorShowcase{ } }
    Component{ id: avatarShowcase; AvatarShowcase{ } }
    Component{ id: badgeShowcase; BadgeShowcase{ } }
    Component{ id: accordionShowcase; AccordionShowcase{ } }
    Component{ id: buttonShowcase; ButtonShowcase{ } }
    Component{ id: toggleButtonShowcase; ToggleButtonShowcase{ } }
    Component{ id: alertShowcase; AlertShowcase{ } }

    AppSettings{
        id: appSettings
    }
}

