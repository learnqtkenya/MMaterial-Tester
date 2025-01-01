import QtQuick
import QtQuick.Layouts

import MMaterial as MMaterial

Item {
    id: _root

    property SidebarData sidebarData

    property string category

    property alias icon: _icon
    property alias text: _title.text
    property alias model: _listView.model
    property alias list: _listView
    property QtObject chip: null

    property bool checked: index == _root.sidebarData.currentIndex
    property bool isOpen: false

    property real openingSpeed: 150

    function selectItem(subindex) : void {
        if (ListView.view) {
            if(typeof index !== "undefined")
                ListView.view.currentIndex = index;
            else if(typeof ObjectModel.index !== "undefined")
                ListView.view.currentIndex = ObjectModel.index;

            _root.sidebarData.currentIndex = index;

            if (subindex >= 0)
                _root.sidebarData.currentSubIndex = subindex;
        }
    }

    signal clicked

    height: _listView.height + _listView.anchors.topMargin + _mainItem.height
    width: ListView.view ? ListView.view.width : 0

    states: [
        State{
            when: _root.isOpen
            name: "open"
            PropertyChanges{ target: _listView; height: _listView.count * (_listView.delegateHeight + _listView.spacing) - _listView.spacing; }
        },
        State{
            when: !_root.isOpen
            name: "closed"
            PropertyChanges{ target: _listView; height: 0; }
        }
    ]

    transitions: [
        Transition {
            from: "*"
            to: "open"
            NumberAnimation { target: _listView; property: "height"; duration: _root.openingSpeed; easing.type: Easing.InOutQuad }
        },
        Transition {
            from: "*"
            to: "closed"
            NumberAnimation { target: _listView; property: "height"; duration: _root.openingSpeed; easing.type: Easing.InOutQuad }
        }
    ]

    MMaterial.Checkable {
        id: _mainItem

        height: 50 * MMaterial.Size.scale
        width: _root.width

        customCheckImplementation: true

        onClicked: {
            if (_root.model && _root.model.length > 0) {
                _root.isOpen = !_root.isOpen;
            } else {
                _root.selectItem();
            }
            _root.clicked();
        }

        states: [
            State {
                name: "disabled"
                when: !_root.enabled
                PropertyChanges{ target: _checkableBackground; color: "transparent"; opacity: 0.64; }
                PropertyChanges { target: _title; font.family: MMaterial.PublicSans.regular; color: MMaterial.Theme.text.secondary }
                PropertyChanges{ target: _icon; color: MMaterial.Theme.text.secondary }
                PropertyChanges{ target: _arrow; color: MMaterial.Theme.text.secondary }
            },
            State {
                name: "checked"
                when: _root.checked
                PropertyChanges{ target: _checkableBackground; color: _mainItem.mouseArea.containsMouse ? MMaterial.Theme.primary.transparent.p16 : MMaterial.Theme.primary.transparent.p8; opacity: 1;}
                PropertyChanges { target: _title; font.family: MMaterial.PublicSans.semiBold; color: MMaterial.Theme.primary.main; }
                PropertyChanges{ target: _icon; color: MMaterial.Theme.primary.main }
                PropertyChanges{ target: _arrow; color: MMaterial.Theme.primary.main; }
            },
            State {
                name: "unchecked"
                when: !_root.checked
                PropertyChanges{ target: _checkableBackground; color: _mainItem.mouseArea.containsMouse ? MMaterial.Theme.background.neutral : "transparent"; opacity: 1;}
                PropertyChanges { target: _title; font.family: MMaterial.PublicSans.regular; color: MMaterial.Theme.text.secondary }
                PropertyChanges{ target: _icon; color: MMaterial.Theme.text.secondary }
                PropertyChanges{ target: _arrow; color: MMaterial.Theme.text.secondary }
            }
        ]

        Rectangle {
            id: _checkableBackground

            anchors.fill: _mainItem
            radius: MMaterial.Size.pixel8
        }

        RowLayout {
            anchors{
                fill: _mainItem
                leftMargin: MMaterial.Size.pixel16
                rightMargin: MMaterial.Size.pixel12
            }

            spacing: MMaterial.Size.pixel8

            MMaterial.Icon {
                id: _icon

                Layout.alignment: Qt.AlignVCenter

                visible: iconData.path != ""
                size: MMaterial.Size.pixel24
                color: _title.color
            }

            MMaterial.Subtitle2 {
                id: _title

                Layout.leftMargin: _icon.visible ? MMaterial.Size.pixel8 : 0
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter
                elide: Text.ElideRight

                verticalAlignment: Qt.AlignVCenter
            }

            Loader {
                Layout.alignment: Qt.AlignVCenter
                Layout.preferredHeight: item ? item.height : 0
                Layout.preferredWidth: item ? item.width : 0
                asynchronous: true

                active: _root.chip ? _root.chip.text !== "" : false

                sourceComponent: Component {
                    MMaterial.MButton {
                        type: MMaterial.MButton.Type.Soft
                        text: _root.chip ? _root.chip.text : ""
                        accent: _root.chip ? _root.chip.accent : MMaterial.Theme.primary
                        size: MMaterial.Size.Grade.Custom
                        horizontalPadding: MMaterial.Size.pixel8
                        verticalPadding: MMaterial.Size.pixel6
                        pixelSize: MMaterial.Size.pixel12
                        mouseArea {
                            enabled: false
                            anchors.fill: null
                        }
                    }
                }
            }

            MMaterial.Icon {
                id: _arrow

                Layout.alignment: Qt.AlignVCenter

                visible: _root.model ? _root.model.length > 0 : 0
                iconData: MMaterial.Icons.light.chevronRight
                rotation: _root.isOpen ? 90 : 0

                size: MMaterial.Size.pixel16

                Behavior on rotation { SmoothedAnimation { duration: _root.openingSpeed;} }
            }
        }
    }

    ListView {
        id: _listView

        property real delegateHeight: 36 * MMaterial.Size.scale

        anchors{
            top: _mainItem.bottom; topMargin: MMaterial.Size.pixel4
            left: _root.left; right: _root.right
        }

        currentIndex: _root.checked ? _root.sidebarData.currentSubIndex : -1
        spacing: MMaterial.Size.pixel4
        interactive: false
        clip: true

        delegate: Rectangle {
            id: _subItem

            property bool checked: _root.sidebarData.currentSubIndex == index
            property string text: modelData.text
            property var chip: modelData.chip ? modelData.chip : null

            enabled: modelData.enabled === undefined ? true : modelData.enabled
            radius: _checkableBackground.radius
            height: _listView.delegateHeight
            width: _listView.width
            color: _subItemMouseArea.containsMouse ? MMaterial.Theme.background.neutral : "transparent"

            states: [
                State {
                    name: "disabled"
                    when: !_subItem.enabled
                    PropertyChanges{ target: _subItem; opacity: 0.68; }
                    PropertyChanges{ target: _dot; color: MMaterial.Theme.text.secondary; scale: 1 }
                    PropertyChanges{ target: _label; color: MMaterial.Theme.text.secondary; font.family: MMaterial.PublicSans.regular }
                },
                State {
                    name: "checked"
                    when: _root.sidebarData.currentSubIndex === index && _root.checked
                    PropertyChanges{ target: _subItem; opacity: 1; }
                    PropertyChanges{ target: _dot; color: MMaterial.Theme.primary.main; scale: 3 }
                    PropertyChanges{ target: _label; color: MMaterial.Theme.text.primary; font.family: MMaterial.PublicSans.semiBold }
                },
                State {
                    name: "unchecked"
                    when: true
                    PropertyChanges{ target: _subItem; opacity: 1; }
                    PropertyChanges{ target: _dot; color: MMaterial.Theme.text.secondary; scale: 1 }
                    PropertyChanges{ target: _label; color: MMaterial.Theme.text.secondary; font.family: MMaterial.PublicSans.regular }
                }
            ]

            transitions: [
                Transition {
                    from: "*"
                    to: "checked"
                    ColorAnimation { target: _dot; duration: 300; easing.type: Easing.InOutQuad }
                    ColorAnimation { target: _label; duration: 0; easing.type: Easing.InOutQuad }
                    NumberAnimation { target: _dot; property: "scale"; duration: 300; easing.type: Easing.InOutQuad }
                },
                Transition {
                    from: "*"
                    to: "unchecked"
                    ColorAnimation { target: _dot; duration: 300; easing.type: Easing.InOutQuad }
                    ColorAnimation { target: _label; duration: 0; easing.type: Easing.InOutQuad }
                    NumberAnimation { target: _dot; property: "scale"; duration: 300; easing.type: Easing.InOutQuad }
                }
            ]

            RowLayout {
                anchors {
                    fill: _subItem
                    leftMargin: MMaterial.Size.pixel16
                    rightMargin: MMaterial.Size.pixel12
                }

                spacing: MMaterial.Size.pixel16

                Item {
                    id: _dotContainer

                    Layout.preferredHeight: MMaterial.Size.pixel24
                    Layout.preferredWidth: height
                    Layout.alignment: Qt.AlignVCenter

                    Rectangle { id: _dot; height: MMaterial.Size.pixel4; width: MMaterial.Size.pixel4; anchors.centerIn: _dotContainer; radius: 100 }
                }

                MMaterial.Subtitle2 {
                    id: _label

                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignVCenter

                    verticalAlignment: Qt.AlignVCenter

                    text: _subItem.text
                }

                Loader {
                    Layout.alignment: Qt.AlignVCenter
                    Layout.preferredHeight: item ? item.height : 0
                    Layout.preferredWidth: item ? item.width : 0
                    asynchronous: true

                    active: _subItem.chip

                    sourceComponent: Component {
                        MMaterial.MButton {
                            type: MMaterial.MButton.Type.Soft
                            text: _subItem.chip ? _subItem.chip.text : ""
                            accent: _subItem.chip ? _subItem.chip.accent : MMaterial.Theme.primary
                            size: MMaterial.Size.Grade.Custom
                            horizontalPadding: MMaterial.Size.pixel6
                            verticalPadding: MMaterial.Size.pixel6
                            pixelSize: MMaterial.Size.pixel11

                            mouseArea {
                                enabled: false
                                anchors.fill: null
                            }
                        }
                    }
                }
            }


            MouseArea {
                id: _subItemMouseArea

                anchors.fill: _subItem

                hoverEnabled: _subItem.enabled
                cursorShape: Qt.PointingHandCursor

                onClicked: {
                    _listView.currentIndex = index;
                    _root.selectItem(index);
                    modelData.onClicked();
                }
            }
        }
    }
}
