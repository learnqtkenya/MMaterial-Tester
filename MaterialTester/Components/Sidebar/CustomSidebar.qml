import QtQuick
import QtQuick.Layouts

import MMaterial

Sidebar {
    name: "John Doe"
    role: "Admin"

    extendedSidebar.list.currentIndex: -1;
    compactSidebar.list.currentIndex: -1;

    extendedSidebar.model: ObjectModel {
        id: extendedModel

        SidebarItem {
            text: "Project";
            icon.iconData: Icons.light.info;
            category: "introduction"

            onClicked: showcaseLoader.sourceComponent = projectInfo;
        }

        SidebarItem {
            text: "Icons";
            icon.iconData: Icons.light.logo;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = iconShowcase;
        }

        SidebarItem {
            text: "Fonts";
            icon.iconData: Icons.light.font;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = fontShowcase;
        }

        SidebarItem {
            text: "Colors";
            icon.iconData: Icons.light.palette;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = colorShowcase;
        }

        SidebarItem {
            text: "Badge";
            icon.iconData: Icons.light.verified;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = badgeShowcase;
        }

        SidebarItem {
            text: "Accordion";
            icon.iconData: Icons.light.star;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = accordionShowcase;
        }

        SidebarItem {
            text: "Buttons";
            icon.iconData: Icons.light.gamepad;
            category: "components"
            model: [
                {text : "Basic", onClicked: function(){ showcaseLoader.sourceComponent = buttonShowcase}},
                {text : "Fab", onClicked: function(){ showcaseLoader.sourceComponent = fabButtonShowcase}},
                {text : "Toggle", onClicked: function(){ showcaseLoader.sourceComponent = toggleButtonShowcase }},
                {text : "Checkbox", onClicked: function(){ showcaseLoader.sourceComponent = checkboxShowcase }},
                {text : "Radio", onClicked: function(){ showcaseLoader.sourceComponent = radioButtonShowcase }},
                {text : "Switch", onClicked: function(){ showcaseLoader.sourceComponent = switchShowcase }}
            ];
        }

        SidebarItem {
            text: "Alerts";
            icon.iconData: Icons.light.alert;
            onClicked: showcaseLoader.sourceComponent = alertShowcase;
            category: "components"
        }

        SidebarItem {
            text: "List Items";
            icon.iconData: Icons.light.list;
            onClicked: showcaseLoader.sourceComponent = listItemShowcase;
            category: "components"
        }

        SidebarItem {
            text: "Pagination";
            icon.iconData: Icons.light.pages;
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
            icon.iconData: Icons.light.stonks;
            category: "components"
            onClicked: showcaseLoader.sourceComponent = progressShowcase;
        }

        SidebarItem {
            text: "Inputs";
            icon.iconData: Icons.light.edit;
            category: "components"
            model: [
                {text : "TextField", onClicked: function(){ showcaseLoader.sourceComponent = textFieldShowcase}},
                {text : "Dropdown", onClicked: function(){ showcaseLoader.sourceComponent = dropdownShowcase}}
            ];
        }
    }

    compactSidebar.model: ObjectModel {
        id: compactModel

        SidebarCompactItem {
            text: "Project";
            icon.iconData: Icons.light.info;
            category: "introduction"

            onClicked: showcaseLoader.sourceComponent = projectInfo;
        }

        SidebarCompactItem {
            text: "Fonts";
            icon.iconData: Icons.light.font;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = fontShowcase;
        }

        SidebarCompactItem {
            text: "Colors";
            icon.iconData: Icons.light.palette;
            onClicked: showcaseLoader.sourceComponent = colorShowcase;
            category: "components"
        }

        SidebarCompactItem {
            text: "Badge";
            icon.iconData: Icons.light.verified;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = badgeShowcase;
        }

        SidebarCompactItem {
            text: "Accordion";
            icon.iconData: Icons.light.star;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = accordionShowcase;
        }

        SidebarCompactItem {
            text: "Buttons";
            icon.iconData: Icons.light.gamepad;
            category: "components"
            model: [
                {text : "Basic", onClicked: function(){ showcaseLoader.sourceComponent = buttonShowcase}},
                {text : "Fab", onClicked: function(){ showcaseLoader.sourceComponent = fabButtonShowcase}},
                {text : "Toggle", onClicked: function(){ showcaseLoader.sourceComponent = toggleButtonShowcase }},
                {text : "Checkbox", onClicked: function(){ showcaseLoader.sourceComponent = checkboxShowcase }},
                {text : "Radio", onClicked: function(){ showcaseLoader.sourceComponent = radioButtonShowcase }},
                {text : "Switch", onClicked: function(){ showcaseLoader.sourceComponent = switchShowcase }}
            ];
        }

        SidebarCompactItem {
            text: "Alerts";
            icon.iconData: Icons.light.alert;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = alertShowcase;
        }

        SidebarCompactItem {
            text: "List Items";
            icon.iconData: Icons.light.list;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = listItemShowcase;
        }

        SidebarCompactItem {
            text: "Pagination";
            icon.iconData: Icons.light.pages;
            category: "components"
            model: [
                {text : "Basic", onClicked: function(){ showcaseLoader.sourceComponent = paginationShowcase }},
                {text : "Simple", onClicked: function(){ showcaseLoader.sourceComponent = paginationSimpleShowcase }},
                {text : "Bubble", onClicked: function(){ showcaseLoader.sourceComponent = paginationBubbleShowcase }},
                {text : "Arrows", onClicked: function(){ showcaseLoader.sourceComponent = paginationArrowsShowcase }}
            ];
        }

        SidebarCompactItem {
            text: "Progress";
            icon.iconData: Icons.light.stonks;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = progressShowcase;
        }

        SidebarCompactItem {
            text: "Inputs";
            icon.iconData: Icons.light.edit;
            category: "components"
            model: [
                {text : "TextField", onClicked: function(){ showcaseLoader.sourceComponent = textFieldShowcase}},
                {text : "Dropdown", onClicked: function(){ showcaseLoader.sourceComponent = dropdownShowcase}}
            ];
        }
    }
}
