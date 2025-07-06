import QtQuick 
import QtQuick.Controls.Material
import QtQuick.Layouts

import MMaterial.UI as UI
import MMaterial.Media as Media
import MMaterial.Controls.Inputs as Inputs

Drawer {
    id: _appSettings

    function toggle() : void {
        if(_appSettings.opened)
            _appSettings.close();
        else
            _appSettings.open();
    }

    edge: Qt.RightEdge
    interactive: false
    modal: false
    dim: false

    width: 300 * UI.Size.scale
    height: Screen.height

    background: Rectangle {
        gradient: Gradient {
            orientation: Gradient.Vertical

            GradientStop { position: 0.0; color: UI.Theme.background.paper }
            GradientStop { position: 1.0; color: UI.Theme.background.main }
        }
    }

    RowLayout {
        id: _header

        anchors{
            left: parent.left; leftMargin: UI.Size.pixel18
            right: parent.right; rightMargin: UI.Size.pixel18
            top: parent.top
        }

        height: UI.Size.scale * 60

        UI.Overline {
            id: _title

            Layout.preferredHeight: _header.height
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            Layout.fillWidth: true

            text: qsTr("Settings")
            verticalAlignment: Qt.AlignVCenter
            color: UI.Theme.text.secondary
            font.pixelSize: UI.Size.pixel16
        }

        Media.Icon {
            Layout.alignment: Qt.AlignVCenter

            iconData: Media.Icons.light.close
            size: UI.Size.pixel14
			color: UI.Theme.main.p600.toString()
            interactive: true

            onClicked: _appSettings.toggle()
        }
    }

    Rectangle { id: _splitter; height: UI.Size.pixel1; width: parent.width; color: UI.Theme.main.p300; anchors { top: _header.bottom; topMargin: UI.Size.pixel4 } }

    ColumnLayout {
        anchors {
            top: _header.bottom; bottom: parent.bottom
            left: parent.left; right: parent.right
            margins: UI.Size.pixel18
        }

        TwoChoices {
            text: qsTr("Mode")

            leftButton {
                icon.iconData: Media.Icons.light.lightMode
				onClicked: UI.Theme.currentTheme = UI.LightTheme;
				checked: UI.Theme.currentTheme == UI.LightTheme;
            }

            rightButton {
                icon.iconData: Media.Icons.light.darkMode
				onClicked: UI.Theme.currentTheme = UI.DarkTheme;
				checked: UI.Theme.currentTheme == UI.DarkTheme;
            }
        }

        SubTitle {
            text: qsTr("Presets")
        }

        GridLayout {
            Layout.fillWidth: true

            columns: 3

            rowSpacing: UI.Size.pixel16
            columnSpacing: UI.Size.pixel16

			PresetButton{ accent: UI.BasicBlue }
			PresetButton{ accent: UI.BasicGreen }
			PresetButton{ accent: UI.BasicLightBlue }
			PresetButton{ accent: UI.BasicOrange }
			PresetButton{ accent: UI.BasicPurple }
			PresetButton{ accent: UI.BasicRed }
        }

        SubTitle {
            text: qsTr("Font")
        }
        ListModel {
            id: fontModel
            ListElement { displayName: "PublicSans (default)";
                normalFamilyPath:    "qrc:/qt/qml/MMaterial/UI/fonts/Public_Sans/PublicSans-VariableFont_wght.ttf"
                bodyFamilyPath:      "qrc:/qt/qml/MMaterial/UI/fonts/Public_Sans/PublicSans-VariableFont_wght.ttf"
                italicFamilyPath:    "qrc:/qt/qml/MMaterial/UI/fonts/Public_Sans/PublicSans-Italic-VariableFont_wght.ttf"
                monospaceFamilyPath: "qrc:/qt/qml/MMaterial/UI/fonts/Roboto_Mono/RobotoMono-VariableFont_wght.ttf"
            }
            ListElement { displayName: "SourceSans3";
                normalFamilyPath:    "https://alpinemaps.org/static/SourceSans3%5Bwght%5D.ttf";
                bodyFamilyPath:      "https://alpinemaps.org/static/SourceSans3%5Bwght%5D.ttf";
                italicFamilyPath:    "https://alpinemaps.org/static/SourceSans3-Italic%5Bwght%5D.ttf";
                monospaceFamilyPath: "https://alpinemaps.org/static/SourceCodePro%5Bwght%5D.ttf";
            }
            ListElement { displayName: "Roboto";
                normalFamilyPath:    "https://alpinemaps.org/static/Roboto%5Bwdth,wght%5D.ttf";
                bodyFamilyPath:      "https://alpinemaps.org/static/Roboto%5Bwdth,wght%5D.ttf";
                italicFamilyPath:    "https://alpinemaps.org/static/Roboto-Italic%5Bwdth,wght%5D.ttf";
                monospaceFamilyPath: "https://alpinemaps.org/static/RobotoMono%5Bwght%5D.ttf";
            }
            ListElement { displayName: "Noto Sans";
                normalFamilyPath:    "https://alpinemaps.org/static/NotoSans%5Bwdth,wght%5D.ttf";
                bodyFamilyPath:      "https://alpinemaps.org/static/NotoSans%5Bwdth,wght%5D.ttf";
                italicFamilyPath:    "https://alpinemaps.org/static/NotoSans-Italic%5Bwdth,wght%5D.ttf";
                monospaceFamilyPath: "https://alpinemaps.org/static/NotoSansMono%5Bwdth,wght%5D.ttf";
            }
            ListElement { displayName: "DynaPuff + PublicSans";
                normalFamilyPath:    "https://alpinemaps.org/static/DynaPuff%5Bwdth,wght%5D.ttf";
                bodyFamilyPath:      "https://alpinemaps.org/static/PublicSans%5Bwght%5D.ttf";
                italicFamilyPath:    "https://alpinemaps.org/static/PublicSans-Italic%5Bwght%5D.ttf";
                monospaceFamilyPath: "https://alpinemaps.org/static/SourceCodePro%5Bwght%5D.ttf";
            }
            // the following does not work for webassembly due to cors errors.
            // ListElement { displayName: "SourceSans3";
            //     normalFamilyPath:    "https://github.com/google/fonts/raw/4591e3457ab8be6d70167aa6818922b91e78ab2d/ofl/sourcesans3/SourceSans3%5Bwght%5D.ttf";
            //     bodyFamilyPath:      "https://github.com/google/fonts/raw/4591e3457ab8be6d70167aa6818922b91e78ab2d/ofl/sourcesans3/SourceSans3%5Bwght%5D.ttf";
            //     italicFamilyPath:    "https://github.com/google/fonts/raw/4591e3457ab8be6d70167aa6818922b91e78ab2d/ofl/sourcesans3/SourceSans3-Italic%5Bwght%5D.ttf";
            //     monospaceFamilyPath: "https://github.com/google/fonts/raw/04b9cc0b96616b190802646dc9a6d51a25d428de/ofl/sourcecodepro/SourceCodePro%5Bwght%5D.ttf";
            // }
            // ListElement { displayName: "Roboto";
            //     normalFamilyPath:    "https://github.com/google/fonts/raw/980ecc3ef7368a861abfb636a42f0952cada6720/ofl/roboto/Roboto%5Bwdth,wght%5D.ttf";
            //     bodyFamilyPath:      "https://github.com/google/fonts/raw/980ecc3ef7368a861abfb636a42f0952cada6720/ofl/roboto/Roboto%5Bwdth,wght%5D.ttf";
            //     italicFamilyPath:    "https://github.com/google/fonts/raw/980ecc3ef7368a861abfb636a42f0952cada6720/ofl/roboto/Roboto-Italic%5Bwdth,wght%5D.ttf";
            //     monospaceFamilyPath: "https://github.com/google/fonts/raw/b01086459d9d41ece904d39155b93f7bd3a676f2/ofl/robotomono/RobotoMono%5Bwght%5D.ttf";
            // }
            // ListElement { displayName: "Noto Sans";
            //     normalFamilyPath:    "https://github.com/google/fonts/raw/b8a5c309307ae1f13ae03724fe46454ec63fad63/ofl/notosans/NotoSans%5Bwdth,wght%5D.ttf";
            //     bodyFamilyPath:      "https://github.com/google/fonts/raw/b8a5c309307ae1f13ae03724fe46454ec63fad63/ofl/notosans/NotoSans%5Bwdth,wght%5D.ttf";
            //     italicFamilyPath:    "https://github.com/google/fonts/raw/b8a5c309307ae1f13ae03724fe46454ec63fad63/ofl/notosans/NotoSans-Italic%5Bwdth,wght%5D.ttf";
            //     monospaceFamilyPath: "https://github.com/google/fonts/raw/b8a5c309307ae1f13ae03724fe46454ec63fad63/ofl/notosansmono/NotoSansMono%5Bwdth,wght%5D.ttf";
            // }
            // ListElement { displayName: "DynaPuff + PublicSans";
            //     normalFamilyPath:    "https://github.com/google/fonts/raw/19cdcec59967f4aa6defb86bd0550dff1ac43abb/ofl/dynapuff/DynaPuff%5Bwdth,wght%5D.ttf";
            //     bodyFamilyPath:      "https://github.com/google/fonts/raw/c53c4df931d3fd0122a30b06d13126cfaad8e014/ofl/publicsans/PublicSans%5Bwght%5D.ttf";
            //     italicFamilyPath:    "https://github.com/google/fonts/raw/c53c4df931d3fd0122a30b06d13126cfaad8e014/ofl/publicsans/PublicSans-Italic%5Bwght%5D.ttf";
            //     monospaceFamilyPath: "https://github.com/google/fonts/raw/04b9cc0b96616b190802646dc9a6d51a25d428de/ofl/sourcecodepro/SourceCodePro%5Bwght%5D.ttf";
            // }
        }

        Inputs.ComboBox {
            Layout.fillWidth: true
            type: Inputs.TextField.Type.Standard
            accent: UI.Theme.primary
            placeholderText: qsTr("")
            model: fontModel
            textRole: "displayName"

            onCurrentIndexChanged: {
                const item = fontModel.get(currentIndex)
                UI.Font.normalFamilyPath = item.normalFamilyPath
                UI.Font.bodyFamilyPath = item.bodyFamilyPath
                UI.Font.italicFamilyPath = item.italicFamilyPath
                UI.Font.monospaceFamilyPath = item.monospaceFamilyPath
            }
        }

        Item { Layout.fillHeight: true; }
    }
}
