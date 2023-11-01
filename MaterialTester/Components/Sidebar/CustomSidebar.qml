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
            icon.path: IconList.info;
            category: "introduction"

            onClicked: showcaseLoader.sourceComponent = projectInfo;
        }

        SidebarItem {
            text: "Fonts";
            icon.path: IconList.font;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = fontShowcase;
        }

        SidebarItem {
            text: "Colors";
            icon.path: IconList.palette;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = colorShowcase;
        }

        SidebarItem {
            text: "Badge";
            icon.path: IconList.verified;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = badgeShowcase;
        }

        SidebarItem {
            text: "Accordion";
            icon.path: IconList.star;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = accordionShowcase;
        }

        SidebarItem {
            text: "Buttons";
            icon.path: IconList.gamepad;
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
            icon.path: IconList.alert;
            onClicked: showcaseLoader.sourceComponent = alertShowcase;
            category: "components"
        }

        SidebarItem {
            text: "List Items";
            icon.path: IconList.list;
            onClicked: showcaseLoader.sourceComponent = listItemShowcase;
            category: "components"
        }

        SidebarItem {
            text: "Pagination";
            icon.path: IconList.pages;
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
            icon.path: IconList.stonks;
            category: "components"
            onClicked: showcaseLoader.sourceComponent = progressShowcase;
        }

        SidebarItem {
            text: "Inputs";
            icon.path: IconList.edit;
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
            icon.path: IconList.info;
            category: "introduction"

            onClicked: showcaseLoader.sourceComponent = projectInfo;
        }

        SidebarCompactItem {
            text: "Fonts";
            icon.path: IconList.font;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = fontShowcase;
        }

        SidebarCompactItem {
            text: "Colors";
            icon.path: IconList.palette;
            onClicked: showcaseLoader.sourceComponent = colorShowcase;
            category: "components"
        }

        SidebarCompactItem {
            text: "Badge";
            icon.path: IconList.verified;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = badgeShowcase;
        }

        SidebarCompactItem {
            text: "Accordion";
            icon.path: IconList.star;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = accordionShowcase;
        }

        SidebarCompactItem {
            text: "Buttons";
            icon.path: IconList.gamepad;
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
            icon.path: IconList.alert;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = alertShowcase;
        }

        SidebarCompactItem {
            text: "List Items";
            icon.path: IconList.list;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = listItemShowcase;
        }

        SidebarCompactItem {
            text: "Pagination";
            icon.path: IconList.pages;
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
            icon.path: IconList.stonks;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = progressShowcase;
        }

        SidebarCompactItem {
            text: "Inputs";
            icon.path: IconList.edit;
            category: "components"
            model: [
                {text : "TextField", onClicked: function(){ showcaseLoader.sourceComponent = textFieldShowcase}},
                {text : "Dropdown", onClicked: function(){ showcaseLoader.sourceComponent = dropdownShowcase}}
            ];
        }
    }
}
