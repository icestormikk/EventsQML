pragma Singleton
import QtQuick 6.2

QtObject {
    property var events: QtObject {
        property bool isLoading: false
        property var items: []
    }

    property int currentPageIndex: 1
    property var next
    property var previous
    property var selectedEvent
}
