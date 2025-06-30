import QtQuick
import QtQuick.Window

import MMaterial.UI as UI

Window {
    id: window

    width: 1440
    height: 1200

    visible: true
    title: qsTr("MMaterial")

    Loader {
        id: mainLoader

        function reload() : void {
            mainLoader.source = "";
            QmlEngine.clearCache();
            mainLoader.source = Qt.resolvedUrl("MainWindow.qml");
		}

        height: parent.height; width: parent.width;

        source: "./MainWindow.qml"
    }

    Connections {
        target: QmlEngine

        function onReloadUI() : void {
            console.log("Reloading UI")
            mainLoader.reload();
        }
    }

    Component.onCompleted: {
        UI.Font.normalFamilyPath = "qrc:/qt/qml/MaterialTester/fonts/Public_Sans/PublicSans-VariableFont_wght.ttf"
        UI.Font.bodyFamilyPath = "qrc:/qt/qml/MaterialTester/fonts/Public_Sans/PublicSans-VariableFont_wght.ttf"
        UI.Font.italicFamilyPath = "qrc:/qt/qml/MaterialTester/fonts/Public_Sans/PublicSans-Italic-VariableFont_wght.ttf"
        UI.Font.monospaceFamilyPath = "qrc:/qt/qml/MaterialTester/fonts/Roboto_Mono/RobotoMono-VariableFont_wght.ttf"
    }
}
