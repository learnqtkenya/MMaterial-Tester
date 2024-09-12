import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import MMaterial as MMaterial

Item {
    id: root

    property alias orientation: chartList.orientation
    property alias spacing: chartList.spacing
    property alias graphContainer: rootContainer
    property alias model: chartModel.model

    property bool autoResize: false
    property real fontSize: MMaterial.Size.pixel12
    property real barContainerWidth: MMaterial.Size.pixel48

    component VerticalBars: RowLayout {
        id: verticalDelRoot

        readonly property MMaterial.ChartElement chartElement: element
        property real contentX: 0
        property int elementIndex: index

        height: chartList.height
        width: d.verticalBarWidth

        Behavior on width {
            NumberAnimation {
                duration: 400; easing.type: Easing.InOutQuad
            }
        }

        Repeater {
            model: verticalDelRoot.chartElement

            Rectangle {
                id: subChart

                property double value: barValue
                readonly property real prefMaxHeight: chartList.height * (subChart.value / d.biggestElement)

                radius: MMaterial.Size.pixel4

                Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: barColor ?? MMaterial.Theme.getChartPatternColor(index, d.defaultColorPatterns[verticalDelRoot.elementIndex % d.defaultColorPatterns.length])

                border {
                    width: delHover.hovered ? MMaterial.Size.pixel1 * 2 : 0
                    color: Qt.lighter(subChart.color)
                }

                Behavior on border.width { NumberAnimation { duration: 150; easing.type: Easing.OutQuad } }
                NumberAnimation on Layout.maximumHeight { running: true; from: 0; to: subChart.prefMaxHeight; duration: 400; easing.type: Easing.InOutQuad }

                HoverHandler {
                    id: delHover

                    onHoveredChanged: {
                        if (delHover.hovered) {
                            tooltip.x = verticalDelRoot.contentX + subChart.x + subChart.width + MMaterial.Size.pixel8;
                            tooltip.y = verticalDelRoot.y + subChart.y + subChart.height / 2 - tooltip.height / 2;
                            tooltip.show("<b>" + barName + "</b>: " + subChart.value, 0);
                            tooltipCloseTimer.restart();
                        }
                    }
                }
            }
        }
    }


    component HorizontalBars: ColumnLayout {
        id: horizontalDelRoot

        readonly property MMaterial.ChartElement chartElement: element
        property real contentY: 0
        property int elementIndex: index

        height: d.horizontalBarHeight
        width: chartList.width

        Behavior on height {
            NumberAnimation {
                duration: 400; easing.type: Easing.InOutQuad
            }
        }

        Repeater {
            model: horizontalDelRoot.chartElement

            Rectangle {
                id: horSubChart

                property real value: barValue
                readonly property real prefMaxWidth: chartList.width * (horSubChart.value / d.biggestElement)

                radius: MMaterial.Size.pixel4

                Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: barColor ?? MMaterial.Theme.getChartPatternColor(index, d.defaultColorPatterns[horizontalDelRoot.elementIndex % d.defaultColorPatterns.length])

                border {
                    width: horDelHover.hovered ? MMaterial.Size.pixel1 * 2 : 0
                    color: Qt.lighter(horSubChart.color)
                }

                Behavior on border.width { NumberAnimation { duration: 150; easing.type: Easing.OutQuad } }
                NumberAnimation on Layout.maximumWidth { running: true; from: 0; to: horSubChart.prefMaxWidth; duration: 400; easing.type: Easing.InOutQuad }

                HoverHandler {
                    id: horDelHover

                    onHoveredChanged: {
                        if (horDelHover.hovered) {
                            tooltip.x = horSubChart.x + horSubChart.width + MMaterial.Size.pixel8;
                            tooltip.y = horizontalDelRoot.contentY + horizontalDelRoot.y + horSubChart.y + horSubChart.height / 2 - tooltip.height / 2;
                            tooltip.show("<b>" + barName + "</b>: " + horSubChart.value, 0);
                            tooltipCloseTimer.restart();
                        }
                    }
                }
            }
        }
    }

    QtObject {
        id: d

        property real biggestElement: chartModel.getMaxValue()
        readonly property real verticalBarWidth: root.autoResize ? (chartList.width - (chartList.count - 1) * chartList.spacing) / chartList.count : root.barContainerWidth
        readonly property real horizontalBarHeight: root.autoResize ? (chartList.height - (chartList.count - 1) * chartList.spacing) / chartList.count : root.barContainerWidth
        readonly property list<MMaterial.PaletteBasic> defaultColorPatterns: [MMaterial.Theme.primary, MMaterial.Theme.secondary, MMaterial.Theme.info, MMaterial.Theme.success, MMaterial.Theme.warning, MMaterial.Theme.error]

        function generateSpreadNumbers(min, max, n) {
          if (n < 2) {
            throw new Error('n must be at least 2');
          }

          if (min >= max) {
            throw new Error('min must be less than max');
          }

          const result = [];
          const step = (max - min) / (n - 1);

          for (let i = 0; i < n; i++) {
            let value = min + step * i;
            result.push(Number(value.toFixed(2)));
          }

          result[0] = Number(min.toFixed(2));
          result[n - 1] = Number(max.toFixed(2));

          return result;
        }
    }

    MMaterial.ChartModel {
        id: chartModel
    }

    ListView {
        id: valueList

        readonly property real delHeight: chartList.isHorizontalChart ? 0 : valueList.height
        readonly property real delWidth: chartList.isHorizontalChart ? valueList.width : 0

        verticalLayoutDirection: ListView.BottomToTop
        orientation: chartList.isHorizontalChart ? ListView.Vertical : ListView.Horizontal
        model: d.generateSpreadNumbers(0, chartModel.getMaxValue(), 5)
        spacing: chartList.isHorizontalChart ? chartList.height / (valueList.count - 1) : chartList.width / (valueList.count - 1)
        opacity: 0

        anchors {
            left: chartList.isHorizontalChart ? root.left : rootContainer.left
            leftMargin: chartList.isHorizontalChart ? 0 : chartList.anchors.margins
            right: chartList.isHorizontalChart ? rootContainer.left : rootContainer.right;
            rightMargin: chartList.isHorizontalChart ? MMaterial.Size.pixel8 : chartList.anchors.margins
            top: chartList.isHorizontalChart ? rootContainer.top : rootContainer.bottom
            topMargin: chartList.isHorizontalChart ? chartList.anchors.margins : MMaterial.Size.pixel8
            bottom: chartList.isHorizontalChart ? rootContainer.bottom : root.bottom
            bottomMargin: chartList.isHorizontalChart ? chartList.anchors.margins : 0
        }

        delegate: MMaterial.Caption {
            height: valueList.delHeight
            width: valueList.delWidth
            horizontalAlignment: chartList.isHorizontalChart ? Qt.AlignRight : Qt.AlignLeft
            verticalAlignment: chartList.isHorizontalChart ? Qt.AlignVCenter : Qt.AlignTop
            text: modelData
            color: MMaterial.Theme.text.disabled
            font.pixelSize: root.fontSize
        }

        NumberAnimation on opacity {
            id: valueListOpacityAnimation
            duration: 300
            running: true
            from: 0
            to: 1
        }
    }

    ListView {
        id: nameList

        property real delHeight: chartList.isHorizontalChart ? nameList.height : d.horizontalBarHeight
        property real delWidth: chartList.isHorizontalChart ? d.verticalBarWidth : nameList.width

        verticalLayoutDirection: ListView.BottomToTop
        orientation: chartList.isHorizontalChart ? ListView.Horizontal : ListView.Vertical
        model: chartModel
        spacing: chartList.spacing
        opacity: 0

        anchors {
            left: chartList.isHorizontalChart ? rootContainer.left : root.left
            leftMargin: chartList.isHorizontalChart ? chartList.anchors.margins : 0
            right: chartList.isHorizontalChart ? rootContainer.right : rootContainer.left
            rightMargin: chartList.isHorizontalChart ? chartList.anchors.margins : MMaterial.Size.pixel8
            top: chartList.isHorizontalChart ? rootContainer.bottom : rootContainer.top
            topMargin: chartList.isHorizontalChart ? MMaterial.Size.pixel8 : chartList.anchors.margins
            bottom: chartList.isHorizontalChart ? root.bottom : rootContainer.bottom
            bottomMargin: chartList.isHorizontalChart ? 0 : chartList.anchors.margins
        }

        delegate: MMaterial.Caption {
            height: nameList.delHeight
            width: nameList.delWidth
            horizontalAlignment: chartList.isHorizontalChart ? Qt.AlignHCenter : Qt.AlignRight
            verticalAlignment: chartList.isHorizontalChart ? Qt.AlignTop : Qt.AlignVCenter
            text: modelData.name
            color: MMaterial.Theme.text.disabled
            font.pixelSize: root.fontSize
        }

        Behavior on delWidth {
            enabled: chartList.isHorizontalChart && !nameListOpacityAnimation.running
            NumberAnimation {
                duration: 400; easing.type: Easing.InOutQuad
            }
        }

        Behavior on delHeight {
            enabled: !chartList.isHorizontalChart && !nameListOpacityAnimation.running
            NumberAnimation {
                duration: 400; easing.type: Easing.InOutQuad
            }
        }

        NumberAnimation on opacity {
            id: nameListOpacityAnimation
            duration: 300
            running: true
            from: 0
            to: 1
        }
    }

    Rectangle {
        id: rootContainer

        radius: MMaterial.Size.pixel12
        height: root.height - root.fontSize * 4
        width: root.width - MMaterial.Size.pixel48
        color: "transparent"

        border.width: 1
        border.color: MMaterial.Theme.action.focus

        anchors {
            right: root.right
            verticalCenter: root.verticalCenter
        }

        ListView {
            id: chartList

            readonly property bool isHorizontalChart: chartList.orientation == ListView.Horizontal

            model: chartModel
            interactive: false
            spacing: MMaterial.Size.pixel12
            orientation: ListView.Horizontal
            verticalLayoutDirection: ListView.BottomToTop

            anchors {
                fill: rootContainer
                margins: MMaterial.Size.pixel18
            }

            onIsHorizontalChartChanged: {
                valueListOpacityAnimation.restart()
                nameListOpacityAnimation.restart()
            }

            delegate: Loader {
                id: del

                sourceComponent: chartList.isHorizontalChart ? verticalComponent : horizontalComponent

                Component {
                    id: verticalComponent

                    VerticalBars {
                        contentX: del.x + chartList.contentX
                    }
                }

                Component {
                    id: horizontalComponent

                    HorizontalBars {
                        contentY: del.y - (chartList.verticalLayoutDirection == ListView.BottomToTop ? chartList.contentY : -chartList.contentY)
                    }
                }
            }

            MMaterial.MToolTip {
                id: tooltip
                delay: 300

                Timer {
                    id: tooltipCloseTimer

                    interval: 2000
                    onTriggered: tooltip.hide();
                }
            }
        }
    }
}
