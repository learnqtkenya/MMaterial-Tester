import QtQuick
import QtQuick.Effects
import QtQuick.Layouts

import "../Settings"
import "../Colors"
import "../Icons"
import "../Fonts/Texts"
import "../Buttons"
import "../Components"

Rectangle {
    id: _sidebar
    height: parent.height
    color: Theme.background.main

    property string name
    property string role

    property alias extendedSidebar: _extendedSidebar
    property alias compactSidebar: _compactSidebar

    ExtendedSidebar{
        id: _extendedSidebar
        title.text: _sidebar.name
        subtitle.text: _sidebar.role
    }

    CompactSidebar{
        id: _compactSidebar
    }

    onStateChanged: {
        let oldSidebar = state === "extended" ? _compactSidebar.list : _extendedSidebar.list;
        let newSidebar = state === "extended" ? _extendedSidebar.list : _compactSidebar.list;

        newSidebar.currentIndex = oldSidebar.currentIndex;
        if(oldSidebar.currentIndex < 0)
            return;
        if(oldSidebar.currentItem.list.count > 0)
            newSidebar.currentItem.list.currentIndex = oldSidebar.currentItem.list.currentIndex;
    }

    state: "extended"
    states: [
        State {
            name: "extended"
            when: Size.format == Size.Format.Extended
            PropertyChanges {
                target: _sidebar
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
                target: _sidebar
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
}
