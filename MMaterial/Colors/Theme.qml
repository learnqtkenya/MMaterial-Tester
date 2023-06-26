import QtQuick

import "./BaseObjects"
import "./Themes"

pragma Singleton

ThemeBase{
    primary: currentTheme.primary
    secondary: currentTheme.secondary
    info: currentTheme.info
    success: currentTheme.success
    warning: currentTheme.warning
    error: currentTheme.error
    main: currentTheme.main
    social: currentTheme.social
    background: currentTheme.background
    other: currentTheme.other
    text: currentTheme.text
    action: currentTheme.action

    property ThemeBase currentTheme: LightTheme

    function setTheme(theme){
        console.log("Theme switched to " + theme.objectName)
        currentTheme = theme;
    }
}
