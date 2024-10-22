import QtQuick
import QtQuick.Effects
import QtQuick.Layouts

import MMaterial

Rectangle {
    id: _root

    required property Item mainView

    default property list<SidebarItem> sidebarItems

    property alias loader: _loader

    property string name
    property string role

    property int currentIndex: -1

    implicitHeight: parent.height

    color: Theme.background.main
    state: ""

    layer{
        enabled: true
        effect: MultiEffect{
            shadowEnabled: true
            shadowBlur: 3
            shadowHorizontalOffset: 2
            shadowVerticalOffset: 5
        }
    }

    states: [
        State {
            name: "extended"
            when: Size.format == Size.Format.Extended

            PropertyChanges {
                target: _root
                width: 280 * Size.scale
            }

            AnchorChanges {
                target: _root

                anchors {
                    left: _root.parent.left
                    top: _root.parent.top
                    bottom: _root.parent.bottom
                }
            }

            AnchorChanges {
                target: _root.mainView

                anchors {
                    left: _root.right
                    top: _root.parent.top
                    bottom: _root.parent.bottom
                    right: _root.parent.right
                }
            }

            PropertyChanges {
                target: _root.mainView

                anchors {
                    margins: Size.pixel32
                    leftMargin: Size.pixel46
                }
            }
        },
        State {
            name: "compact"
            when: Size.format == Size.Format.Compact

            PropertyChanges {
                target: _root
                width: 86 * Size.scale
            }

            AnchorChanges {
                target: _root

                anchors {
                    left: _root.parent.left
                    top: _root.parent.top
                    bottom: _root.parent.bottom
                }
            }

            AnchorChanges {
                target: _root.mainView

                anchors {
                    left: _root.right
                    top: _root.parent.top
                    bottom: _root.parent.bottom
                    right: _root.parent.right
                }
            }

            PropertyChanges {
                target: _root.mainView

                anchors {
                    margins: Size.pixel32
                    leftMargin: Size.pixel46
                }
            }
        },
        State {
            name: "mobile"
            when: true

            PropertyChanges {
                target: _root
                width: _root.parent.width
            }

            AnchorChanges {
                target: _root

                anchors {
                    left: _root.parent.left
                    bottom: _root.parent.bottom
                    right: _root.parent.right
                }
            }

            AnchorChanges {
                target: _root.mainView

                anchors {
                    left: _root.parent.left
                    top: _root.parent.top
                    bottom: _root.top
                    right: _root.parent.right
                }
            }

            PropertyChanges {
                target: _root.mainView

                anchors {
                    margins: Size.pixel32
                    bottomMargin: Size.pixel46
                }
            }
        }
    ]

    onStateChanged: console.log(state)
    // onStateChanged: _swapAnimation.restart()

    // SequentialAnimation {
    //     id: _swapAnimation

    //     ParallelAnimation {
    //         NumberAnimation { target: _root; properties: "width"; duration: 220; easing.type: Easing.InOutQuad }
    //         NumberAnimation { target: _loader; properties: "opacity"; to: 0; duration: 200; easing.type: Easing.OutQuad }
    //     }
    //     ScriptAction { script: d.swapSources() }
    // }

    NumberAnimation {
        id: _showAnimation

        target: _loader
        properties: "opacity"
        to: 1
        duration: 200
        easing.type: Easing.OutQuad
    }

    Loader {
        id: _loader

        anchors.fill: _root
        asynchronous: true

        onStatusChanged: {
            if (status == Loader.Ready) {
                _showAnimation.restart()
            }
        }
    }

    Component {
        id: _extendedSidebar

        ExtendedSidebar{
            title.text: _root.name
            subtitle.text: _root.role

            model: _root.sidebarItems
            sidebarData: d.sidebarData
        }
    }

    Component {
        id: _compactSidebar

        CompactSidebar{
            model: _root.sidebarItems
            sidebarData: d.sidebarData
        }
    }

    QtObject {
        id: d

        property SidebarData sidebarData: SidebarData {}

        function swapSources() {
            if ( Size.format == Size.Format.Extended )
                _loader.sourceComponent = _extendedSidebar
            else
                _loader.sourceComponent = _compactSidebar
        }
    }
}
