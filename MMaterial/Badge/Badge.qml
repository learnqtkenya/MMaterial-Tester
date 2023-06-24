import QtQuick 2.15

import "../Colors"
import "../Icons"

//For easest usage, don't change the size of width and height, but
//change the size of icon.sourceSize.widht/height

Item{
    id: _badge
    width: _icon.width
    height: _icon.height

    property alias icon: _icon
    property var accent: Theme.info //Needs to be PaletteBasic type
    property int type: Badge.Type.Dot

    enum Type {
        Dot,
        Number
    }

    Icon{
        id: _icon
        path: IconList.mail
        sourceSize.height: 50
        color: Theme.text.primary
    }
    Loader{
        id: _badgeLoader
        asynchronous: true
        anchors {
            bottom: _icon.top
            left: _icon.right
        }
    }

    Component{
        id: _iconBadge
        BadgeNumber{
            pixelSize: _icon.height * 0.6
            accent: _badge.accent
        }
    }
    Component{
        id: _iconDot
        BadgeDot{
            pixelSize: _icon.height * 0.42
            accent: _badge.accent
        }
    }

    states: [
        State{
            name: "dot"
            when: _badge.type == Badge.Type.Dot
            PropertyChanges{
                target: _badgeLoader
                sourceComponent: _iconDot
                anchors{
                    bottomMargin: -_icon.height * 0.05
                    leftMargin: -_icon.width * 0.05
                }
            }
        },
        State{
            name: "number"
            when: _badge.type == Badge.Type.Number
            PropertyChanges{
                target: _badgeLoader
                sourceComponent: _iconBadge
                anchors{
                    bottomMargin: -_icon.height * 0.47
                    leftMargin: -_icon.width * 0.5
                }
            }
        }
    ]
}
