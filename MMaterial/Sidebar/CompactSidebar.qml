import QtQuick
import QtQuick.Effects
import QtQuick.Layouts

import MMaterial

Rectangle {
    id: _root

    default property alias container: _sidebarLayout.data

    property alias logo: _logo
    property alias list: _sidebarLayout
    property alias model: _sidebarLayout.model

    implicitWidth: 86 * Size.scale
    implicitHeight: parent.height

    color: Theme.background.main

    layer{
        enabled: true
        effect: MultiEffect{
            shadowEnabled: true
            shadowBlur: 3
            shadowHorizontalOffset: 2
            shadowVerticalOffset: 5
        }
    }

    ColumnLayout {
        anchors {
            fill: _root
            margins: Size.pixel6
            topMargin: Size.pixel24
        }

        Icon {
            id: _logo

            Layout.alignment: Qt.AlignHCenter

            size: Size.pixel32

            color: Theme.primary.main
            iconData: Icons.heavy.logo
        }

        ListView {
            id: _sidebarLayout

            Layout.topMargin: Size.pixel16
            Layout.fillHeight: true;
            Layout.fillWidth: true

            spacing: Size.pixel4
            section.property: "category"
            clip: true

            section.delegate: SidebarSeparator{
                required property string section
            }

            delegate: SidebarCompactItem {
                id: _delegate

                property SidebarItem data: _root.model[index]

                text: _delegate.data.text;
                icon.iconData: _delegate.data.icon
                category: _delegate.data.category
                model: _delegate.data.model ?? []

                onClicked: typeof _delegate.data.onClicked === "function" ? _delegate.data.onClicked() : () => {}
            }
        }
    } 
}
