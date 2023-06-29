import QtQuick 2.15
import QtQuick.Layouts

import "../../Colors"
import "../../Icons"
import "../../Settings"
import "../../Buttons"
import "../../Fonts/Texts"

Rectangle{
    id: _alert
    radius: 8
    height: _text.implicitHeight > _private.recommendedHeight ? _text.implicitHeight + _mainLayout.anchors.margins*2 : _private.recommendedHeight
    width: 720
    enum Severity { Info, Success, Warning, Error }
    enum Variant { Standard, Filled, Outlined }

    property alias actionButton: _actionButton
    property alias dismissButton: _dismissButton

    property int severity: Alert.Severity.Info
    property int variant: Alert.Variant.Filled

    property string text: ""
    property string icon: {
        if(_alert.severity == Alert.Severity.Info) return IconList.info;
        if(_alert.severity == Alert.Severity.Success) return IconList.success;
        if(_alert.severity == Alert.Severity.Warning) return IconList.alert;
        if(_alert.severity == Alert.Severity.Error) return IconList.info;
    }

    property var accent: {
        if(_alert.severity == Alert.Severity.Info) return Theme.info;
        if(_alert.severity == Alert.Severity.Success) return Theme.success;
        if(_alert.severity == Alert.Severity.Warning) return Theme.warning;
        if(_alert.severity == Alert.Severity.Error) return Theme.error;
    }

    signal clicked
    signal close

    QtObject{
        id: _private
        readonly property int recommendedHeight: Size.scale * 50
    }

    MouseArea{
        id: mouseArea
        anchors.fill: parent
        onClicked: _alert.clicked()
    }

    RowLayout{
        id: _mainLayout
        anchors{
            fill: parent
            margins: Size.pixel8
        }

        Icon{
            id: _icon
            Layout.alignment: _text.lineCount <= 1 ? Qt.AlignVCenter : Qt.AlignTop
            Layout.topMargin: _text.lineCount <= 1 ? 0 : Size.pixel6
            Layout.leftMargin: Size.pixel8
            sourceSize.height: Size.pixel24
            path: _alert.icon
        }
        B2{
            id: _text
//            Layout.preferredHeight: parent.height
            Layout.fillWidth: true
            text: _alert.text
            color: Theme.info.darker
            verticalAlignment: Qt.AlignVCenter
            Layout.leftMargin: Size.pixel12
            elide: Text.ElideNone
            wrapMode: Text.WordWrap
            lineHeight: 1
        }
        MButton{
            id: _actionButton
            type: MButton.Type.Contained
            size: Size.S
            text: ""
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            Layout.preferredHeight: recommendedHeight
            Layout.preferredWidth: recommendedWidth
            accent: _alert.accent
            visible: text != ""
        }
        MButton{
            id: _dismissButton
            type: MButton.Type.Outlined
            size: Size.S
            text: ""
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            Layout.preferredHeight: recommendedHeight
            Layout.preferredWidth: recommendedWidth
            accent: _alert.accent
            visible: text != ""
            onClicked: _alert.close()
        }
        Icon{
            id: _closeIcon
            Layout.alignment: _text.lineCount <= 1 ? Qt.AlignVCenter : Qt.AlignTop
            Layout.topMargin: _text.lineCount <= 1 ? 0 : Size.pixel6
            Layout.rightMargin: Size.pixel8
            visible: !_actionButton.visible && !_dismissButton.visible
            sourceSize.height: Size.pixel12
            path: IconList.closeX
            interactive: true
            onClicked: _alert.close()
        }
    }

    state: "standard"
    states: [
        State{
            name: "standard"
            when: _alert.variant == Alert.Variant.Standard
            PropertyChanges{ target: _alert; color: _alert.accent.lighter; border.width: 0}
            PropertyChanges{ target: _icon; color: _alert.accent.main}
            PropertyChanges{ target: _closeIcon; color: _alert.accent.main}
            PropertyChanges{ target: _text; color: _alert.accent.darker}
        },
        State{
            name: "filled"
            when: _alert.variant == Alert.Variant.Filled
            PropertyChanges{ target: _alert; color: _alert.accent.main; border.width: 0}
            PropertyChanges{ target: _icon; color: _alert.accent.contrastText}
            PropertyChanges{ target: _closeIcon; color: _alert.accent.contrastText}
            PropertyChanges{ target: _text; color: _alert.accent.contrastText}
            PropertyChanges{ target: _dismissButton; title.color: _alert.accent.contrastText; border.color: _alert.accent.contrastText }
            PropertyChanges{ target: _actionButton; title.color: Theme.main.p800; color: Theme.common.white; }
        },
        State{
            name: "outlined"
            when: _alert.variant == Alert.Variant.Outlined
            PropertyChanges{ target: _alert; color: Theme.background.main; border.width: Size.pixel1; border.color: accent.dark}
            PropertyChanges{ target: _icon; color: _alert.accent.main}
            PropertyChanges{ target: _closeIcon; color: _alert.accent.main}
            PropertyChanges{ target: _text; color: _alert.accent.dark}
        }
    ]
}

