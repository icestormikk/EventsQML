import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples
import '../components/events'
import '../components/search_widget'
import '../components'

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
        height: 60

        ClosedSearchList {
            anchors {
                fill: parent
                margins: 10
            }

            onClick: () => {
                popup_window.content = Qt.resolvedUrl('../components/search_widget/SearchWidget.qml')
                popup_window.open()
            }
        }

        Behavior on height {
            NumberAnimation { duration: 500 }
        }
    }

    EventsList {}
}
