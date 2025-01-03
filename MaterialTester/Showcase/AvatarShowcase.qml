import QtQuick
import QtQuick.Layouts

import MMaterial.UI as UI
import MMaterial.Controls as Controls
import MMaterial.Controls.Inputs as Inputs

Item {
    id: root

    RowLayout {
        anchors.centerIn: root
        spacing: UI.Size.pixel48 * 2

        ColumnLayout {
            spacing: UI.Size.pixel20

			UI.Overline { text: qsTr("Avatar Input\n(Drag or click)"); color: UI.Theme.text.disabled; horizontalAlignment: Qt.AlignHCenter; Layout.alignment: Qt.AlignHCenter }

			Inputs.AvatarInput {
                id: avatarInput

                Layout.alignment: Qt.AlignHCenter
            }

			Controls.MButton {
                Layout.alignment: Qt.AlignHCenter
                text: qsTr("Clear")
				accent: UI.Theme.error

                onClicked: avatarInput.removeImage()
            }
        }

        ColumnLayout {
            Layout.alignment: Qt.AlignTop
            spacing: UI.Size.pixel20

			UI.Overline { text: qsTr("Avatar\n(Preview)"); color: UI.Theme.text.disabled; horizontalAlignment: Qt.AlignHCenter; Layout.alignment: Qt.AlignHCenter }

			Controls.Avatar {
                id: avatar

                Layout.alignment: Qt.AlignHCenter
                source: avatarInput.source
            }
        }
    }
}
