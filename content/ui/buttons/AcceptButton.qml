import QtQuick 2.15
import QtQuick.Controls

Button {
    id: submit_button

    width: parent.width
    height: parent.height
    text: 'Применить'

    background: Rectangle {
        anchors.fill: parent
        radius: submit_button.height / 2
        clip: true
        color: 'lightgreen'
    }
}
