pragma ComponentBehavior: Bound

import QtQuick 

import MMaterial.UI as UI
import MMaterial.Controls as Controls

Rectangle {
    objectName: "Accordion"

	color: UI.Theme.background.main

    ListView {
        id: listview

        anchors.fill: parent

        model: 5
        spacing: UI.Size.pixel8

		delegate: Controls.Accordion {
			required property int index

            width: listview.width

            title: "Accordion " + index
            subtitle: "Donec id justo. Curabitur blandit mollis lacus. Vivamus quis mi. In ut quam vitae odio lacinia tincidunt. In consectetuer turpis ut velit."
        }
    }
}
