import QtQuick

import MMaterial

Item{
    objectName: "Textfield"
    visible: showcaseLoader.status == Loader.Ready
    ListView{
        id: listView
        spacing: 80 * Size.scale
        clip: true
        anchors {
            fill: parent
        }

        model: [
            { "type": MTextField.Type.Outlined, "name" : "Outlined" },
            { "type": MTextField.Type.Filled, "name" : "Filled" },
            { "type": MTextField.Type.Standard, "name" : "Standard" }
        ]
        delegate: Item{
            width: listView.width
            height: buttonGroup.height
            property int i: index
            TextFieldGroup{
                id: buttonGroup
                width: 1000
                type: listView.model[parent.i].type
                title: listView.model[parent.i].name
            }
        }
    }
}
