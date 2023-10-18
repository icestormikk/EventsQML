import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Controls.Fusion
import ProjectSamples
import '../../../ui'

Item {
    id: event_card

    required property var eventData

    EventCardBackground {
        id: swiper
        eventImages: eventData['images']
    }

    Item {
        anchors {
            fill: parent
            margins: 10
        }

        IconButton {
            anchors {
                left: parent.left
            }

            size: 40
            url: Constants.getIcon('Previous', false)
            bgColor: Qt.rgba(255, 255, 255, 0.5)
            radius: 4

            onButtonClicked: () => {
                pages_stack.pop()
                EventsStore.selectedEvent = undefined
            }
        }

        IconButton {
            id: favourite_button
            anchors {
                right: parent.right
            }

            property bool isFavouriteEvent: Boolean(events_service.getEventById(eventData['id']))

            size: 40
            url: Constants.getIcon('Favourite' + (isFavouriteEvent ? '_Selected' : ''), false)
            bgColor: Qt.rgba(255, 255, 255, 0.5)
            radius: 4

            onButtonClicked: () => {
                try {
                    events_service.createEvent(eventData)
                    isFavouriteEvent = true
                } catch (err) {
                    isFavouriteEvent = false
                    throw err
                }
            }
        }
    }

    EventContent {
        id: content_block
        y: swiper.height - content_block.radius
        radius: 30
        width: parent.width
        height: Constants.height - y
    }
}
