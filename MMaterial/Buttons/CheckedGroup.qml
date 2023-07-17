import QtQuick

QtObject {
    //Has to have clicked signal and checked property

    property var checkables: []
    property var checkedButton: null

    Component.onCompleted: {
        if(!enabled)
            return;
        checkables = checkables.filter(item => item.checked !== undefined && item.onClicked !== undefined);

        for(let checkable of checkables){
            checkable.onClicked.connect(check.bind(null, checkable));
            if(checkable.checked)
                checkedButton = checkable;
        }
    }

    function check(clickedCheckable){
        for(let checkable of checkables)
            if(checkable !== clickedCheckable)
                checkable.checked = false;
        checkedButton = clickedCheckable;
    }
}

