import QtQuick
import QtQuick.Effects
import QtQuick.Layouts

import MMaterial

Rectangle {
    property alias logo: _logo
    property alias list: _sidebarLayout
    property alias avatar: _avatar
    property alias title: _title
    property alias subtitle: _subtitle
    property alias model: _sidebarLayout.model

    implicitWidth: 280
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

    ColumnLayout{
        anchors {
            fill: parent
            margins: Size.pixel16
            topMargin: Size.pixel24
        }

        Icon{
            id: _logo
            color: Theme.primary.main
            sourceSize.height: Size.pixel32
            sourceSize.width: Size.pixel32
            Layout.leftMargin: Size.pixel8
            path: IconList.logo
        }

        Rectangle{
            Layout.leftMargin: Size.pixel4
            Layout.rightMargin: Size.pixel4
            Layout.topMargin: Size.pixel32
            Layout.preferredHeight: 72 * Size.scale
            Layout.fillWidth: true

            radius: 12
            color: Theme.background.neutral

            Avatar{
                id: _avatar

                anchors{
                    left: parent.left; leftMargin: Size.pixel20;
                    top: parent.top; topMargin: Size.pixel16;
                    bottom: parent.bottom; bottomMargin: Size.pixel16
                }

                height: Size.pixel40
                width: Size.pixel40

                title: _title.text
            }

            Subtitle2{
                id: _title

                anchors{
                    left: _avatar.right; leftMargin: Size.pixel16;
                    top: parent.top; topMargin: Size.pixel16;
                    right: parent.right; rightMargin: Size.pixel20;
                }

                text: "John Doe"
                maximumLineCount: 1
                elide: Text.ElideRight
                color: Theme.text.primary
            }

            B2{
                id: _subtitle

                anchors {
                    left: _avatar.right; leftMargin: Size.pixel16;
                    bottom: parent.bottom; bottomMargin: Size.pixel16;
                    right: parent.right; rightMargin: Size.pixel20;
                }

                verticalAlignment: Qt.AlignBottom
                text: "Admin"
                color: Theme.text.disabled
                maximumLineCount: 1
            }
        }

        ListView {
            id: _sidebarLayout

            Layout.topMargin: Size.pixel16
            Layout.fillHeight: true;
            Layout.fillWidth: true

            spacing: Size.pixel4
            clip: true

            section {
                property: "category"
                delegate: SidebarCategoryLabel{
                    required property string section
                    text: section
                }
            }
        }
    }
}
