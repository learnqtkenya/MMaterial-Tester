import QtQuick
import QtQuick.Window

Window {
    id: window
    width: 1440
    height: 1200
    visible: true
    title: qsTr("MMaterial")

    Loader{
        id: mainLoader
        anchors.centerIn: parent
        height: parent.height; width: parent.width;

        source: "./MainWindow.qml"

        function reload(){
            mainLoader.source = "";
            QmlEngine.clearCache();
            mainLoader.source = "./MainWindow.qml";
        }
    }

    Connections{
        target: QmlEngine

        function onReloadUI(){
            console.log("Reloading UI")
            mainLoader.reload();
        }
    }
}
