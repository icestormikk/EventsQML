import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples
import '../../ui'

Item {
    id: footer_button_conatainer
    anchors.fill: parent
    opacity: pages_stack.currentItem.objectName === pageName ? 1 : 0.5

    required property string buttonUrl
    required property string pageName
    required property string iconTitle
    required property string iconLocalizedTitle

    Column {
        anchors.fill: parent

        Icon {
            id: footer_button
            anchors.horizontalCenter: parent.horizontalCenter
            iconUrl: Constants.getIcon(iconTitle)
            width: Math.min(22, parent.height)
            height: width
        }
        Label {
            id: footer_label
            anchors.horizontalCenter: parent.horizontalCenter
            text: iconLocalizedTitle
            font {
                bold: true
                pointSize: 10
            }
            color: Constants.secondaryColor
        }
    }

    MouseArea {
        width: parent.width
        height: parent.height

        onClicked: {
            pages_stack.push(buttonUrl)
        }
    }
}
