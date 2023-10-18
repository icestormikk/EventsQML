import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples
import '../ui'

Dialog {
    id: modal_window
    x: 0
    y: 0
    width: Constants.width
    height: Constants.height
    visible: true

    required property Component content
    property alias modalTitle: modal_title.text

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

        Item {
            width: parent.width
            height: 40

            Label {
                id: modal_title
                anchors {
                    left: parent.left
                    leftMargin: 10
                    verticalCenter: parent.verticalCenter
                }
                text: 'Modal Title'
                font {
                    bold: true
                    pointSize: 12
                }
            }

            IconButton {
                size: parent.height
                url: Constants.getIcon('Close', false)

                onButtonClicked: {
                    modal_window.close()
                }
            }
        }

        Loader {
            id: content_loader
            height: content.height
            sourceComponent: content
        }
    }
}
