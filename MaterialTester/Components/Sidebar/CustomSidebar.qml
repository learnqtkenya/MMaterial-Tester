import QtQuick
import QtQuick.Layouts

import MMaterial

// Same as custom sidebar but more flexible for changes, by using objectModel

Sidebar {
    name: "John Doe"
    role: "Admin"

    extendedSidebar.list.currentIndex: -1;
    compactSidebar.list.currentIndex: -1;

    extendedSidebar.model: ObjectModel {
        id: extendedModel

        SidebarExtendedItem {
            text: "Project";
            icon.iconData: Icons.light.info;
            category: "introduction"

            onClicked: showcaseLoader.sourceComponent = projectInfo;
        }

        SidebarExtendedItem {
            text: "Icons";
            icon.iconData: Icons.heavy.logo;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = iconShowcase;
        }

        SidebarExtendedItem {
            text: "Fonts";
            icon.iconData: Icons.light.font;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = fontShowcase;
        }

        SidebarExtendedItem {
            text: "Colors";
            icon.iconData: Icons.light.palette;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = colorShowcase;
        }

        SidebarExtendedItem {
            text: "Badge";
            icon.iconData: Icons.light.verified;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = badgeShowcase;
        }

        SidebarExtendedItem {
            text: "Accordion";
            icon.iconData: Icons.light.star;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = accordionShowcase;
        }

        SidebarExtendedItem {
            text: "Buttons";
            icon.iconData: Icons.light.gamepad;
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

        SidebarExtendedItem {
            text: "Alerts";
            icon.iconData: Icons.light.warning;
            onClicked: showcaseLoader.sourceComponent = alertShowcase;
            category: "components"
        }

        SidebarExtendedItem {
            text: "List Items";
            icon.iconData: Icons.light.list;
            onClicked: showcaseLoader.sourceComponent = listItemShowcase;
            category: "components"
        }

        SidebarExtendedItem {
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

        SidebarExtendedItem {
            text: "Progress";
            icon.iconData: Icons.light.power;
            category: "components"
            onClicked: showcaseLoader.sourceComponent = progressShowcase;
        }

        SidebarExtendedItem {
            text: "Inputs";
            icon.iconData: Icons.light.edit;
            category: "components"
            model: [
                {text : "TextField", onClicked: function(){ showcaseLoader.sourceComponent = textFieldShowcase}},
                {text : "Dropdown", onClicked: function(){ showcaseLoader.sourceComponent = dropdownShowcase}}
            ];
        }

        SidebarExtendedItem {
            text: "Slider";
            icon.iconData: Icons.light.power;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = sliderShowcase;
        }

        SidebarExtendedItem {
            text: "Rectangle";
            icon.iconData: Icons.light.power;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = rectangleShowcase;
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
            text: "Icons";
            icon.iconData: Icons.heavy.logo;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = iconShowcase;
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
                {text : "Switch", onClicked: function(){ showcaseLoader.sourceComponent = switchShowcase }},
                {text : "Tab", onClicked: function(){ showcaseLoader.sourceComponent = tabShowcase }}
            ];
        }

        SidebarCompactItem {
            text: "Alerts";
            icon.iconData: Icons.light.warning;
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
            icon.iconData: Icons.light.power;
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

        SidebarCompactItem {
            text: "Slider";
            icon.iconData: Icons.light.power;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = sliderShowcase;
        }

        SidebarCompactItem {
            text: "Rectangle";
            icon.iconData: Icons.light.power;
            category: "components"

            onClicked: showcaseLoader.sourceComponent = rectangleShowcase;
        }
    }
}
