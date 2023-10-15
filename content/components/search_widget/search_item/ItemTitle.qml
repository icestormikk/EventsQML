import QtQuick 2.15

Item {
    id: item_title

    property alias text: title.text
    property alias textPointSize: title.font.pointSize
    property alias textColor: title.color

    width: parent.width
    height: title.height

    Text {
        id: title
        anchors.centerIn: parent

        color: 'black'
        font {
            bold: true
            pointSize: 20
        }
        text: 'Example Title'
        wrapMode: Text.WrapAnywhere
    }
}
