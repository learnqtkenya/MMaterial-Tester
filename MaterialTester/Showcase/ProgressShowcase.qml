import QtQuick 
import QtQuick.Controls.Material
import QtQuick.Layouts

import MMaterial.UI as UI
import MMaterial.Controls as Controls
import MaterialTester.Components

Flickable {
    contentHeight: _progressShowcase.implicitHeight

	ScrollIndicator.vertical: Controls.MScrollIndicator{}

    ColumnLayout {
        id: _progressShowcase

        property int progress: 0

        anchors.fill: parent

        onWidthChanged: {
            _progressAnimation.stop();
            _animationTimer.restart();
        }

        NumberAnimation on progress {
            id: _progressAnimation

            loops: Animation.Infinite
            running: true
            from: 0; to: 100
            duration: 5000
        }

        Timer {
            id: _animationTimer

            interval: 300

            onTriggered: _progressAnimation.restart();
        }

		UI.H6 { text: qsTr("Progress Bar") }

        TitleRow {
			Layout.fillWidth: true

            title.text: qsTr("Color")
            spacing: UI.Size.pixel36
            grid.columns: 1

			Controls.MProgressBar{ progress: _progressShowcase.progress; accent: UI.Theme.primary; }
			Controls.MProgressBar{ progress: _progressShowcase.progress; accent: UI.Theme.secondary; }
			Controls.MProgressBar{ progress: _progressShowcase.progress; accent: UI.Theme.info; }
			Controls.MProgressBar{ progress: _progressShowcase.progress; accent: UI.Theme.success; }
			Controls.MProgressBar{ progress: _progressShowcase.progress; accent: UI.Theme.warning; }
			Controls.MProgressBar{ progress: _progressShowcase.progress; accent: UI.Theme.error; }
        }

        TitleRow {
			Layout.fillWidth: true

            title.text: qsTr("Label")
            spacing: UI.Size.pixel36
            grid.columns: 1

			Controls.MProgressBar{ progress: _progressShowcase.progress; accent: UI.Theme.primary; showLabel: true }
        }

		UI.H6 {
            Layout.topMargin: UI.Size.pixel48

            text: qsTr("Circular Progress Bar")
        }

        TitleRow {
			Layout.fillWidth: true

            title.text: qsTr("Color")
            spacing: UI.Size.pixel36

			Controls.MCircularProgressBar{ progress: _progressShowcase.progress; accent: UI.Theme.primary; }
			Controls.MCircularProgressBar{ progress: _progressShowcase.progress; accent: UI.Theme.secondary; }
			Controls.MCircularProgressBar{ progress: _progressShowcase.progress; accent: UI.Theme.info; }
			Controls.MCircularProgressBar{ progress: _progressShowcase.progress; accent: UI.Theme.success; }
			Controls.MCircularProgressBar{ progress: _progressShowcase.progress; accent: UI.Theme.warning; }
			Controls.MCircularProgressBar{ progress: _progressShowcase.progress; accent: UI.Theme.error; }
        }
        TitleRow {
			Layout.fillWidth: true

            title.text: qsTr("Label")
            spacing: UI.Size.pixel36
            grid.columns: 1

			Controls.MCircularProgressBar{ progress: _progressShowcase.progress; accent: UI.Theme.primary; showLabel: true }
        }

        Item { Layout.fillHeight: true; }
    }
}


