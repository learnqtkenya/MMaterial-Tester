import QtQuick

import MMaterial as MMaterial

Item {
    component ChipData: Item {
        property string text
        property MMaterial.PaletteBasic accent: MMaterial.Theme.primary
    }

    property string category

    property MMaterial.IconData icon
    property string text
    property var model

    property ChipData chip: ChipData {}

    property var onClicked


}
