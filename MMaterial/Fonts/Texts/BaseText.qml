import QtQuick
import QtQuick.Controls
import "../../Colors"

Text {
    id: _root

    color: Theme.text.primary

    HoverHandler{
        id: _hoverHandler
        enabled: _root.truncated
    }

    ToolTip {
        visible: _hoverHandler.hovered
        text: _root.text
        delay: 0
    }
}
