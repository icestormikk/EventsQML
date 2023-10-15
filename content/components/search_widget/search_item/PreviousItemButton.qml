import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples
import '../../../ui'

Button {
    id: previous_item_button

    width: 60
    height: parent.height

    background: Row {
        anchors {
            fill: parent
        }

        IconButton {
            id: prev_button
            anchors.verticalCenter: parent.verticalCenter

            url: Constants.getIcon('Previous')
            size: parent.height - 10
        }
        Item {
            height: parent.height
            width: parent.width - prev_button.width

            Text {
                anchors.verticalCenter: parent.verticalCenter
                text: 'Назад'
                font {
                    pointSize: 12
                }
            }
        }
    }
}
