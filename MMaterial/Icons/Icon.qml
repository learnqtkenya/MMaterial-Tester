import QtQuick
import QtQuick.Controls
import QtQuick.Effects

Image{
    id: icon

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

    layer.enabled: color != ""
    layer {
        effect: MultiEffect {
            colorizationColor: icon.color
            colorization: 1
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
    Keys.onPressed: if((event.key == Qt.Key_Return || event.key == Qt.Key_Enter) && icon.interactive){ accepted(); confirmed();}
    MouseArea{
        id: mouseArea
        visible: icon.interactive || icon.tooltipEnabled
        anchors.fill: parent
        onClicked: if(icon.interactive){ icon.clicked(); }
        hoverEnabled: hoverable
        cursorShape: containsMouse && icon.interactive ? Qt.PointingHandCursor : Qt.ArrowCursor
    }

    states: [
        State {
            when: mouseArea.pressed && icon.interactive
            name: "PRESSED"
            PropertyChanges { target: icon; scale: 0.8; }
        },
        State {
            when: icon.interactive
            name: "DEFAULT"
            PropertyChanges { target: icon; scale: 1; }
        }
    ]
    transitions: [
        Transition {
            from: "PRESSED"
            NumberAnimation { target: icon; properties: "scale"; duration: 1150; easing.type: Easing.OutElastic; }
        },
        Transition {
            from: "DEFAULT"
            NumberAnimation { target: icon; properties: "scale"; duration: 70; }
        }
    ]
}




