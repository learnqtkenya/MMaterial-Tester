import QtQuick 2.15
import MMaterial
import QtQuick.Layouts
import QtQuick.Effects
Rectangle {
    objectName: "Accordion"
    color: Theme.background.main

    ListView{
        id: listview
        anchors{
            fill: parent
            margins: Size.scale * 50
        }
        model: 5
        spacing: Size.pixel8
        delegate: Accordion{
            width: listview.width
            title: "Accordion " + index
            subtitle: "Donec id justo. Curabitur blandit mollis lacus. Vivamus quis mi. In ut quam vitae odio lacinia tincidunt. In consectetuer turpis ut velit."
        }
    }
}
