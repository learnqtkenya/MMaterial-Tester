import QtQuick
import QtQuick.Effects
import QtQuick.Layouts

import MMaterial

Rectangle {
    width: 280
    height: parent.height
    color: Theme.background.main

    CheckedGroup{ checkables: [..._sidebarLayout.children] }
    ColumnLayout{
        anchors {
            fill: parent
            margins: Size.pixel16
            topMargin: Size.pixel24
        }

        Icon{
            color: Theme.primary.main
            sourceSize.height: Size.pixel32
            sourceSize.width: Size.pixel32
            Layout.leftMargin: Size.pixel4
            path: IconList.logo
        }

        Rectangle{
            Layout.leftMargin: Size.pixel4
            Layout.rightMargin: Size.pixel4
            Layout.topMargin: Size.pixel32
            Layout.preferredHeight: 76 * Size.scale
            Layout.fillWidth: true
            radius: 12
            color: Theme.background.neutral
        }

        ColumnLayout {
            id: _sidebarLayout
            Layout.topMargin: Size.pixel16
            Layout.fillHeight: true;
            Layout.fillWidth: true

            SidebarCategoryLabel{ text: qsTr("General")}
            SidebarItem{
                id: _fonts
                text: "Fonts";
                icon.path: IconList.star;
                onClicked: showcaseLoader.sourceComponent = fontShowcase;
            }
            SidebarItem{
                text: "Colors";
                icon.path: IconList.star;
                onClicked: showcaseLoader.sourceComponent = colorShowcase;
            }
            SidebarItem{
                text: "Avatars";
                icon.path: IconList.star;
                onClicked: showcaseLoader.sourceComponent = avatarShowcase;
            }
            SidebarItem{
                text: "Badge";
                icon.path: IconList.star;
                onClicked: showcaseLoader.sourceComponent = badgeShowcase;
            }
            SidebarItem{
                text: "Accordion";
                icon.path: IconList.star;
                onClicked: showcaseLoader.sourceComponent = accordionShowcase;
            }
            SidebarItem{
                text: "Buttons";
                icon.path: IconList.star;
                model: [{text : "Basic", onClicked: function(){ showcaseLoader.sourceComponent = buttonShowcase}}, {text : "Fab", onClicked: function(){ showcaseLoader.sourceComponent = fabButtonShowcase}}, {text : "Toggle", onClicked: function(){ showcaseLoader.sourceComponent = toggleButtonShowcase }}];
            }
            SidebarItem{
                text: "Alerts";
                icon.path: IconList.star;
                onClicked: showcaseLoader.sourceComponent = alertShowcase;
            }

            Item{ Layout.fillHeight: true; }
        }

    }

    layer{
        enabled: true
        effect: MultiEffect{
            shadowEnabled: true
            shadowBlur: 3
            shadowHorizontalOffset: 2
            shadowVerticalOffset: 5

        }
    }
}
