import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material

import MMaterial.UI as UI
import MMaterial.Controls as Controls

Flickable {
    objectName: "Typography"

    contentHeight: _mainLayout.implicitHeight
    contentWidth: parent.width

	ScrollIndicator.vertical: Controls.MScrollIndicator{}

    ColumnLayout {
        id: _mainLayout

        readonly property string mainLabel: "And now here is my secret, a very simple secret: It is only with the heart that one can see rightly; what is essential is invisible to the eye."

        anchors.fill: parent

        spacing: 0

		UI.Overline { text: "H1"; color: UI.Theme.text.disabled; Layout.topMargin: UI.Size.pixel10 }
        UI.H1 { text: _mainLayout.mainLabel; Layout.fillWidth: true }

		UI.Overline { text: "H2"; color: UI.Theme.text.disabled; Layout.topMargin: UI.Size.pixel10 }
		UI.H2{ text: _mainLayout.mainLabel; Layout.preferredWidth: parent.width }

		UI.Overline { text: "H3"; color: UI.Theme.text.disabled; Layout.topMargin: UI.Size.pixel10 }
		UI.H3 { text: _mainLayout.mainLabel; Layout.preferredWidth: parent.width }

		UI.Overline { text: "H4"; color: UI.Theme.text.disabled; Layout.topMargin: UI.Size.pixel10 }
		UI.H4 { text: _mainLayout.mainLabel; Layout.preferredWidth: parent.width }

		UI.Overline { text: "H5"; color: UI.Theme.text.disabled; Layout.topMargin: UI.Size.pixel10 }
		UI.H5{ text: _mainLayout.mainLabel; Layout.preferredWidth: parent.width }

		UI.Overline { text: "H6"; color: UI.Theme.text.disabled; Layout.topMargin: UI.Size.pixel10 }
        UI.H6 { text: _mainLayout.mainLabel; Layout.preferredWidth: parent.width }

		UI.Overline { text: "B1"; color: UI.Theme.text.disabled; Layout.topMargin: UI.Size.pixel10 }
        UI.B1{ text: _mainLayout.mainLabel; Layout.preferredWidth: parent.width }

		UI.Overline { text: "B2"; color: UI.Theme.text.disabled; Layout.topMargin: UI.Size.pixel10 }
		UI.B2 { text: _mainLayout.mainLabel; Layout.preferredWidth: parent.width }

		UI.Overline { text: "CAPTION"; color: UI.Theme.text.disabled; Layout.topMargin: UI.Size.pixel10 }
		UI.Caption{ text: _mainLayout.mainLabel; Layout.preferredWidth: parent.width }

		UI.Overline { text: "OVERLINE"; color: UI.Theme.text.disabled; Layout.topMargin: UI.Size.pixel10 }
        UI.Overline { text: _mainLayout.mainLabel; Layout.preferredWidth: parent.width }

		UI.Overline { text: "SUBTITLE1"; color: UI.Theme.text.disabled; Layout.topMargin: UI.Size.pixel10 }
		UI.Subtitle1 { text: _mainLayout.mainLabel; Layout.preferredWidth: parent.width }

		UI.Overline { text: "SUBTITLE2"; color: UI.Theme.text.disabled; Layout.topMargin: UI.Size.pixel10 }
		UI.Subtitle2 { text: _mainLayout.mainLabel; Layout.preferredWidth: parent.width }

        Item { Layout.fillHeight: true; }
    }
}

