import QtQuick 
import QtQuick.Layouts

import MMaterial

ColumnLayout {
    id: alertContainer

    required property string title

    property alias itemModel: container.model
    property alias container: container

    Layout.preferredWidth: parent.width

    spacing: Size.pixel8

    H6 {
        Layout.alignment: Qt.AlignTop
        Layout.minimumWidth: Size.pixel10

        text: alertContainer.title
        color: Theme.text.disabled

        font {
            pixelSize: Size.pixel12
            capitalization: Font.AllUppercase
        }
    }

    ListView {
        id: container

        Layout.fillWidth: true
        Layout.preferredHeight: childrenRect.height

        spacing: Size.pixel8
        interactive: false
    }
}
