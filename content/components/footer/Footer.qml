import QtQuick 2.15
import ProjectSamples
import '../../ui'

Rectangle {
    id: footer_container
    height: 160
    color: Constants.mainColor
    border {
        width: 1
        color: 'red'
    }

    property string selectedPageTitle
    signal selectedPageTitleChanded(string title)

    Row {
        spacing: 40

        FooterButton {
            iconSource: Constants.getIcon('Home')
            url: '../../pages/HomePage.qml'
            pageTitle: 'Home'
        }
        FooterButton {
            iconSource: Constants.getIcon('Search')
            url: '../../pages/SearchPage.qml'
            pageTitle: 'Search'
        }
        FooterButton {
            iconSource: Constants.getIcon('Favourite')
            url: '../../pages/HomePage.qml'
            pageTitle: 'Favourite'
        }
    }
}
