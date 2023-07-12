import QtQuick
import QtQuick.Effects
import QtQuick.Layouts

import MMaterial

Rectangle {
    width: 86 * Size.scale
    height: parent.height
    color: Theme.background.main

    property alias logo: _logo
    property alias list: _sidebarLayout
    default property alias container: _sidebarLayout.data
    property alias model: _sidebarLayout.model

    ColumnLayout{
        anchors {
            fill: parent
            margins: Size.pixel6
            topMargin: Size.pixel24
        }

        Icon{
            id: _logo
            color: Theme.primary.main
            sourceSize.height: Size.pixel32
            sourceSize.width: Size.pixel32
            Layout.alignment: Qt.AlignHCenter
            path: IconList.logo
        }

        ListView {
            id: _sidebarLayout
            spacing: Size.pixel4
            Layout.topMargin: Size.pixel16
            Layout.fillHeight: true;
            Layout.fillWidth: true
            section.property: "category"
            clip: true
            section.delegate: SidebarSeparator{
                required property string section
            }

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
