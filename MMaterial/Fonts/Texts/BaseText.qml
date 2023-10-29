import QtQuick
import QtQuick.Controls
import "../../Colors"

Text {
    id: _text

    color: Theme.text.primary

    HoverHandler{
        id: _hoverHandler
        enabled: _text.truncated
    }

    ToolTip {
        visible: _hoverHandler.hovered
        text: _text.text
        delay: 0
    }
}
