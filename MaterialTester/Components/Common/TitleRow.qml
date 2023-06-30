import QtQuick 2.15
import QtQuick.Layouts

import MMaterial

RowLayout{
    Layout.topMargin: Size.pixel40
    Layout.preferredWidth: parent.width
    spacing: Size.pixel20

    property string title: ""
    Overline{
        text: parent.title
        color: Theme.text.disabled
        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
        Layout.preferredWidth: 120 * Size.scale
        Layout.rightMargin: 20 * Size.scale
        font.capitalization: Font.AllUppercase
    }
}
