import QtQuick 2.15
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Controls.Material

import "../Settings"
import "../Icons"
import "../Fonts/Texts"
import "../Colors"

Rectangle{
    id: _button

    readonly property real recommendedHeight: _title.contentHeight + _button.verticalPadding * 2
    readonly property real recommendedWidth: _title.implicitWidth + (_leftIcon.visible ? _leftIcon.implicitWidth + _mainLayout.spacing : 0) + (_rightIcon.visible ? _rightIcon.implicitWidth + _mainLayout.spacing : 0) + _button.horizontalPadding * 2

    radius: 8
    opacity: mouseArea.pressed ? 0.7 : 1 //TODO replace with ripple effect when OpacityMask is fixed in Qt6

    property alias mouseArea: mouseArea
    property var accent: Theme.info //Needs to be PaletteBasic type

    property int pixelSize: {
        if(size == Size.Grade.L)
            return Size.pixel15
        if(size == Size.Grade.M)
            return Size.pixel14
        if(size == Size.Grade.S)
            return Size.pixel13
    }
    property real horizontalPadding: {
        if(size == Size.Grade.L)
            return Size.pixel22;
        if(size == Size.Grade.M)
            return Size.pixel16;
        if(size == Size.Grade.S)
            return Size.pixel10;
    }
    property real verticalPadding: {
        if(size == Size.Grade.L)
            return Size.pixel12;
        if(size == Size.Grade.M)
            return Size.pixel6;
        if(size == Size.Grade.S)
            return Size.pixel4;
    }


    property bool isLoading: false
    property string text: "Button"
    property bool backgroundVisible: true

    property int type: MButton.Type.Contained
    property int size: Size.Grade.L

    property alias leftIcon: _leftIcon
    property alias rightIcon: _rightIcon

    signal clicked

    enum Type {
        Contained,
        Outlined,
        Text,
        Soft
    }

    Item{
        id: _body
        visible: !_button.isLoading
        anchors {
            fill: parent
            leftMargin: _button.horizontalPadding; rightMargin: _button.horizontalPadding
            topMargin: _button.verticalPadding; bottomMargin: _button.verticalPadding
        }
        RowLayout{
            id: _mainLayout
            anchors.fill: parent
            spacing: Size.pixel8
            Icon{
                id: _leftIcon
                visible: path != ""
                sourceSize.height: _title.contentHeight * 0.5
            }
            H2{
                id: _title
                font.pixelSize: _button.pixelSize
                text: _button.text
                font{
                    capitalization: Font.Capitalize
                    bold: true
                }
                verticalAlignment: Qt.AlignVCenter
                horizontalAlignment: Qt.AlignHCenter
                Layout.alignment: Qt.AlignCenter
            }
            Icon{
                id: _rightIcon
                visible: path != ""
                sourceSize.height: _title.contentHeight * 0.5
            }
        }
    }

    BusyIndicator{
        Material.accent: _title.color
        visible: _button.isLoading
        height: parent.height* 0.7
        width: height
        anchors.centerIn: parent
    }

    //Non-Visual elements
    MouseArea{
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
        enabled: !_button.isLoading
        onClicked: { _button.clicked(); }
    }

    state: "contained"
    states: [
        State{
            when: _button.type == MButton.Type.Contained
            name: "contained"
            PropertyChanges {
                target: _button;
                color: _button.enabled ? (mouseArea.containsMouse ? _button.accent.dark : _button.accent.main) : Theme.action.disabledBackground
                border.width: 0
            }
            PropertyChanges { target: _title; color: _button.enabled ? _button.accent.contrastText : Theme.action.disabled; }
            PropertyChanges { target: _leftIcon; color: _button.enabled ?  _button.accent.contrastText : Theme.action.disabled; }
            PropertyChanges { target: _rightIcon; color: _button.enabled ? _button.accent.contrastText : Theme.action.disabled; }
        },
        State{
            when: _button.type == MButton.Type.Outlined
            name: "outlined"
            PropertyChanges { target: _button; color:  _button.enabled ? (mouseArea.containsMouse ? _button.accent.transparent8 : "transparent") : "transparent"; border.width: 1; border.color: _button.enabled ? _button.accent.main : Theme.action.disabled; }
            PropertyChanges { target: _title; color:  _button.enabled ? _button.accent.main : Theme.action.disabled; }
            PropertyChanges { target: _leftIcon; color:  _button.enabled ? _button.accent.main : Theme.action.disabled; }
            PropertyChanges { target: _rightIcon; color:  _button.enabled ? _button.accent.main : Theme.action.disabled; }
        },
        State{
            when: _button.type == MButton.Type.Text
            name: "text"
            PropertyChanges { target: _button; color: mouseArea.containsMouse ? _button.accent.transparent8 : "transparent"; border.width: 0; }
            PropertyChanges { target: _title; color: _button.enabled ? _button.accent.main : Theme.action.disabled; }
            PropertyChanges { target: _leftIcon; color: _button.enabled ? _button.accent.main : Theme.action.disabled; }
            PropertyChanges { target: _rightIcon; color: _button.enabled ? _button.accent.main : Theme.action.disabled; }
        },
        State{
            when: _button.type == MButton.Type.Soft
            name: "soft"
            PropertyChanges { target: _button; color: _button.enabled ? (mouseArea.containsMouse ? _button.accent.transparent32 : _button.accent.transparent16) : Theme.action.disabledBackground; border.width: 0; }
            PropertyChanges { target: _title; color: _button.enabled ? _button.accent.dark : Theme.action.disabled; }
            PropertyChanges { target: _leftIcon; color: _button.enabled ? _button.accent.dark : Theme.action.disabled; }
            PropertyChanges { target: _rightIcon; color: _button.enabled ? _button.accent.dark : Theme.action.disabled; }
        }

    ]
}
