import QtQuick

import MMaterial.Controls.Settings as Settings

BaseText {
    elide: Text.ElideRight
    lineHeight: 1

    font {
        family: PublicSans.extraBold
        pixelSize: Settings.Size.pixel64
    }
}
