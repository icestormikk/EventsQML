import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples

Rectangle {
    id: content_block

    color: 'white'
    clip: true

    Column {
        anchors.fill: parent

        Item {
            id: event_nav_panel
            width: parent.width - content_block.radius * 2
            height: content_block.radius * 1.5
            anchors.horizontalCenter: parent.horizontalCenter

            ListView {
                id: titles
                anchors {
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                }
                height: parent.height / 2
                spacing: 10

                orientation: ListView.Horizontal
                model: [
                    {
                        title: 'Описание',
                        element: 'EventTitleDescription.qml',
                        properties: {
                            eventTitle: eventData['title'].charAt(0).toUpperCase() + eventData['title'].slice(1),
                            eventDescription: eventData['body_text']
                        }
                    },
                    {
                        title: 'Дата и время',
                        element: 'event_dates/EventDates.qml',
                        properties: {
                            eventDates: eventData['dates'].sort((date1, date2) =>
                                new Date(date2.end * 1000).getTime() - new Date(date1.end * 1000).getTime()
                            )
                        }
                    },
                    {
                        title: 'Локация',
                        element: 'event_location/EventMapPlace.qml',
                        properties: {
                            eventLocationData: { location: eventData['location'], place: eventData['place'] }
                        }
                    },
                    {
                        title: 'Доп. информация',
                        element: 'EventAdditionalAttributes.qml',
                        properties: {}
                    }

                ]
                delegate: Label {
                    text: modelData['title']
                    font {
                        bold: true
                        pointSize: 12
                    }
                    color: ListView.isCurrentItem ? "black" : Qt.rgba(0, 0, 0, 0.5)

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            titles.currentIndex = index
                            event_pages_stack.push(modelData['element'], modelData['properties'])
                        }
                    }
                }
            }
        }

        StackView {
            id: event_pages_stack
            width: parent.width
            height: parent.height - event_nav_panel.height - 40
            initialItem: EventTitleDescription {
                id: event_page
                eventTitle: eventData['title'].charAt(0).toUpperCase() + eventData['title'].slice(1)
                eventDescription: eventData['body_text']
            }
        }
    }
}
