import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples
import '../components/events'
import '../ui/buttons'

Page {
    id: event_page
    objectName: 'EventPage'

    property var selectedEventData: EventsStore.selectedEvent

    background: Rectangle {
        anchors.fill: parent
        color: 'lightgray'
    }


    ScrollView {
        id: event_scroll_view
        anchors {
            fill: parent
        }
        ScrollBar.vertical: ScrollBar { width: 0 }

        Column {
            anchors.fill: parent

//            Item {
//                width: parent.width
//                height: 40

//                CancelButton {
//                    onClicked: () => {
//                        pages_stack.pop()
//                        EventsStore.selectedEvent = undefined
//                    }
//                }
//            }

            Loader {
                id: card_loader
                width: event_scroll_view.width
            }
        }
    }

    onSelectedEventDataChanged: {
        const isLoaded = selectedEventData !== undefined

        if (isLoaded) {
            card_loader.setSource('../components/events/event_card/EventCard.qml', {eventData: selectedEventData})
        }
    }
}
