import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import MMaterial

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

            ToolTip {
                visible: _comparator.containsMouse
                delay: 0
                text: _comparisonRoot.description
            }
        }
    }

    ListView {
        id: _comparisonList

        Layout.topMargin: Size.pixel24
        Layout.preferredHeight: contentHeight
        Layout.fillWidth: true

        spacing: Size.pixel8

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

    ListView {
        id: iconList

        Layout.topMargin: Size.pixel24
        Layout.fillHeight: true
        Layout.fillWidth: true

        clip: true
        model: Icons.heavy.getAll()

        delegate: AbstractListItem {
            id: _delegate
            height: Size.pixel46
            width: iconList.width

            RowLayout {
                anchors {
                    leftMargin: Size.pixel24
                    rightMargin: Size.pixel24
                    fill: _delegate
                }

                Item { Layout.preferredWidth: iconList.width * 0.2 }
                Icon {
                    Layout.maximumWidth: Size.pixel30
                    size: Size.pixel30
                    iconData: Icons.heavy[modelData]

                    color: Theme.text.primary
                }

                B2 {
                    Layout.alignment: Qt.AlignCenter
                    Layout.fillWidth: true

                    text: modelData
                    horizontalAlignment: Qt.AlignHCenter
                    verticalAlignment: Qt.AlignVCenter

                    font {
                        capitalization: Font.Capitalize
                        pixelSize: Size.pixel16
                    }
                }

                LightIcon {
                    Layout.maximumWidth: Size.pixel30

                    size: Size.pixel30
                    iconData: Icons.light[modelData]

                    color: Theme.text.primary
                }

                Item { Layout.preferredWidth: iconList.width * 0.2 }
            }
        }
    }
}

