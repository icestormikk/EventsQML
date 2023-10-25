import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples
import '../../ui'

Rectangle {
    id: footer
    z: 0
    width: parent.width
    height: 60

    radius: 40

    Rectangle {
        z: -1
        y: parent.height / 2
        height: parent.height / 2
        width: parent.width
    }

    Item {
        anchors {
            fill: parent
            leftMargin: 40
            rightMargin: 40
            topMargin: 10
            bottomMargin: 10
        }

        Item {
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
            }
            width: 44
            height: width

            FooterButton {
                pageName: Constants.homePageName
                buttonUrl: '../../pages/HomePage.qml'
                iconTitle: 'Home'
                iconLocalizedTitle: 'Главная'
            }
        }

        Item {
            anchors.centerIn: parent
            width: 44
            height: width

            FooterButton {
                pageName: Constants.searchPageName
                buttonUrl: '../../pages/SearchPage.qml'
                iconTitle: 'Search'
                iconLocalizedTitle: 'Поиск'
            }
        }

        Item {
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            width: 44
            height: width

            FooterButton {
                pageName: Constants.favouriteEventsPageName
                buttonUrl: '../../pages/FavouriteEventsPage.qml'
                iconTitle: 'Favourite'
                iconLocalizedTitle: 'Избранное'
            }
        }
    }
}
