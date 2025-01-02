pragma Singleton

import QtQuick

QtObject{
    property ThemeBase light: LightTheme
    property ThemeBase dark: DarkTheme
}
