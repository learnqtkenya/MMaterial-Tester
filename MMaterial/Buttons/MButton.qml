import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material

import "../Settings"
import "../Icons"
import "../Fonts/Texts"
import "../Colors"

Rectangle {
    id: _button

    property alias mouseArea: mouseArea
    property alias title: _title
    property var accent: Theme.primary //Needs to be PaletteBasic type

    property int pixelSize: {
        if(_button.size == Size.Grade.L)
            return Size.pixel15
        if(_button.size == Size.Grade.M)
            return Size.pixel14
        return Size.pixel13
    }
    property real horizontalPadding: {
        if(_button.size == Size.Grade.L)
            return Size.pixel22;
        if(_button.size == Size.Grade.M)
            return Size.pixel16;
        return Size.pixel10;
    }
    property real verticalPadding: {
        if(_button.size == Size.Grade.L)
            return Size.pixel12;
        if(_button.size == Size.Grade.M)
            return Size.pixel6;
        return Size.pixel4;
    }

    property bool isLoading: false
    property bool backgroundVisible: true
    property string text: "Button"

    property int type: MButton.Type.Contained
    property int size: Size.Grade.L

    property alias leftIcon: _leftIcon
    property alias rightIcon: _rightIcon

    signal clicked

    enum Type {
        Contained,
        Outlined,
        Text,
        Soft,
        Custom
    }

    implicitHeight: _private.oneOrLessChildrenVisible ? _title.contentHeight + _button.verticalPadding * 2 : _title.contentHeight + _button.verticalPadding * 2
    implicitWidth:  {
        if(_private.oneOrLessChildrenVisible)
            return _button.implicitHeight;
        else
            return _title.implicitWidth + (_leftIcon.visible ? _leftIcon.implicitWidth + _mainLayout.spacing : 0) + (_rightIcon.visible ? _rightIcon.implicitWidth + _mainLayout.spacing : 0) + _button.horizontalPadding * 2
    }

    radius: 8
    opacity: mouseArea.pressed ? 0.7 : 1 //TODO replace with ripple effect when OpacityMask is fixed in Qt6
    color: _private.backgroundColor
    border.color: _private.borderColor

    state: "contained"
    states: [
        State{
            when: _button.type == MButton.Type.Contained
            name: "contained"
            PropertyChanges { target: _button; border.width: 0 }
            PropertyChanges {
                target: _private;
                backgroundColor: _button.enabled ? (mouseArea.containsMouse ? _button.accent.dark : _button.accent.main) : Theme.action.disabledBackground
                textColor: _button.enabled ? _button.accent.contrastText : Theme.action.disabled
                borderColor: "transparent"
            }
            PropertyChanges{ target: _leftIcon; color: _private.textColor }
            PropertyChanges{ target: _rightIcon; color: _private.textColor }
        },
        State{
            when: _button.type == MButton.Type.Outlined
            name: "outlined"
            PropertyChanges { target: _button; border.width: 1; }
            PropertyChanges {
                target: _private;
                backgroundColor: _button.enabled ? (mouseArea.containsMouse ? _button.accent.transparent.p8 : "transparent") : "transparent"
                textColor: _button.enabled ? _button.accent.main : Theme.action.disabled
                borderColor:  _button.enabled ? (_button.mouseArea.containsMouse ? _button.accent.main : _button.accent.transparent.p48) : Theme.action.disabled
            }
            PropertyChanges{ target: _leftIcon; color: _private.textColor }
            PropertyChanges{ target: _rightIcon; color: _private.textColor }
        },
        State{
            when: _button.type == MButton.Type.Text
            name: "text"
            PropertyChanges { target: _button;  border.width: 0; }
            PropertyChanges {
                target: _private;
                backgroundColor: mouseArea.containsMouse ? _button.accent.transparent.p8 : "transparent"
                textColor:  _button.enabled ? _button.accent.main : Theme.action.disabled
                borderColor: "transparent"
            }
            PropertyChanges{ target: _leftIcon; color: _private.textColor }
            PropertyChanges{ target: _rightIcon; color: _private.textColor }
        },
        State{
            when: _button.type == MButton.Type.Soft
            name: "soft"
            PropertyChanges { target: _button; border.width: 0; }
            PropertyChanges {
                target: _private;
                backgroundColor: _button.enabled ? (mouseArea.containsMouse ? _button.accent.transparent.p32 : _button.accent.transparent.p16) : Theme.action.disabledBackground
                textColor:  _button.enabled ? _button.accent.dark : Theme.action.disabled
                borderColor: "transparent"
            }
            PropertyChanges{ target: _leftIcon; color: _private.textColor }
            PropertyChanges{ target: _rightIcon; color: _private.textColor }
        },
        State{
            when: true
            name: "custom"
        }
    ]

    QtObject{
        id: _private

        property color backgroundColor: "#FFFFFF"
        property color textColor: "#FFFFFF"
        property color borderColor: "#FFFFFF"
        property bool oneOrLessChildrenVisible: !_title.visible && (!_leftIcon.visible || !_rightIcon.visible)
    }

    Item {
        id: _body

        anchors {
            fill: parent
            leftMargin: _private.oneOrLessChildrenVisible ? 0 : _button.horizontalPadding; rightMargin: _private.oneOrLessChildrenVisible ? 0 : _button.horizontalPadding
            topMargin: _button.verticalPadding; bottomMargin: _button.verticalPadding
        }

        visible: !_button.isLoading

        RowLayout {
            id: _mainLayout

            anchors.fill: parent

            spacing: Size.pixel8

            Icon {
                id: _leftIcon

                Layout.alignment: _title.visible ? Qt.AlignLeft : Qt.AlignCenter
                sourceSize.height: _title.contentHeight * 0.55
                visible: path != ""
            }

            H2{
                id: _title

                Layout.alignment: Qt.AlignCenter

                visible: text !== ""
                font.pixelSize: _button.pixelSize
                text: _button.text
                color: _private.textColor

                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter

                font{
                    capitalization: Font.Capitalize
                    bold: true
                }
            }

            Icon {
                id: _rightIcon

                Layout.alignment: _title.visible ? Qt.AlignRight : Qt.AlignCenter

                visible: path != ""
                sourceSize.height: _title.contentHeight * 0.55
            }
        }
    }

    BusyIndicator{
        anchors.centerIn: parent

        height: parent.height* 0.7
        width: height

        Material.accent: _title.color
        visible: _button.isLoading
    }

    MouseArea {
        id: mouseArea

        anchors.fill: parent

        hoverEnabled: _button.enabled
        cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
        enabled: !_button.isLoading

        onClicked: { _button.clicked(); }
    }
}
