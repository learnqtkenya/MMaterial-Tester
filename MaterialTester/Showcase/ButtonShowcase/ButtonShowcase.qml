import QtQuick

import MMaterial

Item{
    objectName: "Button"
    visible: showcaseLoader.status == Loader.Ready
    ListView{
        id: listView
        spacing: 80 * Size.scale
        clip: true
        anchors {
            fill: parent
        }

        model: [
            { "type": MButton.Type.Contained, "name" : "Contained Button" },
            { "type": MButton.Type.Outlined, "name" : "Outlined Button" },
            { "type": MButton.Type.Text, "name" : "Text Button" },
            { "type": MButton.Type.Soft, "name" : "Soft Button" },
        ]
        delegate: Item{
            width: listView.width
            height: buttonGroup.height
            property int i: index
            ButtonGroup{
                id: buttonGroup
                width: listView.width
                buttonType: listView.model[parent.i].type
                title: listView.model[parent.i].name
            }
        }
    }
}
