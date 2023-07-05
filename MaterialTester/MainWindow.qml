import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

import MMaterial

import "./Showcase"
import "./Showcase/ColorShowcase"
import "./Showcase/AvatarShowcase"
import "./Showcase/ButtonShowcase"
import "./Showcase/AlertShowcase"

import "./Components/AppSettings"
import "./Components/Sidebar"

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

    Loader{
        id: showcaseLoader
        asynchronous: true
        anchors{
            margins: Size.pixel32
            top: header.bottom
            bottom: parent.bottom
            left: sidebar.right
            right: parent.right
        }

        sourceComponent: fontShowcase

        BusyIndicator{
            anchors.centerIn: parent
            height: Size.pixel48 * 2
            width: height
            visible: showcaseLoader.status == Loader.Loading
            Material.accent: Theme.primary.main
        }
    }

    Component{ id: fontShowcase;  FontShowcase{ } }
    Component{ id: colorShowcase; ColorShowcase{ } }
    Component{ id: avatarShowcase; AvatarShowcase{ } }
    Component{ id: badgeShowcase; BadgeShowcase{ } }
    Component{ id: accordionShowcase; AccordionShowcase{ } }
    Component{ id: buttonShowcase; ButtonShowcase{  } }
    Component{ id: toggleButtonShowcase; ToggleButtonShowcase{ } }
    Component{ id: fabButtonShowcase; FabButtonShowcase{ } }
    Component{ id: alertShowcase; AlertShowcase{ } }
    Component{ id: checkboxShowcase; CheckboxShowcase{ } }

    AppSettings{
        id: appSettings
    }

    CustomSidebar{
        id: sidebar
    }
}

