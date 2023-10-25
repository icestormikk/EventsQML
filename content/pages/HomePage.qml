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

    Item {
        anchors.fill: parent

        Column {
            anchors.fill: parent
            spacing: 80

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
