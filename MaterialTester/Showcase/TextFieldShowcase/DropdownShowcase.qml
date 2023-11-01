import QtQuick

import MMaterial

Item {
    objectName: "Dropdown"
    visible: showcaseLoader.status == Loader.Ready

    ListView {
        id: listView

        anchors.fill: parent

        spacing: 80 * Size.scale
        clip: true

        model: [
            { "type": MTextField.Type.Outlined, "name" : "Outlined" },
            { "type": MTextField.Type.Filled, "name" : "Filled" },
            { "type": MTextField.Type.Standard, "name" : "Standard" }
        ]

        delegate: Item {
            property int i: index

            width: listView.width
            height: buttonGroup.height

            DropdownGroup {
                id: buttonGroup

                width: 1000

                type: listView.model[parent.i].type
                title: listView.model[parent.i].name
            }
        }
    }
}
