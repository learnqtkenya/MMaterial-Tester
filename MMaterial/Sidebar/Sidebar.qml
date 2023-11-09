import QtQuick
import QtQuick.Effects
import QtQuick.Layouts

import MMaterial

Rectangle {
    id: _root

    default property list<SidebarItem> sidebarItems

    property string name
    property string role

    property alias extendedSidebar: _extendedSidebar
    property alias compactSidebar: _compactSidebar

    implicitHeight: parent.height

    color: Theme.background.main
    state: "extended"

    onStateChanged: {
        let oldSidebar = state === "extended" ? _compactSidebar.list : _extendedSidebar.list;
        let newSidebar = state === "extended" ? _extendedSidebar.list : _compactSidebar.list;

        newSidebar.currentIndex = oldSidebar.currentIndex;
        if(oldSidebar.currentIndex < 0)
            return;
        if(oldSidebar.currentItem.list.count > 0)
            newSidebar.currentItem.list.currentIndex = oldSidebar.currentItem.list.currentIndex;
    }

    states: [
        State {
            name: "extended"
            when: Size.format == Size.Format.Extended
            PropertyChanges {
                target: _root
                width: 280 * Size.scale
            }
            PropertyChanges {
                target: _extendedSidebar
                visible: true
            }
            PropertyChanges {
                target: _compactSidebar
                visible: false
            }
        },
        State {
            name: "compact"
            when: true //Size.format == Size.Format.Contained
            PropertyChanges {
                target: _root
                width: 86 * Size.scale
            }
            PropertyChanges {
                target: _extendedSidebar
                visible: false
            }
            PropertyChanges {
                target: _compactSidebar
                visible: true
            }
        }
    ]

    ExtendedSidebar{
        id: _extendedSidebar

        title.text: _root.name
        subtitle.text: _root.role

        model: _root.sidebarItems
    }

    CompactSidebar{
        id: _compactSidebar

        model: _root.sidebarItems
    }
}
