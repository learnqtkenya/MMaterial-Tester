import QtQuick 

import MMaterial.UI as UI

Rectangle {
	property var accent: UI.Theme.error //Needs to be PaletteBasic type
    property int pixelSize: UI.Size.pixel24

	radius: height / 2
    height: pixelSize
    width: pixelSize
    color: accent.main
}
