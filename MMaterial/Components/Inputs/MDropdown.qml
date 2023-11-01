import QtQuick 
import QtQuick.Controls

import MMaterial

MTextField {
    id: _dropdown

    property var model: ["Label 1", "Label 2", "Label 3"]
    property alias delegate: _repeater.delegate
    property int delegateCount: 5

    function toggle(){
        if(_contextMenu.opened)
            _contextMenu.close();
        else
            _contextMenu.open();
    }

    showPlaceholder: !input.focus && input.text === "" && !_contextMenu.opened

    type: MTextField.Type.Outlined
    hoverHandler: _hoverHandler

    rightIcon {
        path: IconList.arrow
        onClicked: _dropdown.toggle();
    }

    input {
        enabled: false
        readOnly: true
        text: _listView.currentItem ? _listView.currentItem.text : ""
    }

    TapHandler{
        id: _tapHandler

        onTapped: _dropdown.toggle();
    }
    HoverHandler{
        id: _hoverHandler

        cursorShape: Qt.PointingHandCursor
    }

    Menu {
        id: _contextMenu

        y: _dropdown.height + 1
        closePolicy: Menu.CloseOnEscape | Menu.CloseOnReleaseOutsideParent

        Repeater {
            id: _repeater

            model: _dropdown.model

            delegate: ListItem {
                text: modelData
                width: _listView.width
                onClicked: {
                    _contextMenu.close();
                }
            }
        }

        background: Rectangle {
            implicitWidth: _dropdown.width

            radius: 12
            color: Theme.background.main
            border.color: Theme.action.disabledBackground
        }

        contentItem: Item {
            implicitHeight: _listView.height + Size.pixel8

            ListView {
                id: _listView

                anchors.centerIn: parent

                width: parent.width - Size.pixel8
                height: count > _dropdown.delegateCount ? _dropdown.delegateCount * Size.pixel46 : contentHeight

                model: _contextMenu.contentModel

                clip: true
                currentIndex: _contextMenu.currentIndex

                ScrollIndicator.vertical: ScrollIndicator {}
            }
        }
    }
}
