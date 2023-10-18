import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples
import '../ui'

Popup {
    id: popup_window
    x: 0
    y: 0
    width: Constants.width
    height: Constants.height
    visible: true

    property string content: content_loader.source
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
            leftMargin: 10
            right: parent.right
            rightMargin: 10
        }
        height: content_loader.height + modal_header.height + anchors.leftMargin * 2

        color: 'white'
        radius: 6

        Column {
            id: modal_content
            anchors.fill: parent

            Item {
                id: modal_header
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
                    anchors {
                        right: parent.right
                        rightMargin: 10
                        verticalCenter: parent.verticalCenter
                    }
                    size: Math.max(parent.height - 5, 30)
                    url: Constants.getIcon('Close', false)

                    onButtonClicked: () => {
                        popup_window.close()
                    }
                }
            }

            Loader {
                id: content_loader
                height: content.height
                width: parent.width
                source: content
            }
        }
    }
}
