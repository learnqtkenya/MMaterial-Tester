import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material

import MMaterial

import "../Components/Common"

Flickable {
    objectName: "Typography"

    contentHeight: _mainLayout.implicitHeight
    contentWidth: parent.width

    ScrollIndicator.vertical: MScrollIndicator{}

    ColumnLayout {
        id: _mainLayout

        readonly property string mainLabel: "And now here is my secret, a very simple secret: It is only with the heart that one can see rightly; what is essential is invisible to the eye."

        anchors.fill: parent

        spacing: 0

        Overline { text: "H1"; color: Theme.text.disabled; Layout.topMargin: Size.pixel10 }
        H1 { text: _mainLayout.mainLabel; Layout.fillWidth: true }

        Overline { text: "H2"; color: Theme.text.disabled; Layout.topMargin: Size.pixel10 }
        H2{ text: _mainLayout.mainLabel; Layout.preferredWidth: parent.width }

        Overline { text: "H3"; color: Theme.text.disabled; Layout.topMargin: Size.pixel10 }
        H3 { text: _mainLayout.mainLabel; Layout.preferredWidth: parent.width }

        Overline { text: "H4"; color: Theme.text.disabled; Layout.topMargin: Size.pixel10 }
        H4 { text: _mainLayout.mainLabel; Layout.preferredWidth: parent.width }

        Overline { text: "H5"; color: Theme.text.disabled; Layout.topMargin: Size.pixel10 }
        H5{ text: _mainLayout.mainLabel; Layout.preferredWidth: parent.width }

        Overline { text: "H6"; color: Theme.text.disabled; Layout.topMargin: Size.pixel10 }
        H6 { text: _mainLayout.mainLabel; Layout.preferredWidth: parent.width }

        Overline { text: "B1"; color: Theme.text.disabled; Layout.topMargin: Size.pixel10 }
        B1{ text: _mainLayout.mainLabel; Layout.preferredWidth: parent.width }

        Overline { text: "B2"; color: Theme.text.disabled; Layout.topMargin: Size.pixel10 }
        B2 { text: _mainLayout.mainLabel; Layout.preferredWidth: parent.width }

        Overline { text: "CAPTION"; color: Theme.text.disabled; Layout.topMargin: Size.pixel10 }
        Caption{ text: _mainLayout.mainLabel; Layout.preferredWidth: parent.width }

        Overline { text: "OVERLINE"; color: Theme.text.disabled; Layout.topMargin: Size.pixel10 }
        Overline { text: _mainLayout.mainLabel; Layout.preferredWidth: parent.width }

        Overline { text: "SUBTITLE1"; color: Theme.text.disabled; Layout.topMargin: Size.pixel10 }
        Subtitle1 { text: _mainLayout.mainLabel; Layout.preferredWidth: parent.width }

        Overline { text: "SUBTITLE2"; color: Theme.text.disabled; Layout.topMargin: Size.pixel10 }
        Subtitle2 { text: _mainLayout.mainLabel; Layout.preferredWidth: parent.width }

        Item { Layout.fillHeight: true; }
    }
}

