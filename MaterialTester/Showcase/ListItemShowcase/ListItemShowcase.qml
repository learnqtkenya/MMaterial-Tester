import QtQuick
import QtQuick.Layouts
import MMaterial

ColumnLayout {
    objectName: "List Items"

    visible: showcaseLoader.status == Loader.Ready
    spacing: Size.pixel22

    Overline {
        Layout.fillWidth: true

        text: "List Item"
        color: Theme.text.disabled
        font.capitalization: Font.AllUppercase
    }

    GridLayout {
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignTop

        rowSpacing: Size.pixel22
        columnSpacing: Size.pixel22

        columns: Window.width > 1300 * Size.scale ? 3 : (Window.width > 900 * Size.scale ? 2 : 1)

        ListBorders {
            id: _plainListView

            Layout.alignment: Qt.AlignTop

            listView {
                model: 4

                delegate: ListItem {
                    width: _plainListView.listView.width
                    text: "List Item " + index
                }
            }
        }


        ListBorders {
            id: _iconListView

            Layout.alignment: Qt.AlignTop

            listView.model: _iconObjectModel

            ObjectModel {
                id: _iconObjectModel

                ListItem { width: _iconListView.listView.width; text: "List Item"; icon.path: IconList.alert }
                ListItem { width: _iconListView.listView.width; text: "List Item"; icon.path: IconList.mail }
                ListItem { width: _iconListView.listView.width; text: "List Item"; icon.path: IconList.stonks }
                ListItem { width: _iconListView.listView.width; text: "List Item"; icon.path: IconList.logo }
            }
        }

        ListBorders {
            id: _advancedListView

            Layout.alignment: Qt.AlignTop

            listView.model: _advancedObjectModel

            ObjectModel {
                id: _advancedObjectModel

                ListItem {
                    width: _iconListView.listView.width; text: "List Item"; icon.path: IconList.alert;
                    containsMouse: mouseArea.containsMouse || _button1.mouseArea.containsMouse
                    MButton { id: _button1; size: Size.Grade.M;  }
                }

                ListItem {
                    width: _iconListView.listView.width; text: "List Item"; icon.path: IconList.mail;
                    containsMouse: mouseArea.containsMouse || _button2.mouseArea.containsMouse
                    MButton { id: _button2; size: Size.Grade.M; type: MButton.Type.Outlined }
                }

                ListItem {
                    width: _iconListView.listView.width; text: "List Item"; icon.path: IconList.stonks;
                    containsMouse: mouseArea.containsMouse || _button3.mouseArea.containsMouse
                    MButton { id: _button3; size: Size.Grade.M }
                }

                ListItem {
                    width: _iconListView.listView.width; text: "List Item"; icon.path: IconList.logo;
                    containsMouse: mouseArea.containsMouse || _button4.mouseArea.containsMouse
                    MButton { id: _button4; size: Size.Grade.M; type: MButton.Type.Outlined }
                }
            }
        }
    }

    Overline {
        Layout.fillWidth: true
        Layout.topMargin: Size.pixel32

        text: "List Item Contact"
        color: Theme.text.disabled
        font.capitalization: Font.AllUppercase
    }

    ListBorders {
        id: _avatarList

        property real delegateHeight: 68 * Size.scale

        listView {
            model: _avatarObjectModel
            delegate: ListItemContact{}
        }

        ObjectModel {
            id: _avatarObjectModel

            ListItemContact { width: _avatarList.listView.width; title: "John Doe"; subtitle: "johhny_doe@gmail.com"; enabled: false; }
            ListItemContact { width: _avatarList.listView.width; title: "Susan Banks"; subtitle: "susan_banks11@gmail.com"; avatar.accent: Theme.info; }
            ListItemContact { width: _avatarList.listView.width; title: "Jeremy Hill"; subtitle: "jeremy99@gmail.com"; avatar.accent: Theme.warning; }
            ListItemContact { width: _avatarList.listView.width; title: "Karen Johnson"; subtitle: "karen_j@gmail.com"; avatar.accent: Theme.error; }
            ListItemContact { width: _avatarList.listView.width; title: "Tom Scott"; subtitle: "scotty1980@gmail.com"; avatar.accent: Theme.secondary; }
        }
    }

    Item { Layout.fillHeight: true; }
}
