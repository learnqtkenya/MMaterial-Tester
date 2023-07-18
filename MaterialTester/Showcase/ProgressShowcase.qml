import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

import MMaterial

import "../Components/Common"

Flickable{
    contentHeight: _progressShowcase.implicitHeight

    ScrollIndicator.vertical: MScrollIndicator{}
    ColumnLayout {
        id: _progressShowcase
        anchors.fill: parent
        property int progress: 0
        NumberAnimation on progress {
            id: _progressAnimation
            loops: Animation.Infinite
            running: true
            from: 0; to: 100
            duration: 5000
        }
        Timer{
            id: _animationTimer
            interval: 300
            onTriggered: _progressAnimation.restart();
        }

        onWidthChanged: {
            _progressAnimation.stop();
            _animationTimer.restart();
        }
        H6{
            text: qsTr("Progress Bar")
        }
        TitleRow{
            title.text: qsTr("Color")
            width: parent.width
            spacing: Size.pixel36
            grid.columns: 1
            MProgressBar{ progress: _progressShowcase.progress; accent: Theme.primary; }
            MProgressBar{ progress: _progressShowcase.progress; accent: Theme.secondary; }
            MProgressBar{ progress: _progressShowcase.progress; accent: Theme.info; }
            MProgressBar{ progress: _progressShowcase.progress; accent: Theme.success; }
            MProgressBar{ progress: _progressShowcase.progress; accent: Theme.warning; }
            MProgressBar{ progress: _progressShowcase.progress; accent: Theme.error; }
        }
        TitleRow{
            title.text: qsTr("Label")
            width: parent.width
            spacing: Size.pixel36
            grid.columns: 1
            MProgressBar{ progress: _progressShowcase.progress; accent: Theme.primary; showLabel: true }
        }
        H6{
            Layout.topMargin: Size.pixel48
            text: qsTr("Circular Progress Bar")
        }
        TitleRow{
            title.text: qsTr("Color")
            width: parent.width
            spacing: Size.pixel36
            MCircularProgressBar{ progress: _progressShowcase.progress; accent: Theme.primary; }
            MCircularProgressBar{ progress: _progressShowcase.progress; accent: Theme.secondary; }
            MCircularProgressBar{ progress: _progressShowcase.progress; accent: Theme.info; }
            MCircularProgressBar{ progress: _progressShowcase.progress; accent: Theme.success; }
            MCircularProgressBar{ progress: _progressShowcase.progress; accent: Theme.warning; }
            MCircularProgressBar{ progress: _progressShowcase.progress; accent: Theme.error; }
        }
        TitleRow{
            title.text: qsTr("Label")
            width: parent.width
            spacing: Size.pixel36
            grid.columns: 1
            MCircularProgressBar{ progress: _progressShowcase.progress; accent: Theme.primary; showLabel: true }
        }
        Item{ Layout.fillHeight: true; }
    }
}


