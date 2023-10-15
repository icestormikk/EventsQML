import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples
import '../../ui'

Rectangle {
    id: search_bar

    width: parent.width
    height: 40
    radius: 10
    clip: true
    color: Qt.rgba(255, 255, 255, 0.4)

    Row {
        anchors.fill: parent

        Icon {
            id: search_bar_button
            anchors {
                verticalCenter: parent.verticalCenter
                margins: 40
            }

            height: parent.height - 10
            width: height
            iconUrl: Constants.getIcon('Search')
            opacity: 0.6
        }

        TextField {
            id: search_input
            height: parent.height
            width: parent.width - search_bar_button.width
            background: Rectangle {
                anchors.fill: parent
                color: Qt.rgba(search_bar.color.a, search_bar.color.b, search_bar.color.c, 0.1)
            }
            color: Constants.secondaryColor
        }
    }
}
