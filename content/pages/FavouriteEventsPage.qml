import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples
import '../components/events'

Page {
    id: favourite_events_page
    objectName: Constants.favouriteEventsPageName

    background: Rectangle {
        anchors.fill: parent
        color: 'transparent'
    }

    ScrollView {
        id: favourite_events_list
        anchors {
            fill: parent
            margins: 10
        }

        Column {
            anchors.fill: parent

            Label {
                id: page_title
                text: 'Избранные мероприятия'
                anchors.leftMargin: 10
                font {
                    weight: 800
                    pointSize: 18
                }
                wrapMode: Text.WordWrap
                width: parent.width
                elide: "ElideRight"
            }
            Label {
                id: page_description
                text: 'Список всех мероприятий, которые Вы когда-то сохранили'
                font {
                    pointSize: 12
                }
                wrapMode: Text.WordWrap
                width: parent.width
                elide: "ElideRight"
                opacity: 0.5
            }

            Item {
                width: parent.width
                height: parent.height - page_title.height - page_description.height

                EventsList {
                    anchors {
                        topMargin: 10
                    }

                    events: EventsStore.events.favouriteItems
                }
            }
        }
    }
}
