import QtQuick 2.15
import QtQuick.Layouts

import "../Settings"
import "../Icons"
import "../Colors"
import "../Fonts/Texts"
import "../Fonts"

AbstractListItem{
    id: _listItem
    height: Size.pixel46

    default property alias container: _mainLayout.data
    property alias text: _title.text
    property alias icon: _icon
    property alias layout: _mainLayout

    RowLayout{
        id: _mainLayout
        anchors{
            fill: parent
            leftMargin: Size.pixel16; rightMargin: Size.pixel12
        }
        Icon{
            id: _icon
            Layout.rightMargin: Size.pixel16
            Layout.alignment: Qt.AlignVCenter
            color: _title.color
            visible: path != ""
        }

        B2{
            id: _title
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            verticalAlignment: Qt.AlignVCenter
            font.family: _listItem.selected ? PublicSans.semiBold : PublicSans.regular
            color: _listItem.selected ? Theme.text.primary : Theme.text.secondary
        }
    }
}
