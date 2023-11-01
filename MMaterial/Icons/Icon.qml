import QtQuick
import QtQuick.Controls
import QtQuick.Effects

Image{
    id: _root

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

    layer {
        enabled: _root.color != ""
        effect: MultiEffect {
            colorizationColor: _root.color
            colorization: 1
            brightness: 1
        }
    }

    ToolTip.text: description
    ToolTip.visible: description != "" && tooltipEnabled && tooltipTime >= 2 ? containsMouse : false

    Keys.onPressed: if((event.key == Qt.Key_Return || event.key == Qt.Key_Enter) && _root.interactive){ accepted(); confirmed();}

    states: [
        State {
            when: mouseArea.pressed && _root.interactive
            name: "pressed"
            PropertyChanges { target: _root; scale: 0.8; }
        },
        State {
            when: _root.interactive
            name: "default"
            PropertyChanges { target: _root; scale: 1; }
        }
    ]
    transitions: [
        Transition {
            from: "pressed"
            NumberAnimation { id: _clickedAnimation; target: _root; properties: "scale"; duration: 1150; easing.type: Easing.OutElastic; }
        },
        Transition {
            from: "default"
            NumberAnimation { target: _root; properties: "scale"; duration: 70; }
        }
    ]

    Timer {
        id: tooltipTimer

        interval: 500; running: tooltipEnabled && mouseArea.containsMouse; repeat: true

        onTriggered: tooltipTime+=1;
        onRunningChanged: if(!running){ tooltipTime = 0; }
    }

    MouseArea {
        id: mouseArea

        anchors.fill: _root

        visible: _root.interactive || _root.tooltipEnabled
        hoverEnabled: hoverable
        cursorShape: containsMouse && _root.interactive ? Qt.PointingHandCursor : Qt.ArrowCursor

        onClicked: if(_root.interactive){ _root.clicked(); }
    }
}




