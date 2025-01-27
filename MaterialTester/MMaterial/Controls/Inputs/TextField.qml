import QtQuick 
import QtQuick.Templates as T

import MMaterial.UI as UI
import MMaterial.Media as Media

T.TextField {
	id: root

	property alias placeholder: _label.text
	property alias leftIcon: _leftIcon
	property alias rightIcon: _rightIcon

	property real horizontalMargins: UI.Size.pixel12
	property UI.PaletteBasic accent: UI.Theme.primary

	property bool showPlaceholder: !root.activeFocus && root.text === ""
	property int type: TextField.Type.Standard

	enum Type { Filled, Outlined, Standard }

	implicitHeight: 56 * UI.Size.scale
	implicitWidth: (UI.Size.format == UI.Size.Format.Extended ? 319 : 200) * UI.Size.scale

	verticalAlignment: Qt.AlignVCenter
	selectByMouse: true
	selectedTextColor: acceptableInput ? root.accent.contrastText : UI.Theme.error.contrastText
	selectionColor: acceptableInput ? root.accent.main : UI.Theme.error.main
	placeholderTextColor: UI.Theme.text.primary

	leftPadding: UI.Size.pixel14 + (leftIcon.visible ? leftIcon.width + UI.Size.pixel8 : 0)
	rightPadding: UI.Size.pixel14 + (rightIcon.visible ? rightIcon.width + UI.Size.pixel8 : 0)

	topPadding: d.isStandardType || d.isFilledType ? root.height * 0.2 : 0

	font {
		family: UI.PublicSans.regular
		pixelSize: UI.Size.pixel16
	}

	QtObject{
		id: d

		property bool isOutlinedType: root.type == TextField.Type.Outlined
		property bool isFilledType: root.type == TextField.Type.Filled
		property bool isStandardType: !isFilledType && !isOutlinedType
	}

	Item {
		id: _mainContainer

		anchors {
			fill: root
			topMargin: root.type === TextField.Type.Outlined ? 0 : (root.activeFocus ? UI.Size.pixel16 : 0)
		}

		Media.Icon {
			id: _leftIcon

			anchors {
				left: _mainContainer.left; leftMargin: d.isStandardType ? 0 : UI.Size.pixel14;
				verticalCenter: _mainContainer.verticalCenter
			}

			color: UI.Theme.text.disabled.toString()
			visible: iconData
			size: !visible ? 0 : bg.height * 0.3
		}

		Media.Icon {
			id: _rightIcon

			anchors {
				right: _mainContainer.right; rightMargin: UI.Size.pixel12;
				verticalCenter: _mainContainer.verticalCenter
			}

			color: UI.Theme.action.active.toString()
			visible: iconData
			interactive: true
			size: !visible ? 0 : bg.height * 0.3
		}
	}

	background: Rectangle {
		id: bg

		radius: UI.Size.pixel8

		border {
			width: root.type === TextField.Type.Outlined ? 1 : 0
			color: UI.Theme.text.primary
		}

		states: [
			//Filled
			State {
				name: "disabled-filled"
				when: !root.enabled && root.type == TextField.Type.Filled
				PropertyChanges { target: bg; color: UI.Theme.action.disabledBackground; border { color: UI.Theme.action.disabledBackground } }
				PropertyChanges { target: root; color: UI.Theme.text.disabled; placeholderTextColor: UI.Theme.text.disabled }
			},
			State {
				name: "error-filled"
				when: !root.acceptableInput && root.type == TextField.Type.Filled
				PropertyChanges { target: bg; color: UI.Theme.error.transparent.p8; border { color: UI.Theme.error.main } }
				PropertyChanges { target: root; color: UI.Theme.text.primary; placeholderTextColor: UI.Theme.error.main }
			},
			State {
				name: "focused-filled"
				when: root.focus && root.type == TextField.Type.Filled
				PropertyChanges { target: bg; color: UI.Theme.main.transparent.p16; border { color: UI.Theme.text.primary} }
				PropertyChanges { target: root; color: UI.Theme.text.primary; placeholderTextColor: UI.Theme.text.primary }
			},
			State {
				name: "hovered-filled"
				when: root.hovered && root.type == TextField.Type.Filled
				PropertyChanges { target: bg; color: UI.Theme.main.transparent.p16; border { color: UI.Theme.text.primary} }
				PropertyChanges { target: root; color: UI.Theme.text.primary; placeholderTextColor: UI.Theme.text.disabled }
			},
			State {
				name: "normal-filled"
				when: root.type == TextField.Type.Filled
				PropertyChanges { target: bg; color: UI.Theme.main.transparent.p8; border { color: UI.Theme.action.disabledBackground} }
				PropertyChanges { target: root; color: UI.Theme.text.primary; placeholderTextColor: UI.Theme.text.disabled }
			},

			//Outlined
			State {
				name: "disabled-outlined"
				when: !root.enabled && root.type == TextField.Type.Outlined
				PropertyChanges { target: bg; color: UI.Theme.background.paper; border { color: UI.Theme.action.disabledBackground } }
				PropertyChanges { target: root; color: UI.Theme.text.disabled; placeholderTextColor: UI.Theme.text.disabled }
			},
			State {
				name: "error-outlined"
				when: !root.acceptableInput && root.type == TextField.Type.Outlined
				PropertyChanges { target: bg; color: UI.Theme.background.paper; border { color: UI.Theme.error.main } }
				PropertyChanges { target: root; color: UI.Theme.text.primary; placeholderTextColor: UI.Theme.error.main }
			},
			State {
				name: "focused-outlined"
				when: root.activeFocus && root.type == TextField.Type.Outlined
				PropertyChanges { target: bg; color: UI.Theme.background.paper; border { color: UI.Theme.text.primary} }
				PropertyChanges { target: root; color: UI.Theme.text.primary; placeholderTextColor: UI.Theme.text.primary }
			},
			State {
				name: "hovered-outlined"
				when: root.hovered && root.type == TextField.Type.Outlined
				PropertyChanges { target: bg; color: UI.Theme.background.paper; border { color: UI.Theme.text.primary} }
				PropertyChanges { target: root; color: UI.Theme.text.primary; placeholderTextColor: UI.Theme.text.disabled }
			},
			State {
				name: "normal-outlined"
				when: root.type == TextField.Type.Outlined
				PropertyChanges { target: bg; color: UI.Theme.background.paper; border { color: UI.Theme.action.disabledBackground} }
				PropertyChanges { target: root; color: UI.Theme.text.primary; placeholderTextColor: UI.Theme.text.disabled }
			},

			//Standard
			State {
				name: "disabled"
				when: !root.enabled
				PropertyChanges { target: bg; color: "transparent"; border { color: UI.Theme.action.disabledBackground } }
				PropertyChanges { target: root; color: UI.Theme.text.disabled; placeholderTextColor: UI.Theme.text.disabled }
			},
			State {
				name: "error"
				when: !root.acceptableInput
				PropertyChanges { target: bg; color: "transparent"; border { color: UI.Theme.error.main } }
				PropertyChanges { target: root; color: UI.Theme.text.primary; placeholderTextColor: UI.Theme.error.main }
			},
			State {
				name: "focused"
				when: root.activeFocus
				PropertyChanges { target: bg; color: "transparent"; border { color: UI.Theme.text.primary} }
				PropertyChanges { target: root; color: UI.Theme.text.primary; placeholderTextColor: UI.Theme.text.primary }
			},
			State {
				name: "hovered"
				when: root.hovered
				PropertyChanges { target: bg; color: "transparent"; border { color: UI.Theme.text.primary} }
				PropertyChanges { target: root; color: UI.Theme.text.primary; placeholderTextColor: UI.Theme.text.disabled }
			},
			State {
				name: "normal"
				when: true
				PropertyChanges { target: bg; color: "transparent"; border { color: UI.Theme.action.disabledBackground} }
				PropertyChanges { target: root; color: UI.Theme.text.primary; placeholderTextColor: UI.Theme.text.disabled }
			}
		]

		Rectangle {
			anchors.bottom: bg.bottom

			width: bg.width
			height: 1

			color: bg.border.color
			visible: root.type !== TextField.Type.Outlined && root.type !== TextField.Type.Filled
		}

		Rectangle {
			id: _labelContainer

			anchors {
				top: bg.top; topMargin: -height/4
			}

			height: bg.border.width * 2
			width: _label.width
			visible: _label.text !== ""

			x: _label.x
			color: bg.color
			radius: 8
		}

		UI.B2 {
			id: _label

			verticalAlignment: Qt.AlignVCenter
			horizontalAlignment: d.isOutlinedType ? Qt.AlignHCenter : Qt.AlignLeft

			width: Math.min(implicitWidth + UI.Size.pixel8, root.width)
			height: implicitHeight

			font.pixelSize: root.font.pixelSize * 0.66
			text: "Placeholder"
			color: root.placeholderTextColor

			lineHeight: 1

			state: "foreground"
			states: [
				State {
					name: "foreground"
					when: root.showPlaceholder
					PropertyChanges { target: _labelContainer; opacity: 0.0; }
					PropertyChanges { target: _mainContainer; anchors { topMargin: 0; } }
					PropertyChanges{ target: _label; scale: 1.4; x: root.leftPadding * 1.5; y: root.height/2 - _label.height/2}
				},
				State {
					name: "background"
					when: true
					PropertyChanges { target: _labelContainer; opacity: 1.0; }
					PropertyChanges { target: _mainContainer; anchors { topMargin: root.type === TextField.Type.Outlined ? 0 : UI.Size.pixel16; } }
					PropertyChanges{
						target: _label;
						scale: 1;
						x:  d.isStandardType ? 0 : root.leftPadding * 0.8
						y: root.type === TextField.Type.Outlined ? -height/2 : height/2;
					}
				}
			]

			transitions: [
				Transition {
					NumberAnimation { properties: "x,y,scale,opacity,anchors.topMargin"; duration: 100; easing.type: Easing.InOutQuad }
				}
			]
		}
	}
}
