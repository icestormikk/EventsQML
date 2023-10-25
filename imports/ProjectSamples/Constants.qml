pragma Singleton
import QtQuick 6.2

QtObject {
    enum Theme {
        Light,
        Dark
    }

    readonly property real width: 380
    readonly property real height: 720

    property int activeTheme : Constants.Theme.Light

    readonly property color mainColor : activeTheme ? "#09102B" : "lightgray"
    readonly property color mainSelectionColor: activeTheme ? "#1aaad7" : "#1aaad7"
    readonly property color secondaryColor : activeTheme ? "#FFFFFF" : "#09102B"

    readonly property color applicationBackgroundColor: '#B3DCFD'

    readonly property string homePageName: 'homePage'
    readonly property string searchPageName: 'searchPage'
    readonly property string favouriteEventsPageName: 'favouriteEventsPage'
    readonly property string eventPageName: 'eventPage'
    readonly property string todayEventsPageName: 'todayEventsPage'
    readonly property string newsPageName: 'newsPage'
    readonly property string compilationsPageName: 'compilationsPage'
    readonly property string compilationPageName: 'compilationPage'

    function getIcon(iconName, addSuffix = true) {
        return getImage(`${iconName}${activeTheme === Constants.Theme.Dark && addSuffix ? "_Dark.svg" : ".svg"}`)
    }

    function getImage(image) {
        return Qt.resolvedUrl(`../icons/${image}`)
    }
}
