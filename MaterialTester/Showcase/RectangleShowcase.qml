import QtQuick
import QtQuick.Layouts

import MMaterial.Controls as Controls
import MMaterial.UI as UI

ColumnLayout {
    id: _root

	UI.Overline {
        id: _title

        Layout.fillWidth: true
		color: UI.Theme.text.disabled
        font.capitalization: Font.AllUppercase
        text: "MRectangle"
    }

	UI.B2 {
        Layout.fillWidth: true

        elide: Text.ElideNone
        wrapMode: Text.WordWrap
        text: qsTr("Similar to regular rectangle. \nCan be used for irregular shapes. Does not support transparent colors.")
    }

    ListView {
        id: _mainLayout

        Layout.topMargin: UI.Size.pixel30
        Layout.fillWidth: true
        Layout.fillHeight: true

        clip: true
        spacing: UI.Size.pixel20

        model: ObjectModel {
			Controls.MRectangle {
                height: UI.Size.pixel40 * 2
                width: height
            }

			Controls.MRectangle {
                height: UI.Size.pixel40 * 2
                width: height

                radius.topLeft: 10
                radius.topRight: 20
                radius.bottomLeft: 30
                radius.bottomRight: 40
            }

			Controls.MRectangle {
                height: UI.Size.pixel40 * 2
                width: height

                radius.topLeft: 20
            }

		   Controls.MRectangle {
                height: UI.Size.pixel40 * 2
                width: height

                radius.topLeft: 20
                radius.topRight: 20
            }

			Controls.MRectangle {
                height: UI.Size.pixel40 * 2
                width: height

                radius.topLeft: 40
                radius.topRight: 20
                radius.bottomLeft: 20
                radius.bottomRight: 40
            }

			Controls.MRectangle {
                height: UI.Size.pixel40 * 2
                width: height

                radius.topLeft: height / 2
                radius.topRight: height / 2
                radius.bottomLeft: height / 2
                radius.bottomRight: height / 2
            }
        }
    }
}
