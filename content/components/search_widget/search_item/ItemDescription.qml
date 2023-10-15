import QtQuick 2.15

Text {
    id: search_item_description

    required property var container
    property alias textPointSize: search_item_description.font.pointSize
    property alias description: search_item_description.text

    width: container.width
    color: search_item_description.color
    opacity: 0.5
    font {
        pointSize: 14
    }
    text: 'Example Description'
    wrapMode: Text.Wrap
}
