import QtQuick
import QtQuick.Layouts

import MMaterial

// Compared to CustomSidebar, it's less work but less customizability aswell

Sidebar {
    name: "John Doe"
    role: "Admin"

    SidebarItem {
        text: "Project";
        icon: Icons.light.info;
        category: "introduction"

        onClicked: () => { showcaseLoader.sourceComponent = projectInfo }
    }

    SidebarItem {
        text: "Core";
        icon: Icons.light.dashboard;
        category: "components"

        model: [
            {text : "Icons", onClicked: function(){ showcaseLoader.sourceComponent = iconShowcase}},
            {text : "Fonts", onClicked: function(){ showcaseLoader.sourceComponent = fontShowcase}},
            {text : "Colors", onClicked: function(){ showcaseLoader.sourceComponent = colorShowcase }},
        ];
    }

    SidebarItem {
        text: "Buttons";
        icon: Icons.light.sportsEsports;
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
        text: "Pagination";
        icon: Icons.light.fastForward;
        category: "components"
        model: [
            {text : "Basic", onClicked: function(){ showcaseLoader.sourceComponent = paginationShowcase }},
            {text : "Simple", onClicked: function(){ showcaseLoader.sourceComponent = paginationSimpleShowcase }},
            {text : "Bubble", onClicked: function(){ showcaseLoader.sourceComponent = paginationBubbleShowcase }},
            {text : "Arrows", onClicked: function(){ showcaseLoader.sourceComponent = paginationArrowsShowcase }}
        ];
    }

    SidebarItem {
        text: "Controls";
        icon: Icons.light.category;
        category: "components"
        model: [
            {text : "ListItems", onClicked: function(){ showcaseLoader.sourceComponent = listItemShowcase}},
            {text : "Progress", onClicked: function(){ showcaseLoader.sourceComponent = progressShowcase}},
            {text : "TextField", onClicked: function(){ showcaseLoader.sourceComponent = textFieldShowcase }},
            {text : "Dropdown", onClicked: function(){ showcaseLoader.sourceComponent = dropdownShowcase }},
            {text : "Slider", onClicked: function(){ showcaseLoader.sourceComponent = sliderShowcase }},
            {text : "Menu", onClicked: function(){ showcaseLoader.sourceComponent = menuShowcase }},
            {text : "Date Picker", onClicked: function(){ showcaseLoader.sourceComponent = dateShowcase }},
            {text : "Time Picker", onClicked: function(){ showcaseLoader.sourceComponent = timeShowcase }},
            {text : "Color Picker", onClicked: function(){ showcaseLoader.sourceComponent = colorPickerShowcase }}
        ];
    }

    SidebarItem {
        text: "Notifications";
        icon: Icons.light.send;
        category: "components"
        model: [
            {text : "Alerts", onClicked: function(){ showcaseLoader.sourceComponent = alertShowcase}},
            {text : "Dialogs", onClicked: function(){ showcaseLoader.sourceComponent = dialogShowcase}},
        ];
    }

    SidebarItem {
        text: "Charts";
        icon: Icons.light.barChart;
        category: "components"
        model: [
            {text : "Bar Chart", onClicked: function(){ showcaseLoader.sourceComponent = barChartShowcase}},
            {text : "Waterfall Chart", onClicked: function(){ showcaseLoader.sourceComponent = waterfallChartShowcase}},
        ];
    }

    SidebarItem {
        text: "Other";
        icon: Icons.light.atr;
        category: "components"

        chip {
            text: qsTr("New")
            accent: Theme.info
        }

        model: [
            {text : "Badge", onClicked: function(){ showcaseLoader.sourceComponent = badgeShowcase}},
            {text : "Accordion", onClicked: function(){ showcaseLoader.sourceComponent = accordionShowcase}},
            {text : "Avatar", onClicked: function(){ showcaseLoader.sourceComponent = avatarShowcase }, "chip" : Qt.platform.os === "windows" ? { "text" : qsTr("Non-WASM"), "accent": Theme.warning } : null},
            {text : "Rectangle", onClicked: function(){ showcaseLoader.sourceComponent = rectangleShowcase }},
            {text : "BusyIndicator", onClicked: function(){ showcaseLoader.sourceComponent = busyIndicatorShowcase }}
        ];
    }
}
