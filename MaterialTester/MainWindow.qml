import QtQuick
import QtQuick.Controls

import MMaterial

import "./Showcase"
import "./Showcase/ColorShowcase"
import "./Showcase/AvatarShowcase"

Rectangle{
    color: Theme.background.main
    Item{
        id: header
        height: parent.height * 0.1
        width: parent.width

        H2{
            width: parent.width * 0.85
            anchors {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }
            text: showcaseLoader.currentItem ? showcaseLoader.currentItem.objectName : ""
            font {
                capitalization: Font.AllUppercase
            }
        }

        Rectangle{
            height: 1
            width: parent.width
            color: Theme.other.divider
            anchors.bottom: parent.bottom
        }
    }

    StackView{
        id: showcaseLoader
        anchors{
            top: header.bottom
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        initialItem: avatarShowcase
    }

    Component{ id: fontShowcase;  FontShowcase{ } }
    Component{ id: colorShowcase; ColorShowcase{ } }
    Component{ id: avatarShowcase; AvatarShowcase{ } }

    RoundButton{
        anchors{
            right: parent.right;
            top: parent.top;
            margins: 14;
        }

        height: 50
        width: 50
        text: Theme.currentTheme.objectName
        onClicked: {
            if(Theme.currentTheme.objectName === "Light Theme")
                Theme.setTheme(ThemeList.dark); //or Theme.setTheme(DarkTheme);

            else
                Theme.setTheme(ThemeList.light); //or Theme.setTheme(LightTheme);
        }
    }
}

