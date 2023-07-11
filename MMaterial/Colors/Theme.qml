import QtQuick

import "./BaseObjects"
import "./Themes"

pragma Singleton

ThemeBase{
    primary: currentTheme ? currentTheme.primary : null
    secondary: currentTheme ? currentTheme.secondary : null
    info: currentTheme ? currentTheme.info : null
    success: currentTheme ? currentTheme.success : null
    warning: currentTheme ? currentTheme.warning : null
    error: currentTheme ? currentTheme.error : null
    main: currentTheme ? currentTheme.main : null
    social: currentTheme ? currentTheme.social : null
    background: currentTheme ? currentTheme.background : null
    other: currentTheme ? currentTheme.other : null
    text: currentTheme ? currentTheme.text : null
    action: currentTheme ? currentTheme.action : null
    common: currentTheme ? currentTheme.common : null
    defaultNeutral: currentTheme ? currentTheme.defaultNeutral : null

    property ThemeBase currentTheme: LightTheme

    function setTheme(theme){
        console.log("Theme switched to " + theme.objectName)
        currentTheme = theme;
    }
}
