import QtQuick

import MMaterial as MMaterial

Item {
    id: root

    MMaterial.WaterfallChart {
        id: chart

        anchors {
            margins: MMaterial.Size.pixel20
            fill: root
        }

        chartModel: MMaterial.ChartElement {
            bars: [
                MMaterial.ChartElementBar { value: 500; name: qsTr("January") },
                MMaterial.ChartElementBar { value: 1800; name: qsTr("February") },
                MMaterial.ChartElementBar { value: -3000; name: qsTr("March") },
                MMaterial.ChartElementBar { value: 2700; name: qsTr("April") },
                MMaterial.ChartElementBar { value: 2300; name: qsTr("May") },
                MMaterial.ChartElementBar { value: 2300; name: qsTr("June") },
                MMaterial.ChartElementBar { value: 1900; name: qsTr("July") },
                MMaterial.ChartElementBar { value: 900; name: qsTr("August") },
                MMaterial.ChartElementBar { value: -900; name: qsTr("September") },
                MMaterial.ChartElementBar { value: 1600; name: qsTr("October") },
                MMaterial.ChartElementBar { value: 2800; name: qsTr("November") },
                MMaterial.ChartElementBar { value: 4800; name: qsTr("December") },
                MMaterial.ChartElementBar { value: 7200; name: qsTr("January") },
                MMaterial.ChartElementBar { value: 5600; name: qsTr("February") },
                MMaterial.ChartElementBar { value: 4100; name: qsTr("March") },
                MMaterial.ChartElementBar { value: 3500; name: qsTr("April") },
                MMaterial.ChartElementBar { value: 2900; name: qsTr("May") },
                MMaterial.ChartElementBar { value: 3800; name: qsTr("June") },
                MMaterial.ChartElementBar { value: 4600; name: qsTr("July") },
                MMaterial.ChartElementBar { value: 5200; name: qsTr("August") },
                MMaterial.ChartElementBar { value: 4400; name: qsTr("September") },
                MMaterial.ChartElementBar { value: 3200; name: qsTr("October") },
                MMaterial.ChartElementBar { value: 2000; name: qsTr("November") },
                MMaterial.ChartElementBar { value: 2500; name: qsTr("December") },
                MMaterial.ChartElementBar { value: 3700; name: qsTr("January") },
                MMaterial.ChartElementBar { value: 1800; name: qsTr("February") },
                MMaterial.ChartElementBar { value: 3000; name: qsTr("March") },
                MMaterial.ChartElementBar { value: 2700; name: qsTr("April") },
                MMaterial.ChartElementBar { value: 2300; name: qsTr("May") },
                MMaterial.ChartElementBar { value: 2300; name: qsTr("June") },
                MMaterial.ChartElementBar { value: 1900; name: qsTr("July") },
                MMaterial.ChartElementBar { value: 900; name: qsTr("August") },
                MMaterial.ChartElementBar { value: 900; name: qsTr("September") },
                MMaterial.ChartElementBar { value: 1600; name: qsTr("October") },
                MMaterial.ChartElementBar { value: 2800; name: qsTr("November") }
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
