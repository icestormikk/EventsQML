import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples
import '../../services/events.js' as EventsTools
import '../events'
import '../../ui'

Page {
    id: compilation_events_page
    objectName: 'compilationEventsPage'
    width: parent.width
    height: parent.height

    required property var compilationItems

    ScrollView {
        anchors {
            fill: parent
            margins: 10
        }

        Column {
            anchors.fill: parent
            spacing: 10

            Repeater {
                id: compilations_items
                model: compilationItems
                delegate: Rectangle {
                    id: compilation_item
                    width: parent.width
                    height: childrenRect.height
                    radius: 4

                    border {
                        width: 1
                        color: 'lightgray'
                    }

                    function getElementImage() {
                        try {
                            return modelData['first_image']['image']
                        } catch (err) {
                            return undefined
                        }
                    }

                    function getElementIcon() {
                        try {
                            const item_type = String(modelData['ctype'])

                            switch (item_type) {
                                case 'event':
                                    return Constants.getIcon('Ticket', false)
                                case 'news':
                                    return Constants.getIcon('News_Black', false)
                                case 'place':
                                    return Constants.getIcon('Map', false)
                                case 'list':
                                    return Constants.getIcon('List', false)
                                default:
                                    return Constants.getIcon('None', false)
                            }
                        } catch (err) {
                            return Constants.getIcon('None', false)
                        }
                    }

                    Column {
                        width: parent.width

                        Image {
                            id: element_image
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: parent.width - compilation_item.border.width * 2
                            fillMode: Image.PreserveAspectCrop

                            states: [
                                State {
                                    name: "isImageExist"
                                    when: Boolean(compilation_item.getElementImage())
                                    PropertyChanges {
                                        target: element_image
                                        source: compilation_item.getElementImage()
                                        height: 200
                                    }
                                }
                            ]
                        }

                        Item {
                            anchors {
                                left: parent.left
                                leftMargin: 10
                                right: parent.right
                                rightMargin: 10
                            }
                            height: Math.max(element_icon.height, title.height) + 10

                            Row {
                                width: parent.width
                                anchors.verticalCenter: parent.verticalCenter
                                spacing: 4

                                Icon {
                                    id: element_icon
                                    width: 30
                                    height: width
                                    iconUrl: compilation_item.getElementIcon()
                                }
                                Column {
                                    width: parent.width - element_icon.width - parent.spacing
                                    anchors.verticalCenter: parent.verticalCenter

                                    Label {
                                        id: title
                                        text: modelData['title'].charAt(0).toUpperCase() + modelData['title'].slice(1)
                                        font {
                                            bold: true
                                            pointSize: 12
                                        }
                                        width: parent.width
                                        wrapMode: Text.WordWrap
                                    }
                                }
                            }
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            const type = String(modelData['ctype'])

                            switch (type) {
                                case 'event': {
                                    EventsTools.getEventById(
                                        modelData['id'],
                                        (response) => {
                                            pages_stack.push('../../pages/EventPage.qml', {selectedEventData: response})
                                        }
                                    )
                                    break
                                }
                                default: {
                                    Qt.openUrlExternally(modelData['item_url'])
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
