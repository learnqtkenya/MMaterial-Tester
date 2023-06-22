import QtQuick
import QtQuick.Window

Window {
    width: 840
    height: 540
    visible: true
    title: qsTr("Hello World")

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
