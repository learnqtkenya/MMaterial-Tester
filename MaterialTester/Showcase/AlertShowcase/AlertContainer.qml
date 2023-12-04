import QtQuick 
import QtQuick.Layouts

import MMaterial

RowLayout {
    id: alertContainer

    required property string title

    property alias itemModel: container.model
    property alias container: container

    Layout.preferredWidth: parent.width

    H6 {
        Layout.alignment: Qt.AlignTop
        Layout.maximumWidth: 120 * Size.scale
        Layout.minimumWidth: Size.pixel10
        Layout.preferredWidth: Window.width * 0.08

        width: parent.width
        height: Size.pixel40

        text: alertContainer.title
        color: Theme.text.disabled
        visible: Window.width > 600

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
