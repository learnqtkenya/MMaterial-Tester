import QtQuick
import QtQuick.Controls
import QtQuick.Effects

Image{
    id: _icon

    property string color: ""
    property string path: ""
    property string description: "" //Shown in tooltip
    property bool interactive: false
    property bool hoverable: true
    property bool containsMouse: mouseArea.containsMouse
    property bool tooltipEnabled: false
    property int tooltipTime: 0

    signal clicked

    fillMode: Image.PreserveAspectFit
    source: visible ? path : ""

    layer.enabled: _icon.color != ""
    layer {
        effect: MultiEffect {
            colorizationColor: _icon.color
            colorization: 1
            brightness: 1
        }
    }

    ToolTip.text: description
    ToolTip.visible: description != "" && tooltipEnabled && tooltipTime >= 2 ? containsMouse : false

    Timer {
        id: tooltipTimer
        interval: 500; running: tooltipEnabled && mouseArea.containsMouse; repeat: true
        onTriggered: tooltipTime+=1;
        onRunningChanged: if(!running){ tooltipTime = 0; }
    }
    Keys.onPressed: if((event.key == Qt.Key_Return || event.key == Qt.Key_Enter) && _icon.interactive){ accepted(); confirmed();}
    MouseArea{
        id: mouseArea
        visible: _icon.interactive || _icon.tooltipEnabled
        anchors.fill: parent
        onClicked: if(_icon.interactive){ _icon.clicked(); }
        hoverEnabled: hoverable
        cursorShape: containsMouse && _icon.interactive ? Qt.PointingHandCursor : Qt.ArrowCursor
    }

    states: [
        State {
            when: mouseArea.pressed && _icon.interactive
            name: "pressed"
            PropertyChanges { target: _icon; scale: 0.8; }
        },
        State {
            when: _icon.interactive
            name: "default"
            PropertyChanges { target: _icon; scale: 1; }
        }
    ]
    transitions: [
        Transition {
            from: "pressed"
            NumberAnimation { id: _clickedAnimation; target: _icon; properties: "scale"; duration: 1150; easing.type: Easing.OutElastic; }
        },
        Transition {
            from: "default"
            NumberAnimation { target: _icon; properties: "scale"; duration: 70; }
        }
    ]
}




