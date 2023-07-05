import QtQuick
import QtQuick.Layouts

import MMaterial

Sidebar {
    SidebarCategoryLabel{ text: qsTr("Components")}
    SidebarItem{
        id: _fonts
        text: "Fonts";
        icon.path: IconList.font;
        onClicked: showcaseLoader.sourceComponent = fontShowcase;
        checked: true
    }
    SidebarItem{
        text: "Colors";
        icon.path: IconList.palette;
        onClicked: showcaseLoader.sourceComponent = colorShowcase;
    }
//            SidebarItem{
//                text: "Avatars";
//                icon.path: IconList.star;
//                onClicked: showcaseLoader.sourceComponent = avatarShowcase;
//            }
    SidebarItem{
        text: "Badge";
        icon.path: IconList.verified;
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
        model: [
            {text : "Basic", onClicked: function(){ showcaseLoader.sourceComponent = buttonShowcase}},
            {text : "Fab", onClicked: function(){ showcaseLoader.sourceComponent = fabButtonShowcase}},
            {text : "Toggle", onClicked: function(){ showcaseLoader.sourceComponent = toggleButtonShowcase }},
            {text : "Checkbox", onClicked: function(){ showcaseLoader.sourceComponent = checkboxShowcase }}
        ];
    }
    SidebarItem{
        text: "Alerts";
        icon.path: IconList.alert;
        onClicked: showcaseLoader.sourceComponent = alertShowcase;
    }
    SidebarItem{
        text: "List Items";
        icon.path: IconList.list;
        onClicked: showcaseLoader.sourceComponent = listItemShowcase;
    }
    Item{ Layout.fillHeight: true; }
}
