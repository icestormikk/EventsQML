import QtQuick 2.15
import '../../ui'

Rectangle {
    id: footer_button
    property var iconSource
    property var url
    property string pageTitle

    width: 50
    height: 50
    color: 'red'
    radius: 10
    layer.enabled: true

    CustomButton {
        anchors {
            fill: parent
        }

        icon.source: iconSource
        onClicked: {
            main_stack_view.replace(Qt.resolvedUrl(url))
            footer_container.selectedPageTitle = pageTitle
        }
    }

    Connections {
        target: footer_container
        onSelectedPageTitleChanged: {
            footer_button.color = (footer_container.selectedPageTitle == pageTitle) ? 'blue' : 'red'
        }
    }
}
