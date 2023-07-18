import QtQuick 2.15
import QtQuick.Controls 2.1
import QtQuick.Layouts

import "../../Settings"

ListView{
    id: _listView
    anchors {
        right: parent.right
        bottom: parent.bottom
        margins: Size.pixel20
    }

    z: 99
    width: parent.width * 0.4
    height: 300 * Size.scale
    verticalLayoutDirection: ListView.BottomToTop
    spacing: Size.pixel4
    interactive: false

    model: ListModel {
        id: listModel
    }
    delegate: Alert{
        id: _alertComponent
        property var item: listModel.get(index)
        property int closeTime: item ? item.closeTime : 0

        width: _listView.width
        text: item && item.text ? item.text : ""
        severity: item && item.severity ? item.severity : severity
        variant: item && item.variant ? item.variant : variant
        dismissButton {
            text: item && item.dismissButton && item.dismissButton.text ? item.dismissButton.text : dismissButton.text
            onClicked: item && item.dismissButton && item.dismissButton.onClicked ? item.dismissButton.onClicked() : function(){
                _alertComponent.close();
            }
        }
        actionButton {
            text: item && item.actionButton && item.actionButton.text && item.actionButton.text ? item.actionButton.text : actionButton.text
            onClicked: item && item.actionButton && item.actionButton.onClicked ? item.actionButton.onClicked() : null
        }
        Timer{
            id: _timer
            running: visible
            interval: _alertComponent.closeTime
            onTriggered: {
                if(index >= 0)
                    listModel.remove(index)
            }
        }

        onClose: {
            listModel.remove(index)
        }
    }

    add: Transition {
        NumberAnimation { properties: "x"; from: _listView.width; duration: 500; easing.type: Easing.OutBack }
    }
    displaced: Transition {
        NumberAnimation { properties: "x,y"; duration: 500; easing.type: Easing.OutBack }
    }

    function activate(
        message,
        details = {},
        duration = 3500)
    {
        if(!message)
            console.warn("No text added for alert!")
        let alertObject = {
            text : message,
            closeTime : duration
        };

        if(details.severity)
            alertObject.severity = details.severity;
        if(details.icon)
            alertObject.icon = details.icon;
        if(details.variant)
            alertObject.variant = details.variant;
        if(details.dismissButton)
            alertObject.dismissButton = details.dismissButton;
        if(details.actionButton)
            alertObject.actionButton = details.actionButton;

        _listView.model.append(alertObject);
    }

}




