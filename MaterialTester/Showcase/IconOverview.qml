pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

import MMaterial.UI as UI
import MMaterial.Controls as Controls
import MMaterial.Controls.Inputs as Inputs
import MMaterial.Media as Media
import MaterialTester

ColumnLayout {
    id: _root
    objectName: "overview"

    component ComparissonSide: Rectangle {
        id: _comparisonRoot

        property string title
        property string description
        property bool checked
		property bool showTooltip: false

        Layout.fillWidth: true
        Layout.fillHeight: true

		color: _comparisonRoot.checked ? UI.Theme.primary.light : UI.Theme.main.p400

		UI.B2 {
            anchors.fill: parent
            anchors.margins: UI.Size.pixel12
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter

            text: _comparisonRoot.title
			color: _comparisonRoot.checked ? UI.Theme.primary.contrastText : UI.Theme.main.p100

			Controls.MToolTip {
				visible: _comparisonRoot.showTooltip
                delay: 0
                text: _comparisonRoot.description
            }
        }
    }


	IconList {
        id: iconModel
        iconList: Media.Icons.getAll();
    }

    ListView {
        id: _comparisonList

        Layout.topMargin: UI.Size.pixel24
        Layout.preferredHeight: contentHeight
        Layout.fillWidth: true

        interactive: false
        spacing: UI.Size.pixel8

        header: RowLayout {
            height: UI.Size.pixel32
            width: _comparisonList.width

            UI.Overline {
                Layout.alignment: Qt.AlignTop
                Layout.fillWidth: true

				color: UI.Theme.text.disabled
                font.capitalization: Font.AllUppercase
                text: qsTr("Heavy Media.Icons")
                horizontalAlignment: Qt.AlignHCenter
            }

            UI.Overline {
                Layout.alignment: Qt.AlignTop
                Layout.fillWidth: true

				color: UI.Theme.text.disabled
                font.capitalization: Font.AllUppercase
                text: qsTr("Light Media.Icons")
                horizontalAlignment: Qt.AlignHCenter
            }
        }

        model: ListModel {
            ListElement {
                mainTitle: qsTr("Rendering speed")
                heavyChecked: false; heavyDescription: qsTr("Heavy Media.Icons are based on images, which render slower")
                lightChecked: true; lightDescription: qsTr("Light Media.Icons are based on fonts which render faster")
            }
            ListElement {
                mainTitle: qsTr("Batching")
                heavyChecked: false; heavyDescription: qsTr("Each (colored) heavy icon is in a separate batch")
                lightChecked: true; lightDescription: qsTr("Light Media.Icons are batched together, which is faster")
            }
            ListElement {
                mainTitle: qsTr("Coloring precision")
                heavyChecked: false; heavyDescription: qsTr("Heavy Media.Icons sometimes color whole image, which is not always desired")
                lightChecked: true; lightDescription: qsTr("Light Media.Icons are always colored correctly")
            }
            ListElement {
                mainTitle: qsTr("Reliability")
                heavyChecked: true; heavyDescription: qsTr("100% reliable")
                lightChecked: false; lightDescription: qsTr("Sometimes it renders wrong, mostly because of bad font implementation")
            }
            ListElement {
                mainTitle: qsTr("Flexibility")
                heavyChecked: true; heavyDescription: qsTr("Heavy Media.Icons can be changed by various effects, since it's based on an image")
                lightChecked: false; lightDescription: qsTr("What you see is what you get")
            }
        }

		delegate: Controls.AbstractListItem {
            id: _comparator

			required property bool heavyChecked
			required property bool lightChecked
			required property string mainTitle
			required property string heavyDescription
			required property string lightDescription

            height: UI.Size.pixel30
            width: _comparisonList.width

            RowLayout {
                anchors.fill: _comparator

                ComparissonSide {
					checked: _comparator.heavyChecked
					description: _comparator.heavyDescription
					title: _comparator.mainTitle
					radius: _comparator.radius
					showTooltip: _comparator.containsMouse
                }

                ComparissonSide {
					checked: _comparator.lightChecked
					description: _comparator.lightDescription
					title: _comparator.mainTitle
					radius: _comparator.radius
					showTooltip: _comparator.containsMouse
                }
            }
        }
    }

	Inputs.TextField {
        id: searchInput

        Layout.topMargin: UI.Size.pixel24
        Layout.fillWidth: true

		type: Inputs.TextField.Type.Outlined
		accent: UI.Theme.primary
		placeholderText: qsTr("Search ...")
        leftIcon.iconData: Media.Icons.light.search

        onTextChanged: iconList.model.setFilterRegularExpression(searchInput.text)
    }

    GridView {
        id: iconList

        Layout.topMargin: UI.Size.pixel24
        Layout.fillHeight: true
        Layout.fillWidth: true

        clip: true
        model: iconModel.iconFilterProxyModel
        flickDeceleration: 1000

        cellHeight: UI.Size.pixel46 * 2.5
		cellWidth: iconList.width / Math.floor(iconList.width / (UI.Size.pixel64 * 2.5))

        cacheBuffer: 1000

		delegate: Controls.AbstractListItem {
            id: _delegate

			required property var display

            height: iconList.cellHeight - UI.Size.pixel12
			width: iconList.cellWidth - UI.Size.pixel12

            onClicked: {
                Clipboard.setText(iconNameLabel.text)
				Controls.AlertController.alert(qsTr("'%1' copied to clipboard.").arg(iconNameLabel.text))
            }

            ColumnLayout {
                anchors {
                    fill: _delegate
                    margins: UI.Size.pixel8
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: UI.Size.pixel8

                    Item { Layout.fillWidth: true }

					Media.Icon {
                        Layout.maximumWidth: UI.Size.pixel30
                        size: UI.Size.pixel30
						iconData: Media.Icons.heavy[_delegate.display] ?? null

						color: UI.Theme.text.primary.toString()
                    }

                    Rectangle {
                        Layout.fillHeight: true
                        Layout.preferredWidth: 1

						color: UI.Theme.text.secondary
                    }

					Media.Icon {
                        Layout.maximumWidth: UI.Size.pixel30

                        size: UI.Size.pixel30
						iconData: Media.Icons.light[_delegate.display] ?? null

						color: UI.Theme.text.primary.toString()
                    }

                    Item { Layout.fillWidth: true }
                }

				UI.B2 {
                    id: iconNameLabel

                    Layout.alignment: Qt.AlignHCenter
                    Layout.fillWidth: true

					text: _delegate.display
                    horizontalAlignment: Qt.AlignHCenter
                    verticalAlignment: Qt.AlignVCenter
					color: UI.Theme.text.secondary

                    font {
                        capitalization: Font.MixedCase
                        pixelSize: UI.Size.pixel10
                    }
                }
            }
        }
    }
}

