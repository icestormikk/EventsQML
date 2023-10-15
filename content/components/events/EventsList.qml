import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples
import '../../components'
import '../../ui/buttons'
import '../../ui'

Item {
    id: events_list_container
    anchors.fill: parent

    property var selectedEvent
    property bool isLoading: EventsStore.events.isLoading

    ScrollView {
        id: view
        anchors {
            fill: parent
            leftMargin: 10
            rightMargin: 10
            bottomMargin: 10
        }

        Column {
            width: view.width
            height: view.height
            spacing: 10

            Item {
                visible: isLoading
                width: parent.width
                height: parent.height

                BusyIndicator {
                    anchors.centerIn: parent
                    running: isLoading
                }
            }

            Repeater {
                id: events_list
                visible: !isLoading
                width: parent.width
                height: parent.height - load_more_button.height

                model: EventsStore.events.items
                delegate: EventShortCard {}
            }
            Item {
                id: load_more_button
                width: parent.width
                height: 40

                AcceptButton {
                    id: load_button
                    visible: EventsStore.events.items.length > 0
                }
            }
        }
    }
}
