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
import "./Showcase/ListItemShowcase"
import "./Showcase/PaginationShowcase"

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
            path: IconList.settings
            sourceSize.height: parent.height/2
            interactive: true
            color: Theme.text.secondary
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
            leftMargin: Size.pixel46
            top: header.bottom
            bottom: parent.bottom
            left: sidebar.right
            right: parent.right
        }

        sourceComponent: placeholder

        BusyIndicator{
            anchors.centerIn: parent
            height: Size.pixel48 * 2
            width: height
            visible: showcaseLoader.status == Loader.Loading
            Material.accent: Theme.primary.main
        }
    }

    Component{ id: placeholder; Placeholder{ } }
    Component{ id: projectInfo; ProjectInfo{ } }
    Component{ id: fontShowcase;  FontShowcase{ } }
    Component{ id: colorShowcase; ColorShowcase{ } }
    Component{ id: avatarShowcase; AvatarShowcase{ } }
    Component{ id: badgeShowcase; BadgeShowcase{ } }
    Component{ id: accordionShowcase; AccordionShowcase{ } }
    Component{ id: alertShowcase; AlertShowcase{ } }
    Component{ id: listItemShowcase; ListItemShowcase{ } }
    Component{ id: progressShowcase; ProgressShowcase{ } }

    // Buttons
    Component{ id: buttonShowcase; ButtonShowcase{  } }
    Component{ id: toggleButtonShowcase; ToggleButtonShowcase{ } }
    Component{ id: fabButtonShowcase; FabButtonShowcase{ } }
    Component{ id: checkboxShowcase; CheckboxShowcase{ } }
    Component{ id: radioButtonShowcase; RadioButtonShowcase{ } }
    Component{ id: switchShowcase; SwitchShowcase{ } }

    // Pagination
    Component{ id: paginationShowcase; PaginationShowcase{ } }
    Component{ id: paginationArrowsShowcase; PaginatorArrowsShowcase{ } }
    Component{ id: paginationBubbleShowcase; PaginatorBubbleShowcase{ } }
    Component{ id: paginationSimpleShowcase; PaginatorSimpleShowcase{ } }

    AppSettings{
        id: appSettings
    }

    CustomSidebar{
        id: sidebar
    }

    onWidthChanged: {
       Size.format = Window.width > 800 ? Size.Format.Extended : Size.Format.Compact
    }
}

