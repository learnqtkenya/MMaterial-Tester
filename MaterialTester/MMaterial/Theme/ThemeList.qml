pragma Singleton

import QtQuick

import MMaterial as MMaterial

QtObject{
    property MMaterial.ThemeBase light: LightTheme
    property MMaterial.ThemeBase dark: DarkTheme
}
