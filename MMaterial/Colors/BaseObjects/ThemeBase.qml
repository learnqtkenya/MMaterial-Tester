import QtQuick

QtObject{
    required property PaletteBasic primary
    required property PaletteBasic secondary
    required property PaletteBasic info
    required property PaletteBasic success
    required property PaletteBasic warning
    required property PaletteBasic error
    required property PaletteText text
    required property PaletteBackground background
    required property PaletteAction action
    required property PaletteOther other

    required property PaletteGrey main
    required property PaletteSocial social

    property PaletteCommon common: PaletteCommon{}

    property PaletteBasic defaultNeutral: PaletteBasic{
        main: text.primary
        contrastText: background.main
    }
}
