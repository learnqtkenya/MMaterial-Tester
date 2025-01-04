pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

import MMaterial.UI as UI
import MMaterial.Media as Media
import MMaterial.Controls as Controls

ColumnLayout {
    id: _root

    property string lightResult: ""
    property string heavyResult: ""

	Controls.MLoader {
        id: _loader

        Layout.topMargin: UI.Size.pixel30
        Layout.fillWidth: true
        Layout.fillHeight: true

        asynchronous: true

        sourceComponent: _startComponent
    }

    Component {
        id: _lightComponent

		IconGeneratorTimer {
			title: qsTr("Light Media.Icons");
			iconData: Media.Icons.light.android

            onFinished: (result) => { _root.lightResult = result; _loader.sourceComponent = _heavyComponent }
        }
    }

    Component {
        id: _heavyComponent

		IconGeneratorTimer {
			title: qsTr("Heavy Media.Icons");
			iconData: Media.Icons.heavy.android

            onFinished: (result) => { _root.heavyResult = result; _loader.sourceComponent = _resultComponent }
        }
    }

    Component {
        id: _resultComponent

        ColumnLayout {
            Item { Layout.fillHeight: true }

			UI.H1 {
                Layout.fillWidth: true

                horizontalAlignment: Qt.AlignHCenter
                font.pixelSize: UI.Size.pixel30
                text: qsTr("Results")
            }

			UI.H1 {
                Layout.topMargin: UI.Size.pixel12
                Layout.fillWidth: true

                font.pixelSize: UI.Size.pixel20
                horizontalAlignment: Qt.AlignHCenter
				text: qsTr("Heavy Media.Icons time: ") + _root.heavyResult
            }

			UI.H1 {
                Layout.fillWidth: true

                font.pixelSize: UI.Size.pixel20
                horizontalAlignment: Qt.AlignHCenter
				text: qsTr("Light Media.Icons time: ") + _root.lightResult
            }

			Controls.MButton {
                Layout.topMargin: UI.Size.pixel22
                Layout.alignment: Qt.AlignHCenter

                text: qsTr("Back to start")

                onClicked: _loader.sourceComponent = _startComponent
            }

            Item { Layout.fillHeight: true }
        }
    }

    Component {
        id: _startComponent

        ColumnLayout {
            Item { Layout.fillHeight: true }

			UI.H1 {
                Layout.fillWidth: true

                horizontalAlignment: Qt.AlignHCenter
                font.pixelSize: UI.Size.pixel30
				text: qsTr("Press start to compare heavy and light Media.Icons loading time")
            }

			Controls.MButton {
                Layout.topMargin: UI.Size.pixel22
                Layout.alignment: Qt.AlignHCenter

                text: qsTr("Start")

                onClicked: _loader.sourceComponent = _lightComponent
            }

            Item { Layout.fillHeight: true }
        }
    }
}
