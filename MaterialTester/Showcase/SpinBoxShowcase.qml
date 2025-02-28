import QtQuick
import QtQuick.Layouts

import MMaterial.UI as UI
import MMaterial.Controls as Controls

ColumnLayout {
	id: root

	spacing: UI.Size.pixel16

	UI.H6 { text: qsTr("SpinBox") }

	Controls.SpinBox { Layout.topMargin: UI.Size.pixel8 }

	UI.Overline {
		id: _title

		Layout.alignment: Qt.AlignLeft | Qt.AlignTop
		Layout.topMargin: UI.Size.pixel10
		Layout.minimumWidth: UI.Size.pixel10
		Layout.preferredWidth: root.width

		text: qsTr("It ain't much, but it's honest work")

		wrapMode: Text.WordWrap
		color: UI.Theme.text.disabled
		font.capitalization: Font.AllUppercase
	}

	Item { Layout.fillHeight: true }
}
