import QtQuick

import MMaterial.Controls.Settings as Settings

BaseText {
    lineHeight: 1.5
    wrapMode: Text.WordWrap

    font {
        family: PublicSans.bold
        pixelSize: Settings.Size.pixel12
        capitalization: Font.AllUppercase
        bold: true
    }
}
