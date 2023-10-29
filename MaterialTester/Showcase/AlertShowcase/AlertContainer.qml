import QtQuick 
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
        Layout.maximumWidth: 120 * Size.scale
        Layout.minimumWidth: Size.pixel10
        Layout.preferredWidth: Window.width * 0.08
        text: alertContainer.title
        width: parent.width
        height: Size.pixel40
        color: Theme.text.disabled
        visible: Window.width > 600
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
