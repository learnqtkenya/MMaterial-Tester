import QtQuick
import QtQuick.Layouts

import MMaterial

ColumnLayout {
    id: _root

    Overline {
        id: _title

        Layout.fillWidth: true
        color: Theme.text.disabled
        font.capitalization: Font.AllUppercase
        text: "MRectangle"
    }

    B2 {
        Layout.fillWidth: true

        elide: Text.ElideNone
        wrapMode: Text.WordWrap
        text: qsTr("Similar to regular rectangle. \nCan be used for irregular shapes. Does not support transparent colors.")
    }

    ListView {
        id: _mainLayout

        Layout.topMargin: Size.pixel30
        Layout.fillWidth: true
        Layout.fillHeight: true

        clip: true
        spacing: Size.pixel20

        model: ObjectModel {
            MRectangle {
                height: Size.pixel40 * 2
                width: height
            }

            MRectangle {
                height: Size.pixel40 * 2
                width: height

                radius.topLeft: 10
                radius.topRight: 20
                radius.bottomLeft: 30
                radius.bottomRight: 40
            }

            MRectangle {
                height: Size.pixel40 * 2
                width: height

                radius.topLeft: 20
            }

            MRectangle {
                height: Size.pixel40 * 2
                width: height

                radius.topLeft: 20
                radius.topRight: 20
            }

            MRectangle {
                height: Size.pixel40 * 2
                width: height

                radius.topLeft: 40
                radius.topRight: 20
                radius.bottomLeft: 20
                radius.bottomRight: 40
            }

            MRectangle {
                height: Size.pixel40 * 2
                width: height

                radius.topLeft: height / 2
                radius.topRight: height / 2
                radius.bottomLeft: height / 2
                radius.bottomRight: height / 2
            }
        }
    }
}
