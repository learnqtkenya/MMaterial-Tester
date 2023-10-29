import QtQuick 
import QtQuick.Layouts

import MMaterial

AbstractListItem{
    id: _listItem

    default property alias container: _mainLayout.data

    property alias text: _title.text
    property alias icon: _icon
    property alias layout: _mainLayout

    height: Size.pixel46

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
