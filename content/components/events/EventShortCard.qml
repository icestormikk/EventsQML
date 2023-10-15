import QtQuick 2.15
import ProjectSamples
import '../../ui'
import '../../services/events.js' as EventsTools

Rectangle {
    id: event_short_info
    width: events_list.width
    height: Math.max(title.height + event_publication_date.height + info_row_block.anchors.margins * 2, event_icon.height)
    color: 'white'
    radius: 10
    clip: true

    Row {
        id: info_row_block
        anchors {
            fill: parent
            margins: 10
        }
        spacing: 10

        Icon {
            id: event_icon
            iconUrl: Constants.getIcon(modelData['is_free'] ? 'Ticket_Free' : 'Ticket', false)
            height: 40
            width: height
        }

        Column {
            id: event_info
            width: event_short_info.width - event_icon.width
            height: event_short_info.height
            spacing: 2

            Text {
                id: title
                text: modelData['title'].charAt(0).toUpperCase() + modelData['title'].slice(1)
                font {
                    bold: true
                    pointSize: 11
                }
                wrapMode: Text.WordWrap
                elide: Text.ElideRight
                width: event_info.width - info_row_block.anchors.margins * 2
            }
            Text {
                id: event_publication_date
                text: Qt.formatDate(new Date(modelData['publication_date'] * 1000), 'dd.MM.yyyy')
                font {
                    pointSize: title.font.pointSize * 0.8
                }
                opacity: 0.6
                wrapMode: title.wrapMode
                elide: title.elide
                width: title.width
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            EventsTools.getEventById(modelData['id'])
            pages_stack.push('../../pages/EventPage.qml')
        }
    }
}
