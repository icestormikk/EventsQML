import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples
import '../components/home_page_section'
import '../ui'

Page {
    id: home_page
    objectName: Constants.homePageName

    background: Rectangle {
        anchors.fill: parent
        color: 'transparent'
    }
    header: Item {
        id: header
        width: parent.width
        height: 50

        IconButton {
            id: switch_theme_button
            height: parent.height
            width: height
            anchors {
                left: parent.left
                top: parent.top
                leftMargin: 4
                topMargin: 4
            }

            url: Constants.getIcon(Constants.activeTheme ? 'LightMode' : 'DarkMode', false)
            onButtonClicked: () => {
                Constants.activeTheme = Constants.activeTheme ? Constants.Theme.Light : Constants.Theme.Dark
                console.log(Constants.activeTheme)
            }
        }

        IconButton {
            height: parent.height
            width: height
            anchors {
                right: parent.right
                top: parent.top
                rightMargin: switch_theme_button.anchors.leftMargin
                topMargin: switch_theme_button.anchors.topMargin
            }

            url: Constants.getIcon('Credits_Dark', false)
            onButtonClicked: () => {
               popup_window.modalTitle = 'Authors'
               popup_window.content = '../components/Credits.qml'
               popup_window.open()
            }
        }
    }

    Item {
        width: parent.width
        height: parent.height - header.height

        Column {
            anchors.fill: parent
            spacing: 40

            Column {
                width: parent.width

                Text {
                    id: title
                    text: 'KudaGo'
                    font {
                        bold: true
                        pointSize: 40
                    }
                    color: 'white'
                    anchors.horizontalCenter: parent.horizontalCenter
                    horizontalAlignment: Text.AlignHCenter
                }
                Text {
                    id: slogan
                    text: 'Живи интересно!'
                    font {
                        italic: true
                        pointSize: title.font.pointSize * 0.4
                    }
                    color: 'white'
                    anchors.horizontalCenter: parent.horizontalCenter
                    horizontalAlignment: Text.AlignHCenter
                }
            }

            HomePageSection {}
        }
    }
}
