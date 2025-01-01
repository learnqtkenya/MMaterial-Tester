import QtQuick

import MMaterial as MMaterial

MMaterial.BaseText {
    lineHeight: 1.5
    elide: Text.ElideRight

    font {
        family: PublicSans.bold
        pixelSize: MMaterial.Size.pixel18
        bold: true
    }
}
