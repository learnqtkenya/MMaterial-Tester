import QtQuick
import QtQuick.Layouts

import MMaterial.UI as UI
import MMaterial.Controls as Controls
import MMaterial.Network
import MMaterial.Controls.Inputs as Inputs

Item {
	id: _root
	objectName: "Intro"

	function addDownload() {
		downloadDialog.downloadModel.addDownload(textField.text);
		textField.text = "";
	}

	ColumnLayout {
		anchors.bottom: _root.bottom
		spacing: UI.Size.pixel16

		Inputs.TextField {
			id: textField
			placeholderText: qsTr("Add URL")
			text: ""
			onAccepted: _root.addDownload();
		}

		RowLayout {
			spacing: UI.Size.pixel20

			Controls.MButton {
				text: qsTr("Add download")
				onClicked: _root.addDownload();
			}

			Controls.MButton {
				text: qsTr("Toggle dialog")
				accent: UI.Theme.defaultNeutral
				type: Controls.MButton.Outlined
				onClicked: downloadDialog.opened ? downloadDialog.close() : downloadDialog.open()
			}
		}
	}

	DownloadDialog {
		id: downloadDialog

		visible: true

		downloadModel.onError: (errorString) => {
								   Controls.AlertController.alert(errorString, {"severity": Controls.Alert.Severity.Error});
							   }
	}
}
