import QtQuick 
import QtQuick.Layouts

import MMaterial

Rectangle {
    id: _textField


    property alias placeholder: _label.text
    property alias input: _textInput
    property alias leftIcon: _leftIcon
    property alias rightIcon: _rightIcon
    property alias text: _textInput.text

    property var hoverHandler: _hoverHandler
    property PaletteBasic accent: Theme.primary

    property bool showPlaceholder: !_textInput.focus && _textInput.text === ""
    property int type: MTextField.Type.Standard

    enum Type { Filled, Outlined, Standard }

    implicitHeight: 56 * Size.scale
    implicitWidth: (Size.format == Size.Format.Extended ? 319 : 200) * Size.scale

    radius: 8

    border {
        width: _textField.type === MTextField.Type.Outlined ? 1 : 0
        color: Theme.text.primary
    }

    states: [
        //Filled
        State {
            name: "disabled-filled"
            when: !_textField.enabled && _textField.type == MTextField.Type.Filled
            PropertyChanges { target: _textField; color: Theme.action.disabledBackground; border { color: Theme.action.disabledBackground } }
            PropertyChanges { target: _label; color: Theme.text.disabled }
            PropertyChanges { target: _textInput; color: Theme.text.disabled }
        },
        State {
            name: "error-filled"
            when: !_textInput.acceptableInput && _textField.type == MTextField.Type.Filled
            PropertyChanges { target: _textField; color: Theme.error.transparent.p8; border { color: Theme.error.main } }
            PropertyChanges { target: _label; color: Theme.error.main }
            PropertyChanges { target: _textInput; color: Theme.text.primary }
        },
        State {
            name: "focused-filled"
            when: _textInput.focus && _textField.type == MTextField.Type.Filled
            PropertyChanges { target: _textField; color: Theme.main.transparent.p16; border { color: Theme.text.primary} }
            PropertyChanges { target: _label; color: Theme.text.primary }
            PropertyChanges { target: _textInput; color: Theme.text.primary }
        },
        State {
            name: "hovered-filled"
            when: _textField.hoverHandler.hovered && _textField.type == MTextField.Type.Filled
            PropertyChanges { target: _textField; color: Theme.main.transparent.p16; border { color: Theme.text.primary} }
            PropertyChanges { target: _label; color: Theme.text.disabled }
            PropertyChanges { target: _textInput; color: Theme.text.primary }
        },
        State {
            name: "normal-filled"
            when: _textField.type == MTextField.Type.Filled
            PropertyChanges { target: _textField; color: Theme.main.transparent.p8; border { color: Theme.action.disabledBackground} }
            PropertyChanges { target: _label; color: Theme.text.disabled }
            PropertyChanges { target: _textInput; color: Theme.text.primary }
        },

        //Outlined
        State {
            name: "disabled-outlined"
            when: !_textField.enabled && _textField.type == MTextField.Type.Outlined
            PropertyChanges { target: _textField; color: Theme.background.paper; border { color: Theme.action.disabledBackground } }
            PropertyChanges { target: _label; color: Theme.text.disabled }
            PropertyChanges { target: _textInput; color: Theme.text.disabled }
        },
        State {
            name: "error-outlined"
            when: !_textInput.acceptableInput && _textField.type == MTextField.Type.Outlined
            PropertyChanges { target: _textField; color: Theme.background.paper; border { color: Theme.error.main } }
            PropertyChanges { target: _label; color: Theme.error.main }
            PropertyChanges { target: _textInput; color: Theme.text.primary }
        },
        State {
            name: "focused-outlined"
            when: _textInput.focus && _textField.type == MTextField.Type.Outlined
            PropertyChanges { target: _textField; color: Theme.background.paper; border { color: Theme.text.primary} }
            PropertyChanges { target: _label; color: Theme.text.primary }
            PropertyChanges { target: _textInput; color: Theme.text.primary }
        },
        State {
            name: "hovered-outlined"
            when: _textField.hoverHandler.hovered && _textField.type == MTextField.Type.Outlined
            PropertyChanges { target: _textField; color: Theme.background.paper; border { color: Theme.text.primary} }
            PropertyChanges { target: _label; color: Theme.text.disabled }
            PropertyChanges { target: _textInput; color: Theme.text.primary }
        },
        State {
            name: "normal-outlined"
            when: _textField.type == MTextField.Type.Outlined
            PropertyChanges { target: _textField; color: Theme.background.paper; border { color: Theme.action.disabledBackground} }
            PropertyChanges { target: _label; color: Theme.text.disabled }
            PropertyChanges { target: _textInput; color: Theme.text.primary }
        },

        //Standard
        State {
            name: "disabled"
            when: !_textField.enabled
            PropertyChanges { target: _textField; color: "transparent"; border { color: Theme.action.disabledBackground } }
            PropertyChanges { target: _label; color: Theme.text.disabled }
            PropertyChanges { target: _textInput; color: Theme.text.disabled }
        },
        State {
            name: "error"
            when: !_textInput.acceptableInput
            PropertyChanges { target: _textField; color: "transparent"; border { color: Theme.error.main } }
            PropertyChanges { target: _label; color: Theme.error.main }
            PropertyChanges { target: _textInput; color: Theme.text.primary }
        },
        State {
            name: "focused"
            when: _textInput.focus
            PropertyChanges { target: _textField; color: "transparent"; border { color: Theme.text.primary} }
            PropertyChanges { target: _label; color: Theme.text.primary }
            PropertyChanges { target: _textInput; color: Theme.text.primary }
        },
        State {
            name: "hovered"
            when: _textField.hoverHandler.hovered
            PropertyChanges { target: _textField; color: "transparent"; border { color: Theme.text.primary} }
            PropertyChanges { target: _label; color: Theme.text.disabled }
            PropertyChanges { target: _textInput; color: Theme.text.primary }
        },
        State {
            name: "normal"
            when: true
            PropertyChanges { target: _textField; color: "transparent"; border { color: Theme.action.disabledBackground} }
            PropertyChanges { target: _label; color: Theme.text.disabled }
            PropertyChanges { target: _textInput; color: Theme.text.primary }
        }
    ]

    QtObject{
        id: _private

        property bool isOutlinedType: _textField.type == MTextField.Type.Outlined
        property bool isFilledType: _textField.type == MTextField.Type.Filled
        property bool isStandardType: !isFilledType && !isOutlinedType
    }

    Rectangle {
        anchors.bottom: parent.bottom

        width: parent.width
        height: 1

        color: _textField.border.color
        visible: _textField.type !== MTextField.Type.Outlined && _textField.type !== MTextField.Type.Filled
    }

    Rectangle {
        id: _labelContainer

        anchors {
            top: parent.top; topMargin: -height/4
        }

        height: _textField.border.width * 2
        width: _label.width

        x: _label.x
        color: _textField.color
        radius: 8
    }

    B2 {
        id: _label

        verticalAlignment: Qt.AlignVCenter
        horizontalAlignment: _private.isOutlinedType ? Qt.AlignHCenter : Qt.AlignLeft

        width: implicitWidth + Size.pixel8
        height: implicitHeight

        font.pixelSize: Size.pixel12
        text: "Placeholder"

        lineHeight: 1

        state: "foreground"
        states: [
            State {
                name: "foreground"
                when: _textField.showPlaceholder
                PropertyChanges { target: _labelContainer; opacity: 0.0; }
                PropertyChanges { target: _mainContainer; anchors { topMargin: 0; } }
                PropertyChanges{ target: _label; scale: 1.4; x: _textInput.x + _label.width * 0.2; y: _textField.height/2 - _label.height/2}
            },
            State {
                name: "background"
                when: true
                PropertyChanges { target: _labelContainer; opacity: 1.0; }
                PropertyChanges { target: _mainContainer; anchors { topMargin: _textField.type === MTextField.Type.Outlined ? 0 : Size.pixel16; } }
                PropertyChanges{
                    target: _label;
                    scale: 1;
                    x:  _private.isStandardType ? 0 : _textInput.anchors.leftMargin;
                    y: _textField.type === MTextField.Type.Outlined ? -height/2 : height/2;
                }
            }
        ]

        transitions: [
            Transition {
                NumberAnimation { properties: "x,y,scale,opacity,anchors.topMargin"; duration: 100; easing.type: Easing.InOutQuad }
            }
        ]
    }

    Item {
        id: _mainContainer

        anchors {
            fill: parent
            topMargin: _textField.type === MTextField.Type.Outlined ? 0 : (_textInput.isInForeground ? Size.pixel16 : 0)
        }

        Icon {
            id: _leftIcon

            anchors {
                left: parent.left; leftMargin: _private.isStandardType ? 0 : Size.pixel14;
                verticalCenter: parent.verticalCenter
            }

            color: Theme.text.disabled
            visible: path !== ""
            sourceSize.height: path === "" ? 0 : _textField.height * 0.3
        }

        TextInput{
            id: _textInput

            property bool isInForeground: _textInput.focus || _textInput.text !== ""

            anchors {
                right: _rightIcon.left; rightMargin: Size.pixel14
                top: parent.top
                bottom: parent.bottom
                left: _leftIcon.visible ? _leftIcon.right : parent.left
                leftMargin: _private.isStandardType && !_leftIcon.visible ? 0 : Size.pixel12
            }

            verticalAlignment: Qt.AlignVCenter
            selectByMouse: true
            clip: true
            selectedTextColor: acceptableInput ? _textField.accent.contrastText : Theme.error.contrastText
            selectionColor: acceptableInput ? _textField.accent.main : Theme.error.main

            font {
                family: PublicSans.regular
                pixelSize: Size.pixel16
            }

            HoverHandler{
                id: _hoverHandler

                enabled: !_textInput.readOnly
                cursorShape: Qt.IBeamCursor
            }
        }

        Icon {
            id: _rightIcon

            anchors {
                right: parent.right; rightMargin: Size.pixel12;
                verticalCenter: parent.verticalCenter
            }

            color: Theme.action.active
            visible: path !== ""
            interactive: true
            sourceSize.width: path === "" ? 0 : _textField.height * 0.3
        }
    }
}
