import QtQuick

import "./Themes"
import "./BaseObjects"

pragma Singleton

QtObject{
    property ThemeBase light: LightTheme
    property ThemeBase dark: DarkTheme
}
