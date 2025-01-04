import QtQuick 
import QtQuick.Layouts

import MMaterial.UI as UI

RowLayout {
    default property alias container: _grid.data
    property alias title: _title
    property alias grid: _grid

    Layout.topMargin: UI.Size.pixel40
    Layout.preferredWidth: parent.width

    spacing: UI.Size.pixel20

    UI.Overline {
        id: _title

        Layout.alignment: Qt.AlignLeft | Qt.AlignTop
        Layout.topMargin: UI.Size.pixel10
        Layout.maximumWidth: 120 * UI.Size.scale
        Layout.minimumWidth: UI.Size.pixel10
        Layout.preferredWidth: Window.width * 0.08
        Layout.rightMargin: 20 * UI.Size.scale

        color: UI.Theme.text.disabled
        font.capitalization: Font.AllUppercase
        visible: Window.width > 440
    }

    GridLayout {
        id: _grid

        Layout.fillWidth: true
        Layout.preferredHeight: childrenRect.height

        columns: Window.width > 1300 * UI.Size.scale ? 6 : (Window.width > 900 * UI.Size.scale ? 3 : (Window.width > 500 * UI.Size.scale ? 2 : 1))

        rowSpacing: UI.Size.pixel40
        columnSpacing: UI.Size.pixel40
    }

    Item { Layout.fillWidth: true; }
}
