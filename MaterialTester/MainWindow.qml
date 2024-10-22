import QtQuick
import QtQuick.Controls.Material
import QtQuick.Layouts

import MMaterial

import "./Showcase"
import "./Showcase/ColorShowcase"
import "./Showcase/IconShowcase"
import "./Showcase/ButtonShowcase"
import "./Showcase/AlertShowcase"
import "./Showcase/ListItemShowcase"
import "./Showcase/PaginationShowcase"
import "./Showcase/TextFieldShowcase"
import "./Showcase/TabShowcase"
import "./Showcase/ChartShowcase"

import "./Components/AppSettings"
import "./Components/Sidebar"

Rectangle {
    id: _root


    function setSizeFormat() {
        if (Window.width <= Window.height / 2) {
            Size.format = Size.Format.Mobile
        }
        else if (Window.width > Window.height) {
            Size.format = Size.Format.Extended
        } else {
            Size.format = Size.Format.Compact
        }
    }

    color: Theme.background.main

    onWidthChanged: Qt.callLater(_root.setSizeFormat)
    onHeightChanged: Qt.callLater(_root.setSizeFormat)

    RowLayout {
        id: header

        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
        }

        height: 56 * Size.scale
        width: parent.width * 0.95

        spacing: Size.pixel14

        H6 {
            Layout.fillWidth: true

            text: showcaseLoader.currentItem ? showcaseLoader.currentItem.objectName : ""
            color: Theme.main.p500
            font.capitalization: Font.AllUppercase
        }

        Icon {
            iconData: Icons.light.settings
            size: header.height / 2
            interactive: true
            color: Theme.text.secondary

            onClicked: appSettings.toggle();
        }
    }

    Rectangle {
        anchors.bottom: _root.bottom

        height: 1
        width: _root.width

        color: Theme.other.divider
    }

    MLoader {
        id: showcaseLoader
        objectName: "Main Loader"

        asynchronous: true
        sourceComponent: placeholder
    }

    Component { id: placeholder; Placeholder{ } }
    Component { id: projectInfo; ProjectInfo{ } }
    Component { id: iconShowcase; IconShowcase{ } }
    Component { id: fontShowcase; FontShowcase{ } }
    Component { id: colorShowcase; ColorShowcase{ } }
    Component { id: badgeShowcase; BadgeShowcase{ } }
    Component { id: accordionShowcase; AccordionShowcase{ } }
    Component { id: alertShowcase; AlertShowcase{ } }
    Component { id: listItemShowcase; ListItemShowcase{ } }
    Component { id: progressShowcase; ProgressShowcase{ } }
    Component { id: textFieldShowcase; TextFieldShowcase{ } }
    Component { id: dropdownShowcase; DropdownShowcase{ } }
    Component { id: sliderShowcase; SliderShowcase{ } }
    Component { id: rectangleShowcase; RectangleShowcase{ } }
    Component { id: menuShowcase; MenuShowcase{ } }
    Component { id: avatarShowcase; AvatarShowcase{ } }
    Component { id: dialogShowcase; DialogShowcase{ } }
    Component { id: dateTimeShowcase; DateTimeShowcase{ } }

    // Charts
    Component { id: barChartShowcase; BarChartShowcase{ } }
    Component { id: waterfallChartShowcase; WaterfallChartShowcase{ } }

    // Buttons
    Component { id: buttonShowcase; ButtonShowcase{  } }
    Component { id: toggleButtonShowcase; ToggleButtonShowcase{ } }
    Component { id: fabButtonShowcase; FabButtonShowcase{ } }
    Component { id: checkboxShowcase; CheckboxShowcase{ } }
    Component { id: radioButtonShowcase; RadioButtonShowcase{ } }
    Component { id: switchShowcase; SwitchShowcase{ } }
    Component { id: tabShowcase; TabShowcase{ } }

    // Pagination
    Component { id: paginationShowcase; PaginationShowcase{ } }
    Component { id: paginationArrowsShowcase; PaginatorArrowsShowcase{ } }
    Component { id: paginationBubbleShowcase; PaginatorBubbleShowcase{ } }
    Component { id: paginationSimpleShowcase; PaginatorSimpleShowcase{ } }

    AppSettings {
        id: appSettings
    }

    SimpleSidebar {
        id: sidebar

        mainView: showcaseLoader
    }

    AlertController {
        id: alertsController

        width: parent.width > 400 ? 400 * Size.scale : parent.width * 0.9
        edgeOf: Item.BottomRight
    }
}

