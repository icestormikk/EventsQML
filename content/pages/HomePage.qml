import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples
import '../components/footer'

Page {
    id: home_page
    objectName: 'home_page'

    Rectangle {
        anchors.fill: parent
        color: Constants.mainColor

        Text {
            anchors.centerIn: parent
            text: 'Home Page'
            font {
                bold: true
                pointSize: 16
            }
            color: 'white'
        }
    }
}
