import QtQuick 2.15
import ProjectSamples
import '../../ui'

Rectangle {
    id: search_list_short

    required property var onClick
    property var totalEventsCount: EventsStore.events.totalCount

    color: Constants.mainColor
    anchors.fill: parent
    radius: 40

    Text {
        id: title
        anchors {
            left: parent.left
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }

        font {
            pointSize: 12
        }
        color: Constants.secondaryColor
        text: (totalEventsCount === 0) ? 'Найти подходящие события' : `Найдено ${totalEventsCount} событий`
        opacity: 0.4
    }

    Icon {
        iconUrl: Constants.getIcon('Search')
        opacity: 0.4
        anchors {
            right: parent.right
            rightMargin: 20
            verticalCenter: parent.verticalCenter
        }
        height: title.height + 10
        width: height
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            onClick()
        }
    }
}
