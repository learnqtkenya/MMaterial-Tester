import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import MMaterial

Flickable {
    objectName: "Typography"

    contentHeight: _mainLayout.implicitHeight
    contentWidth: width

    ScrollIndicator.vertical: MScrollIndicator{}

    ColumnLayout {
        id: _mainLayout

        anchors.fill: parent

        Overline { text: qsTr("Tabs - No responsiveness yet"); color: Theme.text.disabled }

        Overline { text: qsTr("Text Tabs"); color: Theme.text.disabled; Layout.topMargin: Size.pixel30 }
        MTabs {
            Layout.fillWidth: true
            Layout.preferredHeight: Size.pixel48

            model: ObjectModel {

                MTabButton {
                    text: "Text 1"
                }
                MTabButton {
                    text: "Longer text 1"
                }
                MTabButton {
                    text: "Text 2"
                }
                MTabButton {
                    text: "Really long text this time 2"
                }
            }
        }

        Overline { text: qsTr("Left icon + text"); color: Theme.text.disabled; Layout.topMargin: Size.pixel20 }
        MTabs {
            Layout.fillWidth: true
            Layout.preferredHeight: Size.pixel48

            model: ObjectModel {

                MTabButton {
                    text: "Icon tab 1"
                    leftIcon.iconData: Icons.heavy.logo
                }
                MTabButton {
                    text: "Icon tab 2"
                    leftIcon.iconData: Icons.heavy.logo
                }
                MTabButton {
                    text: "Icon tab 3"
                    leftIcon.iconData: Icons.heavy.logo
                }
                MTabButton {
                    text: "Icon tab 4"
                    leftIcon.iconData: Icons.heavy.logo
                }
            }
        }

        Overline { text: qsTr("Right icon + text"); color: Theme.text.disabled; Layout.topMargin: Size.pixel20 }
        MTabs {
            Layout.fillWidth: true
            Layout.preferredHeight: Size.pixel48

            model: ObjectModel {

                MTabButton {
                    text: "Icon tab 1"
                    rightIcon.iconData: Icons.heavy.logo
                }
                MTabButton {
                    text: "Icon tab 2"
                    rightIcon.iconData: Icons.heavy.logo
                }
                MTabButton {
                    text: "Icon tab 3"
                    rightIcon.iconData: Icons.heavy.logo
                }
                MTabButton {
                    text: "Icon tab 4"
                    rightIcon.iconData: Icons.heavy.logo
                }
            }
        }

        Overline { text: qsTr("Right icon + left icon + text"); color: Theme.text.disabled; Layout.topMargin: Size.pixel20 }
        MTabs {
            Layout.fillWidth: true
            Layout.preferredHeight: Size.pixel48

            model: ObjectModel {

                MTabButton {
                    text: "Icon tab 1"
                    rightIcon.iconData: Icons.heavy.logo
                    leftIcon.iconData: Icons.heavy.logo
                }
                MTabButton {
                    text: "Icon tab 2"
                    rightIcon.iconData: Icons.heavy.logo
                    leftIcon.iconData: Icons.heavy.logo
                }
                MTabButton {
                    text: "Icon tab 3"
                    rightIcon.iconData: Icons.heavy.logo
                    leftIcon.iconData: Icons.heavy.logo
                }
                MTabButton {
                    text: "Icon tab 4"
                    rightIcon.iconData: Icons.heavy.logo
                    leftIcon.iconData: Icons.heavy.logo
                }
            }
        }

        Item { Layout.fillHeight: true; }
    }
}
