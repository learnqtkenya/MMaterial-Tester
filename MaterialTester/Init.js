.pragma library

function setupFonts(UI) {
    UI.Font.normalFamilyPath = "qrc:/qt/qml/MaterialTester/fonts/Public_Sans/PublicSans-VariableFont_wght.ttf";
    UI.Font.bodyFamilyPath = "qrc:/qt/qml/MaterialTester/fonts/Public_Sans/PublicSans-VariableFont_wght.ttf";
    UI.Font.italicFamilyPath = "qrc:/qt/qml/MaterialTester/fonts/Public_Sans/PublicSans-Italic-VariableFont_wght.ttf";
    UI.Font.monospaceFamilyPath = "qrc:/qt/qml/MaterialTester/fonts/Roboto_Mono/RobotoMono-VariableFont_wght.ttf";
}

function initialize(UI) {
    setupFonts(UI);
}
