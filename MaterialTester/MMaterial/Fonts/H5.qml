import QtQuick

import MMaterial.Controls.Settings as Settings

BaseText {
    lineHeight: 1.3
    elide: Text.ElideRight

    font {
        family: PublicSans.bold
        pixelSize: Settings.Size.pixel20
    }
}
