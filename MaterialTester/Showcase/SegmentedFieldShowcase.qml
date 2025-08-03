pragma ComponentBehavior: Bound

import QtQuick
import MMaterial.UI as UI
import MMaterial.Controls.Inputs as Inputs

Item {
    objectName: "SegmentedField"

    ListView {
        id: listView

        anchors.fill: parent

        spacing: 80 * UI.Size.scale
        clip: true

        model: [
            { "type": Inputs.TextField.Type.Outlined, "name" : "Outlined" },
            { "type": Inputs.TextField.Type.Filled, "name" : "Filled" },
            { "type": Inputs.TextField.Type.Standard, "name" : "Standard" }
        ]

        delegate: Item {
            id: del

            required property int index

            width: listView.width
            height: segmentedFieldGroup.height

            SegmentedFieldGroup {
                id: segmentedFieldGroup

                width: parent.width

                type: listView.model[del.index].type
                title: listView.model[del.index].name
            }
        }
    }
}
