import QtQuick 
import QtQuick.Layouts

import MMaterial.UI as UI

ColumnLayout {
    id: alertContainer

    required property string title

    property alias itemModel: container.model
    property alias container: container

    Layout.preferredWidth: parent.width

    spacing: UI.Size.pixel8

    UI.H6 {
        Layout.alignment: Qt.AlignTop
        Layout.minimumWidth: UI.Size.pixel10

        text: alertContainer.title
		color: UI.Theme.text.disabled

        font {
            pixelSize: UI.Size.pixel12
            capitalization: Font.AllUppercase
        }
    }

    ListView {
        id: container

        Layout.fillWidth: true
        Layout.preferredHeight: childrenRect.height

        spacing: UI.Size.pixel8
        interactive: false
    }
}
