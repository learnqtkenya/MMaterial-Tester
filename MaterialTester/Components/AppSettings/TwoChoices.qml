import QtQuick 
import QtQuick.Layouts
import MMaterial

ColumnLayout{
    property alias text: _subtitle.text
    property alias leftButton: _leftButton
    property alias rightButton: _rightButton

    Layout.fillWidth: true
    Layout.preferredHeight: childrenRect.height

    SubTitle{ id: _subtitle; }
    RowLayout{
        Layout.preferredWidth: parent.width
        Layout.preferredHeight: width/2

        MToggleButton{
            id: _leftButton
            Layout.fillWidth: true
            Layout.preferredHeight: width
            customCheckImplementation: true
        }
        MToggleButton{
            id: _rightButton
            Layout.fillWidth: true
            Layout.preferredHeight: width
            customCheckImplementation: true
        }
    }
}


