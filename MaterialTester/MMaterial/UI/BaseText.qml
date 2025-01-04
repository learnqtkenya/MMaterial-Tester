import QtQuick

import MMaterial.Controls as MMaterial
import MMaterial.UI as UI

Text {
    id: _root

    property string tooltipText: _root.text
    property bool showTooltip: _root.truncated

	color: UI.Theme.text.primary

    HoverHandler{
        id: _hoverHandler
        enabled: _root.showTooltip
    }

    MMaterial.MToolTip {
        visible: _hoverHandler.hovered
        text: _root.tooltipText
        delay: 300
    }
}
