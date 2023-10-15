import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples
import '../components/events'
import '../components/search_widget'

Page {
    id: search_page
    objectName: 'search_page'
    background: Rectangle {
        anchors.fill: parent
        color: 'transparent'
    }

    header: Item {
        id: search_header
        width: parent.width
        height: 80

        SearchWidget {}

        Behavior on height {
            NumberAnimation { duration: 500 }
        }
    }

    EventsList {}
}
