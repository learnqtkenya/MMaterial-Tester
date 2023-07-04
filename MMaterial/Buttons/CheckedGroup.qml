import QtQuick

QtObject {
    //Has to have clicked signal and checked property

    property var checkables: []

    Component.onCompleted: {
        if(!enabled)
            return;
        checkables = checkables.filter(item => item.checked !== undefined && item.onClicked !== undefined);

        for(let checkable of checkables)
            checkable.onClicked.connect(check.bind(null, checkable));
    }

    function check(clickedCheckable){
        if(!clickedCheckable.checked)
            return;
        for(let checkable of checkables)
            if(checkable !== clickedCheckable)
                checkable.checked = false;
    }
}

