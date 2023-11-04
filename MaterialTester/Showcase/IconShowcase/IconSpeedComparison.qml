import QtQuick
import QtQuick.Layouts

import MMaterial

ColumnLayout {
    id: _root

    property string lightResult: ""
    property string heavyResult: ""

    MLoader {
        id: _loader

        Layout.topMargin: Size.pixel30
        Layout.fillWidth: true
        Layout.fillHeight: true

        asynchronous: true

        sourceComponent: _startComponent
    }

    Component {
        id: _lightComponent

        IconGeneratorTimer {
            title: qsTr("Light icons");
            iconData: Icons.light.logo

            onFinished: (result) => { _root.lightResult = result; _loader.sourceComponent = _heavyComponent }
        }
    }

    Component {
        id: _heavyComponent

        IconGeneratorTimer {
            title: qsTr("Heavy icons");
            iconData: Icons.heavy.logo

            onFinished: (result) => { _root.heavyResult = result; _loader.sourceComponent = _resultComponent }
        }
    }

    Component {
        id: _resultComponent

        ColumnLayout {
            Item { Layout.fillHeight: true }

            H1 {
                Layout.fillWidth: true

                horizontalAlignment: Qt.AlignHCenter
                font.pixelSize: Size.pixel30
                text: qsTr("Results")
            }

            H1 {
                Layout.topMargin: Size.pixel12
                Layout.fillWidth: true

                font.pixelSize: Size.pixel20
                horizontalAlignment: Qt.AlignHCenter
                text: qsTr("Heavy icons time: ") + _root.heavyResult
            }

            H1 {
                Layout.fillWidth: true

                font.pixelSize: Size.pixel20
                horizontalAlignment: Qt.AlignHCenter
                text: qsTr("Light icons time: ") + _root.lightResult
            }

            MButton {
                Layout.topMargin: Size.pixel22
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

            H1 {
                Layout.fillWidth: true

                horizontalAlignment: Qt.AlignHCenter
                font.pixelSize: Size.pixel30
                text: qsTr("Press start to compare heavy and light icons loading time")
            }

            MButton {
                Layout.topMargin: Size.pixel22
                Layout.alignment: Qt.AlignHCenter

                text: qsTr("Start")

                onClicked: _loader.sourceComponent = _lightComponent
            }

            Item { Layout.fillHeight: true }
        }
    }
}
