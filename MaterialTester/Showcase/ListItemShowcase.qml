pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

import MMaterial.UI as UI
import MMaterial.Controls as Controls
import MMaterial.Media as Media

ColumnLayout {
    objectName: "List Items"

    spacing: UI.Size.pixel22

	UI.Overline {
        Layout.fillWidth: true

        text: "List Item"
		color: UI.Theme.text.disabled
        font.capitalization: Font.AllUppercase
    }

    GridLayout {
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignTop

        rowSpacing: UI.Size.pixel22
        columnSpacing: UI.Size.pixel22

        columns: Window.width > 1300 * UI.Size.scale ? 3 : (Window.width > 900 * UI.Size.scale ? 2 : 1)

        ListBorders {
            id: _plainListView

            Layout.alignment: Qt.AlignTop

            listView {
                model: 4

				delegate: Controls.ListItem {
					required property int index

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

				Controls.ListItem { width: _iconListView.listView.width; text: "List Item"; icon.iconData: Media.Icons.light.warning }
				Controls.ListItem { width: _iconListView.listView.width; text: "List Item"; icon.iconData: Media.Icons.light.mail }
				Controls.ListItem { width: _iconListView.listView.width; text: "List Item"; icon.iconData: Media.Icons.light.power }
				Controls.ListItem { width: _iconListView.listView.width; text: "List Item"; icon.iconData: Media.Icons.heavy.logo }
            }
        }

        ListBorders {
            id: _advancedListView

            Layout.alignment: Qt.AlignTop

            listView.model: _advancedObjectModel

            ObjectModel {
                id: _advancedObjectModel

				Controls.ListItem {
					width: _iconListView.listView.width; text: "List Item"; icon.iconData: Media.Icons.light.warning;
                    containsMouse: mouseArea.containsMouse || _button1.mouseArea.containsMouse
					Controls.MButton { id: _button1; size: UI.Size.Grade.M;  }
                }

				Controls.ListItem {
					width: _iconListView.listView.width; text: "List Item"; icon.iconData: Media.Icons.light.mail;
                    containsMouse: mouseArea.containsMouse || _button2.mouseArea.containsMouse
					Controls.MButton { id: _button2; size: UI.Size.Grade.M; type: Controls.MButton.Type.Outlined }
                }

				Controls.ListItem {
					width: _iconListView.listView.width; text: "List Item"; icon.iconData: Media.Icons.light.power;
                    containsMouse: mouseArea.containsMouse || _button3.mouseArea.containsMouse
					Controls.MButton { id: _button3; size: UI.Size.Grade.M }
                }

				Controls.ListItem {
					width: _iconListView.listView.width; text: "List Item"; icon.iconData: Media.Icons.heavy.logo;
                    containsMouse: mouseArea.containsMouse || _button4.mouseArea.containsMouse
					Controls.MButton { id: _button4; size: UI.Size.Grade.M; type: Controls.MButton.Type.Outlined }
                }
            }
        }
    }

	UI.Overline {
        Layout.fillWidth: true
        Layout.topMargin: UI.Size.pixel32

        text: "List Item Contact"
		color: UI.Theme.text.disabled
        font.capitalization: Font.AllUppercase
    }

    ListBorders {
        id: _avatarList

        property real delegateHeight: 68 * UI.Size.scale

        listView {
            model: _avatarObjectModel
			delegate: Controls.ListItemContact{}
        }

        ObjectModel {
            id: _avatarObjectModel

			Controls.ListItemContact { width: _avatarList.listView.width; title: "John Doe"; subtitle: "johhny_doe@gmail.com"; enabled: false; }
			Controls.ListItemContact { width: _avatarList.listView.width; title: "Susan Banks"; subtitle: "susan_banks11@gmail.com"; avatar.accent: UI.Theme.info; }
			Controls.ListItemContact { width: _avatarList.listView.width; title: "Jeremy Hill"; subtitle: "jeremy99@gmail.com"; avatar.accent: UI.Theme.warning; }
			Controls.ListItemContact { width: _avatarList.listView.width; title: "Karen Johnson"; subtitle: "karen_j@gmail.com"; avatar.accent: UI.Theme.error; }
			Controls.ListItemContact { width: _avatarList.listView.width; title: "Tom Scott"; subtitle: "scotty1980@gmail.com"; avatar.accent: UI.Theme.secondary; }
        }
    }

    Item { Layout.fillHeight: true; }
}
