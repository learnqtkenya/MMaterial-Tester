import QtQuick

import MMaterial

Item {
    objectName: "Button"

    ListView {
        id: listView

        anchors.fill: parent

        spacing: 80 * Size.scale
        clip: true

        model: [
            { "type": MButton.Type.Contained, "name" : "Contained Button" },
            { "type": MButton.Type.Outlined, "name" : "Outlined Button" },
            { "type": MButton.Type.Text, "name" : "Text Button" },
            { "type": MButton.Type.Soft, "name" : "Soft Button" },
        ]

        delegate: Item {

            property int i: index

            width: listView.width
            height: buttonGroup.height

            ButtonGroup {
                id: buttonGroup

                width: listView.width

                buttonType: listView.model[parent.i].type
                title: listView.model[parent.i].name
            }
        }
    }
}
