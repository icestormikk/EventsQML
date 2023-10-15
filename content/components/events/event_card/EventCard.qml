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
            size: 40
            url: Constants.getIcon('Previous', false)
            bgColor: Qt.rgba(255, 255, 255, 0.5)
            radius: 4

            onButtonClicked: () => {
                pages_stack.pop()
                EventsStore.selectedEvent = undefined
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
