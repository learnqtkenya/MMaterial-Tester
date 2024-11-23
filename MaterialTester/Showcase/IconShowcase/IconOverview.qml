import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material

import MMaterial
import MaterialTester

ColumnLayout {
    id: _root
    objectName: "overview"

    component ComparissonSide: Rectangle {
        id: _comparisonRoot

        property string title
        property string description
        property bool checked

        Layout.fillWidth: true
        Layout.fillHeight: true

        radius: _comparator.radius
        color: _comparisonRoot.checked ? Theme.primary.light : Theme.main.p400

        B2 {
            anchors.fill: parent
            anchors.margins: Size.pixel12
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter

            text: _comparisonRoot.title
            color: _comparisonRoot.checked ? Theme.primary.contrastText : Theme.main.p100

            MToolTip {
                visible: _comparator.containsMouse
                delay: 0
                text: _comparisonRoot.description
            }
        }
    }


    IconList {
        id: iconModel
        iconList: Icons.getAll();
    }

    ListView {
        id: _comparisonList

        Layout.topMargin: Size.pixel24
        Layout.preferredHeight: contentHeight
        Layout.fillWidth: true

        interactive: false
        spacing: Size.pixel8

        header: RowLayout {
            height: Size.pixel32
            width: _comparisonList.width

            Overline {
                Layout.alignment: Qt.AlignTop
                Layout.fillWidth: true

                color: Theme.text.disabled
                font.capitalization: Font.AllUppercase
                text: qsTr("Heavy Icons")
                horizontalAlignment: Qt.AlignHCenter
            }

            Overline {
                Layout.alignment: Qt.AlignTop
                Layout.fillWidth: true

                color: Theme.text.disabled
                font.capitalization: Font.AllUppercase
                text: qsTr("Light Icons")
                horizontalAlignment: Qt.AlignHCenter
            }
        }

        model: ListModel {
            ListElement {
                mainTitle: qsTr("Rendering speed")
                heavyChecked: false; heavyDescription: qsTr("Heavy icons are based on images, which render slower")
                lightChecked: true; lightDescription: qsTr("Light icons are based on fonts which render faster")
            }
            ListElement {
                mainTitle: qsTr("Batching")
                heavyChecked: false; heavyDescription: qsTr("Each (colored) heavy icon is in a separate batch")
                lightChecked: true; lightDescription: qsTr("Light icons are batched together, which is faster")
            }
            ListElement {
                mainTitle: qsTr("Coloring precision")
                heavyChecked: false; heavyDescription: qsTr("Heavy icons sometimes color whole image, which is not always desired")
                lightChecked: true; lightDescription: qsTr("Light icons are always colored correctly")
            }
            ListElement {
                mainTitle: qsTr("Reliability")
                heavyChecked: true; heavyDescription: qsTr("100% reliable")
                lightChecked: false; lightDescription: qsTr("Sometimes it renders wrong, mostly because of bad font implementation")
            }
            ListElement {
                mainTitle: qsTr("Flexibility")
                heavyChecked: true; heavyDescription: qsTr("Heavy icons can be changed by various effects, since it's based on an image")
                lightChecked: false; lightDescription: qsTr("What you see is what you get")
            }
        }

        delegate: AbstractListItem {
            id: _comparator

            height: Size.pixel30
            width: _comparisonList.width

            RowLayout {
                anchors.fill: _comparator

                ComparissonSide {
                    checked: heavyChecked
                    description: heavyDescription
                    title: mainTitle
                }
                ComparissonSide {
                    checked: lightChecked
                    description: lightDescription
                    title: mainTitle
                }
            }
        }
    }

    MTextField {
        id: searchInput

        Layout.topMargin: Size.pixel24
        Layout.fillWidth: true

        type: MTextField.Type.Outlined
        accent: Theme.primary
        placeholder: qsTr("Search ...")
        leftIcon.iconData: Icons.light.search

        onTextChanged: iconList.model.setFilterRegularExpression(searchInput.text)
    }

    GridView {
        id: iconList

        Layout.topMargin: Size.pixel24
        Layout.fillHeight: true
        Layout.fillWidth: true

        clip: true
        model: iconModel.iconFilterProxyModel
        flickDeceleration: 1000

        cellHeight: Size.pixel46 * 2.5
        cellWidth: iconList.width / Math.floor(iconList.width / (Size.pixel64 * 2.5))

        cacheBuffer: 1000

        delegate: AbstractListItem {
            id: _delegate
            height: iconList.cellHeight - Size.pixel12
            width: iconList.cellWidth - Size.pixel12

            onClicked: {
                Clipboard.setText(iconNameLabel.text)
                alertsController.activate(qsTr("'%1' copied to clipboard.").arg(iconNameLabel.text))
            }

            ColumnLayout {
                anchors {
                    fill: _delegate
                    margins: Size.pixel8
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: Size.pixel8

                    Item { Layout.fillWidth: true }

                    Icon {
                        Layout.maximumWidth: Size.pixel30
                        size: Size.pixel30
                        iconData: Icons.heavy[model.display] ?? null

                        color: Theme.text.primary
                    }

                    Rectangle {
                        Layout.fillHeight: true
                        Layout.preferredWidth: 1

                        color: Theme.text.secondary
                    }

                    Icon {
                        Layout.maximumWidth: Size.pixel30

                        size: Size.pixel30
                        iconData: Icons.light[model.display] ?? null

                        color: Theme.text.primary
                    }

                    Item { Layout.fillWidth: true }
                }

                B2 {
                    id: iconNameLabel

                    Layout.alignment: Qt.AlignHCenter
                    Layout.fillWidth: true

                    text: model.display
                    horizontalAlignment: Qt.AlignHCenter
                    verticalAlignment: Qt.AlignVCenter
                    color: Theme.text.secondary

                    font {
                        capitalization: Font.MixedCase
                        pixelSize: Size.pixel10
                    }
                }
            }
        }
    }
}

