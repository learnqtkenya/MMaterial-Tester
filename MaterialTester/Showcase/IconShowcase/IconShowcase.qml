import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import MMaterial

import "../../Components/Common"

ColumnLayout {
    id: _root

    H2 {
        Layout.fillWidth: true

        horizontalAlignment: Qt.AlignHCenter
        text: qsTr("Heavy vs Light Icons")
    }

    RowLayout {
        id: _header

        Layout.minimumWidth: _root.width

        MButton {

            type: _stack.item?.objectName === "overview" ? MButton.Type.Contained : MButton.Type.Outlined
            text: qsTr("Overview")

            onClicked: _stack.sourceComponent = _overview
        }

        MButton {

            type: _stack.item?.objectName === "overview" ? MButton.Type.Outlined : MButton.Type.Contained
            text: qsTr("Speed comparison")

            onClicked: _stack.sourceComponent = _speedTest
        }

        Item { Layout.fillWidth: true }
    }

    Loader {
        id: _stack

        Layout.topMargin: Size.pixel30
        Layout.fillHeight: true
        Layout.minimumWidth: _root.width

        asynchronous: true
        sourceComponent: _overview

        Component {
            id: _overview

            IconOverview {}
        }

        Component {
            id: _speedTest

            IconSpeedComparison {}
        }
    }
}

