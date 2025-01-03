import QtQuick
import QtQuick.Layouts

import MMaterial.Controls as Controls
import MMaterial.UI as UI

ColumnLayout {
    id: _root

    RowLayout {
        id: _header

        Layout.minimumWidth: _root.width

		Controls.MButton {
			type: _stack.item?.objectName === "overview" ? Controls.MButton.Type.Contained : Controls.MButton.Type.Outlined
            text: qsTr("Overview")

            onClicked: _stack.sourceComponent = _overview
        }

		Controls.MButton {
			type: _stack.item?.objectName === "overview" ? Controls.MButton.Type.Outlined : Controls.MButton.Type.Contained
            text: qsTr("Speed comparison")

            onClicked: _stack.sourceComponent = _speedTest
        }

        Item { Layout.fillWidth: true }
    }

	Controls.MLoader {
        id: _stack

        Layout.topMargin: UI.Size.pixel30
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

