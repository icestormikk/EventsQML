import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples

Dialog {
    x: 0
    y: 0
    width: Constants.width
    height: Constants.height
    visible: true

    required property Component content

    background: Rectangle {
        anchors.fill: parent
        color: Qt.rgba(0, 0, 0, 0.5)
    }

    Rectangle {
        id: wrap
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 20
            right: parent.right
            rightMargin: 20
        }
        height: content_loader.height

        color: 'white'
        radius: 40

        Loader {
            id: content_loader
            height: content.height
            sourceComponent: content
        }
    }
}
