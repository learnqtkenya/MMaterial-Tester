pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material as Controls

import MMaterial.UI as UI
import MMaterial.Controls as Controls
import MMaterial.Controls.Dialogs as Dialogs
import MMaterial.Media as Media

Item {
    id: root

    property Component nextView: null

    function openView() {
        stackView.replace(root.nextView)
    }

    function scheduleNextView(view) {
        root.nextView = view
        nextAnimation.restart()
    }

    Controls.StackView {
        id: stackView

        anchors.fill: root
        initialItem: simpleDialogs

        replaceEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to: 1
                duration: 200
            }
        }

        replaceExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to: 0
                duration: 200
            }
        }
    }

    SequentialAnimation {
        id: nextAnimation

        ScriptAction {
            script: stackView.currentItem.closeDialogs()
        }

        PauseAnimation {
            duration: 250
        }

        ScriptAction {
            script: root.openView()
        }
    }

    RowLayout {
        id: paginator

        spacing: UI.Size.pixel8

        anchors {
            horizontalCenter: root.horizontalCenter
            bottom: root.bottom
        }

		Controls.MButton {
            text: qsTr("Simple dialogs")
			type: stackView.currentItem.objectName === "simpleDialogs"? Controls.MButton.Type.Contained : Controls.MButton.Type.Outlined

            onClicked: root.scheduleNextView(simpleDialogs)
        }

		Controls.MButton {
            text: qsTr("Image dialogs")
			type: stackView.currentItem.objectName === "imageDialogs" ? Controls.MButton.Type.Contained : Controls.MButton.Type.Outlined

            onClicked: root.scheduleNextView(imageDialogs)
        }

		Controls.MButton {
            text: qsTr("Input dialogs")
			type: stackView.currentItem.objectName === "inputDialogs" ? Controls.MButton.Type.Contained : Controls.MButton.Type.Outlined

            onClicked: root.scheduleNextView(inputDialogs)
        }
    }

    Component {
        id: simpleDialogs

        Item {
            objectName: "simpleDialogs"

            function closeDialogs() {
                deleteDialog.close()
                simpleDialog.close()
            }

			Controls.MButton {
                y: deleteDialog.y + UI.Size.pixel8
                x: deleteDialog.x + UI.Size.pixel8
                text: qsTr("Open")
				type: Controls.MButton.Type.Outlined

                onClicked: deleteDialog.open()
            }

			Controls.MButton {
                y: simpleDialog.y + UI.Size.pixel8
                x: simpleDialog.x + UI.Size.pixel8
                text: qsTr("Open")
				type: Controls.MButton.Type.Outlined

                onClicked: simpleDialog.open()
            }

            Dialogs.Dialog {
                id: simpleDialog

                width: Math.max(Math.min(440 * UI.Size.scale, root.width / 2 - UI.Size.pixel10), Math.min(320 * UI.Size.scale))
                x: parent.width / 2 - width / 2
                closePolicy: Dialogs.Dialog.NoAutoClose
                text: qsTr("Did you know that the first 1GB hard drive, introduced by IBM in 1980, weighed over 500 pounds and cost $40,000? It was a significant advancement at the time, although today, 1GB of storage is considered quite small and can be found on tiny, inexpensive flash drives.")

                Component.onCompleted: open()

                Item { Layout.fillWidth: true }

                Dialogs.Dialog.DialogCloseButton {
                    Layout.maximumWidth: parent.width / 2 - UI.Size.pixel10
                    text: qsTr("Close")
                    onClicked: simpleDialog.close()

                }

                Dialogs.Dialog.DialogButton {
                    Layout.maximumWidth: parent.width / 2 - UI.Size.pixel10
                    text: qsTr("Good to know!")
                    onClicked: simpleDialog.close()
                }

            }

            Dialogs.Dialog {
                id: deleteDialog

                y: simpleDialog.y + simpleDialog.height + UI.Size.pixel20
                x: parent.width / 2 - width / 2
                width: Math.max(Math.min(440 * UI.Size.scale, root.width / 2 - UI.Size.pixel10), Math.min(320 * UI.Size.scale))
                title: qsTr("Delete Files?")
                closePolicy: Dialogs.Dialog.NoAutoClose
                iconData: Media.Icons.light.warning
                text: qsTr("This is a destructive action, are you sure you want to delete those files?")

                Component.onCompleted: open()

                Item { Layout.fillWidth: true }

                Dialogs.Dialog.DialogCloseButton {
                    Layout.maximumWidth: parent.width / 2 - UI.Size.pixel10
                    text: qsTr("Cancel")
                    onClicked: deleteDialog.close()
                }

                Dialogs.Dialog.DialogAlertButton {
                    Layout.maximumWidth: parent.width / 2 - UI.Size.pixel10
                    text: qsTr("Delete")
                    onClicked: deleteDialog.close()
                }
            }
        }
    }

    Component {
        id: imageDialogs

        Item {
            objectName: "imageDialogs"

            function closeDialogs() {
                largeImageDialog.close()
                mediumImageDialog.close()
            }

			Controls.MButton {
                y: largeImageDialog.y + UI.Size.pixel8
                x: largeImageDialog.x + UI.Size.pixel8
                text: qsTr("Open")
				type: Controls.MButton.Type.Outlined

                onClicked: largeImageDialog.open()
            }

			Controls.MButton {
                y: mediumImageDialog.y + UI.Size.pixel8
                x: mediumImageDialog.x + UI.Size.pixel8
                text: qsTr("Open")
				type: Controls.MButton.Type.Outlined

                onClicked: mediumImageDialog.open()
            }

            Dialogs.LargeImageDialog {
                id: largeImageDialog

                x: parent.width / 2 - width / 2
                width: Math.max(Math.min(440 * UI.Size.scale, root.width / 2 - UI.Size.pixel10), Math.min(320 * UI.Size.scale))
                text: qsTr("This is an amazing update that will fix all the problems in your life. Are you interested?")
                title: qsTr("We have an update to offer!")
                visible: true
				imageSource: Media.Images.realisticShape3.path

                Dialogs.Dialog.DialogCloseButton {
                    Layout.fillWidth: true
                    text: qsTr("Cancel")
                    onClicked: largeImageDialog.close()
                }

                Dialogs.Dialog.DialogButton {
                    Layout.fillWidth: true
                    text: qsTr("Install")
                    onClicked: largeImageDialog.close()
                }
            }

            Dialogs.MediumImageDialog {
                id: mediumImageDialog

                x: parent.width / 2 - width / 2
                y: largeImageDialog.y + largeImageDialog.height + UI.Size.pixel20

                width: Math.max(Math.min(440 * UI.Size.scale, root.width / 2 - UI.Size.pixel10), Math.min(320 * UI.Size.scale))
                title: qsTr("Hold Up")
                text: qsTr("We are promoting something that you need to see first! Check out our shop.")
                visible: true
				imageSource: Media.Images.realisticShape2.path

                Dialogs.Dialog.DialogButton {
                    Layout.fillWidth: true
                    size: UI.Size.Grade.L
                    text: qsTr("Shop")
                    onClicked: mediumImageDialog.close()
                }
            }
        }
    }

    Component {
        id: inputDialogs

        Item {
            objectName: "inputDialogs"

            function closeDialogs() {
                inputDialog.close()
                inputDialog2.close()
            }

			Controls.MButton {
                y: inputDialog.y + UI.Size.pixel8
                x: inputDialog.x + UI.Size.pixel8
                text: qsTr("Open")
				type: Controls.MButton.Type.Outlined

                onClicked: inputDialog.open()
            }

			Controls.MButton {
                y: inputDialog2.y + UI.Size.pixel8
                x: inputDialog2.x + UI.Size.pixel8
                text: qsTr("Open")
				type: Controls.MButton.Type.Outlined

                onClicked: inputDialog2.open()
            }

            Dialogs.InputDialog {
                id: inputDialog

                x: parent.width / 2 - width / 2
                y: parent.height / 2 - height - UI.Size.pixel20

				imageSource: Media.Images.realisticShape1.path
                title: qsTr("Sign up")
                text: qsTr("We have a newsletter that you can sign up for. Enter your email below.")
                visible: true
                placeholder: qsTr("your-email@.com")
            }

            Dialogs.InputDialog {
                id: inputDialog2

                x: parent.width / 2 - width / 2
                y: inputDialog.y + inputDialog.height + UI.Size.pixel20

                title: qsTr("Sign up")
                text: qsTr("We have a newsletter that you can sign up for. Enter your email below.")
                visible: true
                placeholder: qsTr("your-email@.com")
            }
        }
    }
}
