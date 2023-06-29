import QtQuick 2.15
import QtQuick.Layouts

import MMaterial

RowLayout{
    id: alertContainer
    Layout.preferredWidth: parent.width
    required property string title
    property alias itemModel: container.model
    property alias container: container
    H6{
        Layout.alignment: Qt.AlignTop
        Layout.preferredWidth: Size.scale * 120
        text: alertContainer.title
        width: parent.width
        height: Size.pixel40
        color: Theme.text.disabled
        font {
            pixelSize: Size.pixel12
            capitalization: Font.AllUppercase
        }

    }

    ListView{
        id: container
        spacing: Size.pixel8
        Layout.fillWidth: true
        Layout.preferredHeight: childrenRect.height
        interactive: false
    }
}
