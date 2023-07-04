import QtQuick
import QtQuick.Layouts

import "../Settings"
import "../Colors"
import "../Icons"
import "../Fonts/Texts"
import "../Fonts"

Item{
    id: _sidebarItem

    property alias icon: _icon
    property alias text: _title.text
    property bool checked: false
    property bool isOpen: false
    property alias model: _listView.model

    property real openingSpeed: 150

    signal clicked

    Layout.preferredHeight: childrenRect.height
    Layout.fillWidth: true

    onIsOpenChanged: {
        _listView.currentIndex = -1;
    }
    onCheckedChanged: {
        if(!checked)
            _listView.currentIndex = -1;
    }

    Rectangle {
        id: _mainItem
        height: 50 * Size.scale
        width: parent.width
        radius: 8

        RowLayout{
            anchors{
                fill: parent
                leftMargin: Size.pixel16
                rightMargin: Size.pixel12
            }
            spacing: Size.pixel8

            Icon{
                id: _icon
                visible: path != ""
                sourceSize.height: Size.pixel24
                Layout.alignment: Qt.AlignVCenter
            }

            Subtitle2{
                id: _title
                Layout.leftMargin: _icon.visible ? Size.pixel8 : 0
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter
                verticalAlignment: Qt.AlignVCenter
            }

            Icon{
                id: _arrow
                visible: _sidebarItem.model ? _sidebarItem.model.length > 0 : 0
                sourceSize.height: Size.pixel6
                sourceSize.width: Size.pixel6
                Layout.alignment: Qt.AlignVCenter
                path: IconList.arrow
                rotation: _sidebarItem.isOpen ? 0 : -90

                Behavior on rotation { SmoothedAnimation { duration: _sidebarItem.openingSpeed;} }

            }
        }

        MouseArea{
            id: _mouseArea
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            hoverEnabled: true
            onClicked: {
                if (_sidebarItem.model && _sidebarItem.model.length > 0) {
                    _sidebarItem.isOpen = !_sidebarItem.isOpen;
                } else {
                    _sidebarItem.checked = true;
                }
                _sidebarItem.clicked()
            }
        }

        states: [
            State {
                name: "disabled"
                when: !_sidebarItem.enabled
                PropertyChanges{ target: _mainItem; color: "transparent"; opacity: 0.64; }
                PropertyChanges { target: _title; font.family: PublicSans.regular; color: Theme.text.secondary }
                PropertyChanges{ target: _icon; color: Theme.text.secondary }
                PropertyChanges{ target: _arrow; color: Theme.text.secondary }
            },
            State {
                name: "checked"
                when: _sidebarItem.checked
                PropertyChanges{ target: _mainItem; color: _mouseArea.containsMouse ? Theme.primary.transparent.p16 : Theme.primary.transparent.p8; opacity: 1;}
                PropertyChanges { target: _title; font.family: PublicSans.semiBold; color: Theme.primary.main; }
                PropertyChanges{ target: _icon; color: Theme.primary.main }
                PropertyChanges{ target: _arrow; color: Theme.primary.main; }
            },
            State {
                name: "unchecked"
                when: !_sidebarItem.checked
                PropertyChanges{ target: _mainItem; color: _mouseArea.containsMouse ? Theme.background.neutral : "transparent"; opacity: 1;}
                PropertyChanges { target: _title; font.family: PublicSans.regular; color: Theme.text.secondary }
                PropertyChanges{ target: _icon; color: Theme.text.secondary }
                PropertyChanges{ target: _arrow; color: Theme.text.secondary }
            }
        ]

    }

    ListView{
        id: _listView
        anchors{
            top: _mainItem.bottom; topMargin: Size.pixel4
            left: parent.left; right: parent.right
        }
        currentIndex: -1
        spacing: Size.pixel4
        interactive: false
        clip: true
        delegate: Rectangle{
            id: _subItem
            property bool checked: false
            property string text: modelData.text

            enabled: modelData.enabled === undefined ? true : modelData.enabled
            radius: _mainItem.radius
            height: 36 * Size.scale
            width: _listView.width
            color: _subItemMouseArea.containsMouse ? Theme.background.neutral : "transparent"
            RowLayout{
                anchors {
                    fill: parent
                    leftMargin: Size.pixel16
                    rightMargin: Size.pixel12
                }
                spacing: Size.pixel16
                Item{
                    Layout.preferredHeight: Size.pixel24
                    Layout.preferredWidth: height
                    Layout.alignment: Qt.AlignVCenter
                    Rectangle{ id: _dot; height: Size.pixel4; width: Size.pixel4; anchors.centerIn: parent; radius: 100 }
                }

                Subtitle2{
                    id: _label
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignVCenter
                    verticalAlignment: Qt.AlignVCenter
                    text: _subItem.text
                }

            }
            MouseArea{
                id: _subItemMouseArea
                anchors.fill: parent
                hoverEnabled: parent.enabled
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    _listView.currentIndex = index;
                    if(!_sidebarItem.checked)
                        _sidebarItem.checked = true;
                    modelData.onClicked();
                    _sidebarItem.clicked();
                }
            }

            states: [
                State {
                    name: "disabled"
                    when: !_subItem.enabled
                    PropertyChanges{ target: _subItem; opacity: 0.68; }
                    PropertyChanges{ target: _dot; color: Theme.text.secondary; scale: 1 }
                    PropertyChanges{ target: _label; color: Theme.text.secondary; font.family: PublicSans.regular }
                },
                State {
                    name: "checked"
                    when: _listView.currentIndex === index
                    PropertyChanges{ target: _subItem; opacity: 1; }
                    PropertyChanges{ target: _dot; color: Theme.primary.main; scale: 3 }
                    PropertyChanges{ target: _label; color: Theme.text.primary; font.family: PublicSans.semiBold }
                },
                State {
                    name: "unchecked"
                    when: _listView.currentIndex !== index
                    PropertyChanges{ target: _subItem; opacity: 1; }
                    PropertyChanges{ target: _dot; color: Theme.text.secondary; scale: 1 }
                    PropertyChanges{ target: _label; color: Theme.text.secondary; font.family: PublicSans.regular }
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
        }

    }

    states: [
        State{
            when: _sidebarItem.isOpen
            name: "open"
            PropertyChanges{ target: _listView; height: (count * (36*Size.scale)) + ((count-1) * spacing) }
        },
        State{
            when: !_sidebarItem.isOpen
            name: "closed"
            PropertyChanges{ target: _listView; height: 0; }
        }
    ]

    transitions: [
        Transition {
            from: "*"
            to: "open"
            NumberAnimation { target: _listView; property: "height"; duration: _sidebarItem.openingSpeed; easing.type: Easing.InOutQuad }
        },
        Transition {
            from: "*"
            to: "closed"
            NumberAnimation { target: _listView; property: "height"; duration: _sidebarItem.openingSpeed; easing.type: Easing.InOutQuad }
        }
    ]
}
