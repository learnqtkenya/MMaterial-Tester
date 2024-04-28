import QtQuick
import QtQuick.Layouts

import MMaterial

// Compared to CustomSidebar, it's less work but less customizability aswell

Sidebar {
    name: "John Doe"
    role: "Admin"

    extendedSidebar.list.currentIndex: -1;
    compactSidebar.list.currentIndex: -1;

    SidebarItem {
        text: "Project";
        icon: Icons.light.info;
        category: "introduction"

        onClicked: () => { showcaseLoader.sourceComponent = projectInfo }
    }

    SidebarItem {
        text: "Icons";
        icon: Icons.light.logo;
        category: "components"

        onClicked: () => { showcaseLoader.sourceComponent = iconShowcase }
    }

    SidebarItem {
        text: "Fonts";
        icon: Icons.light.font;
        category: "components"

        onClicked: () => { showcaseLoader.sourceComponent = fontShowcase }
    }

    SidebarItem {
        text: "Colors";
        icon: Icons.light.palette;
        category: "components"

        onClicked: () => { showcaseLoader.sourceComponent = colorShowcase }
    }

    SidebarItem {
        text: "Badge";
        icon: Icons.light.verified;
        category: "components"

        onClicked: () => { showcaseLoader.sourceComponent = badgeShowcase }
    }

    SidebarItem {
        text: "Accordion";
        icon: Icons.light.star;
        category: "components"

        onClicked: () => { showcaseLoader.sourceComponent = accordionShowcase }
    }

    SidebarItem {
        text: "Buttons";
        icon: Icons.light.gamepad;
        category: "components"
        model: [
            {text : "Basic", onClicked: function(){ showcaseLoader.sourceComponent = buttonShowcase}},
            {text : "Fab", onClicked: function(){ showcaseLoader.sourceComponent = fabButtonShowcase}},
            {text : "Toggle", onClicked: function(){ showcaseLoader.sourceComponent = toggleButtonShowcase }},
            {text : "Checkbox", onClicked: function(){ showcaseLoader.sourceComponent = checkboxShowcase }},
            {text : "Radio", onClicked: function(){ showcaseLoader.sourceComponent = radioButtonShowcase }},
            {text : "Switch", onClicked: function(){ showcaseLoader.sourceComponent = switchShowcase }},
            {text : "Tab", onClicked: function(){ showcaseLoader.sourceComponent = tabShowcase }}
        ];
    }

    SidebarItem {
        text: "Alerts";
        icon: Icons.light.alert;
        category: "components"
        onClicked: () => { showcaseLoader.sourceComponent = alertShowcase }
    }

    SidebarItem {
        text: "List Items";
        icon: Icons.light.list;
        category: "components"
        onClicked: () => { showcaseLoader.sourceComponent = listItemShowcase }
    }

    SidebarItem {
        text: "Pagination";
        icon: Icons.light.pages;
        category: "components"
        model: [
            {text : "Basic", onClicked: function(){ showcaseLoader.sourceComponent = paginationShowcase }},
            {text : "Simple", onClicked: function(){ showcaseLoader.sourceComponent = paginationSimpleShowcase }},
            {text : "Bubble", onClicked: function(){ showcaseLoader.sourceComponent = paginationBubbleShowcase }},
            {text : "Arrows", onClicked: function(){ showcaseLoader.sourceComponent = paginationArrowsShowcase }}
        ];
    }

    SidebarItem {
        text: "Progress";
        icon: Icons.light.stonks;
        category: "components"
        onClicked: () => { showcaseLoader.sourceComponent = progressShowcase }
    }

    SidebarItem {
        text: "Inputs";
        icon: Icons.light.edit;
        category: "components"
        model: [
            {text : "TextField", onClicked: function(){ showcaseLoader.sourceComponent = textFieldShowcase}},
            {text : "Dropdown", onClicked: function(){ showcaseLoader.sourceComponent = dropdownShowcase}}
        ];
    }

    SidebarItem {
        text: "Slider";
        icon: Icons.light.stonks;
        category: "components"

        onClicked: () => { showcaseLoader.sourceComponent = sliderShowcase }
    }

    SidebarItem {
        text: "Rectangle";
        icon: Icons.light.stonks;
        category: "components"

        onClicked: () => { showcaseLoader.sourceComponent = rectangleShowcase }
    }

    SidebarItem {
        text: "Menu";
        icon: Icons.light.menu;
        category: "components"

        onClicked: () => { showcaseLoader.sourceComponent = menuShowcase }
    }

    SidebarItem {
        text: "Avatar";
        icon: Icons.heavy.addPhoto;
        category: "components"

        onClicked: () => { showcaseLoader.sourceComponent = avatarShowcase }
    }
}
