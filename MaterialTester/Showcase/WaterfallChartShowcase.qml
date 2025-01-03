import QtQuick

import MMaterial.UI as UI
import MMaterial.Charts as Charts

Item {
    id: root

    Charts.WaterfallChart {
        id: chart

        anchors {
            margins: UI.Size.pixel10
            topMargin: UI.Size.pixel30
            fill: root
        }

        chartModel: Charts.ChartElement {
            bars: [
                Charts.ChartElementBar { value: 500; name: qsTr("January") },
                Charts.ChartElementBar { value: 1800; name: qsTr("February") },
                Charts.ChartElementBar { value: -3000; name: qsTr("March") },
                Charts.ChartElementBar { value: 2700; name: qsTr("April") },
                Charts.ChartElementBar { value: 2300; name: qsTr("May") },
                Charts.ChartElementBar { value: 2300; name: qsTr("June") },
                Charts.ChartElementBar { value: 1900; name: qsTr("July") },
                Charts.ChartElementBar { value: 900; name: qsTr("August") },
                Charts.ChartElementBar { value: -900; name: qsTr("September") },
                Charts.ChartElementBar { value: 1600; name: qsTr("October") },
                Charts.ChartElementBar { value: 2800; name: qsTr("November") },
                Charts.ChartElementBar { value: 4800; name: qsTr("December") },
                Charts.ChartElementBar { value: 7200; name: qsTr("January") },
                Charts.ChartElementBar { value: 5600; name: qsTr("February") },
                Charts.ChartElementBar { value: 4100; name: qsTr("March") },
                Charts.ChartElementBar { value: 3500; name: qsTr("April") },
                Charts.ChartElementBar { value: 2900; name: qsTr("May") },
                Charts.ChartElementBar { value: 3800; name: qsTr("June") },
                Charts.ChartElementBar { value: 4600; name: qsTr("July") },
                Charts.ChartElementBar { value: 5200; name: qsTr("August") },
                Charts.ChartElementBar { value: 4400; name: qsTr("September") },
                Charts.ChartElementBar { value: 3200; name: qsTr("October") },
                Charts.ChartElementBar { value: 2000; name: qsTr("November") },
                Charts.ChartElementBar { value: 2500; name: qsTr("December") },
                Charts.ChartElementBar { value: 3700; name: qsTr("January") },
                Charts.ChartElementBar { value: 1800; name: qsTr("February") },
                Charts.ChartElementBar { value: 3000; name: qsTr("March") },
                Charts.ChartElementBar { value: 2700; name: qsTr("April") },
                Charts.ChartElementBar { value: 2300; name: qsTr("May") },
                Charts.ChartElementBar { value: 2300; name: qsTr("June") },
                Charts.ChartElementBar { value: 1900; name: qsTr("July") },
                Charts.ChartElementBar { value: 900; name: qsTr("August") },
                Charts.ChartElementBar { value: 900; name: qsTr("September") },
                Charts.ChartElementBar { value: 1600; name: qsTr("October") },
                Charts.ChartElementBar { value: 2800; name: qsTr("November") }
            ]
        }
    }

    Timer {
        interval: 500
        running: true
        repeat: true
        onTriggered: {
            let newBar = chart.chartModel.createEmpty();
            let isRandomNegative = Math.random() < 0.5;
            newBar.name = d.getMonthName(chart.chartList.count % 12);

            let newValue = Math.floor(Math.random() * 3001) * (isRandomNegative ? -1 : 1) + chart.chartModel.at(chart.chartList.count - 1).value
            newBar.value = newValue

            chart.chartModel.insert(chart.chartList.count, newBar);
        }
    }

    QtObject {
        id: d

        function getMonthName(monthNumber) {
            var date = new Date(2000, monthNumber - 1, 1);
            return date.toLocaleString(Qt.locale(), "MMMM");
        }
    }
}
