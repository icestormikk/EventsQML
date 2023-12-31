import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples
import '../../services/events.js' as EventsTools
import '../../components'
import '../../ui/buttons'
import '../../ui'

Item {
    id: events_list_container
    anchors.fill: parent

    required property var events

    readonly property bool isLoading: !Boolean(events)

    property var selectedEvent
    property string nextPageLink

    ScrollView {
        id: view
        anchors {
            fill: parent
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

                model: events
                delegate: EventShortCard {}
            }

            Item {
                id: load_more_button
                width: parent.width
                height: 40

                LoadingButton {
                    id: load_button
                    visible: Boolean(nextPageLink)

                    onClicked: {
                        load_button.isLoading = true
                        EventsTools.appendEvents(String(nextPageLink), () => { load_button.isLoading = false })
                    }
                }
            }
        }
    }
}
