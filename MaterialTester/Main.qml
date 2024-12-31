import QtQuick
import QtQuick.Window

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
}
