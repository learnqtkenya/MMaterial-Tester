import QtQuick

import MMaterial as MMaterial

BaseText {
    lineHeight: 1.5
    wrapMode: Text.WordWrap

    font {
        family: PublicSans.bold
        pixelSize: MMaterial.Size.pixel12
        capitalization: Font.AllUppercase
        bold: true
    }
}
