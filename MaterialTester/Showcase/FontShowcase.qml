import QtQuick
import QtQuick.Layouts

import MMaterial

ColumnLayout {
    objectName: "Typography"
    readonly property string mainLabel: "Almost before we knew it, we had left the ground."
    H1{
        text: mainLabel
        Layout.preferredWidth: parent.width
    }
    H2{
        text: mainLabel
        Layout.preferredWidth: parent.width
    }
    H3{
        text: mainLabel
        Layout.preferredWidth: parent.width
    }
    H4{
        text: mainLabel
        Layout.preferredWidth: parent.width
    }
    H5{
        text: mainLabel
        Layout.preferredWidth: parent.width
    }
    H6{
        text: mainLabel
        Layout.preferredWidth: parent.width
    }
    B1{
        text: mainLabel
        Layout.preferredWidth: parent.width
    }
    B2{
        text: mainLabel
        Layout.preferredWidth: parent.width
    }
    Caption{
        text: mainLabel
        Layout.preferredWidth: parent.width
    }
    Overline{
        text: mainLabel
        Layout.preferredWidth: parent.width
    }
    Subtitle1{
        text: mainLabel
        Layout.preferredWidth: parent.width
    }
    Subtitle2{
        text: mainLabel
        Layout.preferredWidth: parent.width
    }
}

