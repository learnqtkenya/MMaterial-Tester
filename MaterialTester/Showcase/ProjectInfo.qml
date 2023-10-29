import QtQuick 
import QtQuick.Layouts

import MMaterial

Item {
    objectName: "Project Info"
    visible: showcaseLoader.status == Loader.Ready

    ColumnLayout{
        anchors.fill: parent
        spacing: Size.pixel24
        H3{
            color: Theme.text.primary
            Layout.fillWidth: true
            text: "About the project"
            font.bold: true
        }
        ListView{
            id: _listView
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: Size.pixel24
            clip: true

            model: [
                "MMaterial is an exciting open-source project that I, Marko, am passionately working on during my free time.\nInspired by the renowned Material UI design system, MMaterial aims to provide a comprehensive set of user interface components and design guidelines for developers and designers.",
                "Building upon the principles of Material Design, MMaterial offers an extensive library of reusable and customizable UI components that can be easily integrated into Qt projects.\nFrom buttons and cards to navigation bars and modals (coming soon), MMaterial covers a wide range of UI elements to empower developers in creating visually appealing and intuitive interfaces.",
                "MMaterial is a testament to my dedication and passion for UI design and development.\nBy naming the project after myself, Marko, combined with the 'Material' reference, I hope to create a unique and recognizable brand that resonates with the community. It's my way of contributing to the thriving open-source ecosystem while leaving a personal touch on this exciting endeavor.",
                "Please note that this is a work in progress and is subdue to changes.\nI'm working hard to bring more components and features to MMaterial, so stay tuned for more updates!"
            ]
            delegate: B2{
                color: index == _listView.count -1 ? Theme.text.primary : Theme.text.secondary
                width: _listView.width
                text: modelData
                wrapMode: Text.WordWrap
                lineHeight: 1.1
            }
        }

        H6{
            color: Theme.text.secondary
            Layout.fillWidth: true
            horizontalAlignment: Qt.AlignRight
            text: "Kind regards, Marko"
        }
    }
}
