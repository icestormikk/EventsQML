import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import ProjectSamples
import '../../../ui'
import '../../../ui/buttons'

Rectangle {
    id: search_item

    property alias title: search_item_title.text
    property alias description: search_item_description.text

    required property Component content
    property var onSubmit

    ScrollView {
        id: item_view
        anchors {
            fill: parent
            margins: 20
        }

        Column {
            id: search_item_container
            anchors {
                fill: parent
                horizontalCenter: parent.horizontalCenter
            }
            spacing: 10

            Item {
                width: parent.width
                height: 40

                PreviousItemButton {
                    anchors {
                        left: parent.left
                        verticalCenter: parent.verticalCenter
                    }

                    visible: search_list.currentIndex > 0
                    onClicked: {
                        search_list.decrementCurrentIndex()
                    }
                }
            }

            Column {
                width: parent.width
                spacing: 10

                ItemTitle {
                    id: search_item_title
                    textColor: 'black'
                    textPointSize: 20
                }

                ItemDescription {
                    id: search_item_description
                    container: search_item_container
                    textPointSize: search_item_title.textPointSize * 0.6
                }

                Loader {
                    id: content_loader
                    width: parent.width
                    height: content.height
                    sourceComponent: content
                }
            }
        }

        Row {
            width: parent.width
            height: 40
            anchors {
                bottom: parent.bottom
                horizontalCenter: parent.horizontalCenter
            }

            AcceptButton {
                onClicked: {
                    search_list.incrementCurrentIndex()
                    if (onSubmit) {
                        onSubmit()
                    }
                }
            }
        }
    }
}
