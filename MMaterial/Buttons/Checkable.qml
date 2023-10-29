import QtQuick 

Rectangle {
    id: _checkable

    property bool checked: false
    property bool customCheckImplementation: false

    property alias mouseArea: mouseArea

    signal clicked

    MouseArea{
        id: mouseArea

        anchors.fill: parent

        hoverEnabled: _checkable.enabled
        cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor

        onClicked: {
            _checkable.clicked();
            if(!_checkable.customCheckImplementation)
                _checkable.checked = !_checkable.checked;
        }
    }
}
