import QtQuick
import QtQuick.Controls
import "../../Colors"

Text {
    id: _root

    property string tooltipText: _root.text
    property bool showTooltip: _root.truncated

    color: Theme.text.primary

    HoverHandler{
        id: _hoverHandler
        enabled: _root.showTooltip
    }

    ToolTip {
        visible: _hoverHandler.hovered
        text: _root.tooltipText
        delay: 300
    }
}
