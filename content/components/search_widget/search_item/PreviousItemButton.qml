import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples
import '../../../ui'

Button {
    id: previous_item_button

    width: parent.width
    height: 40

    background: Rectangle {
        anchors.fill: parent
        color: '#ee7272'
        radius: 40
    }

    contentItem: Text {
        text: 'Вернуться назад'
        font {
            bold: true
            pointSize: 12
        }
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
