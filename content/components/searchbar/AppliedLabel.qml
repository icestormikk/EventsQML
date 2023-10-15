import QtQuick 2.15

Rectangle {
    id: applied_label

    height: 20
    width: 80
    radius: 10
    clip: true
    color: 'green'

    Text {
        id: label
        anchors {
            centerIn: parent
        }

        text: qsTr('Применено')
        color: '#efefef'

        font {
            bold: true
        }
    }
}
