import QtQuick 2.15

TextInput {
    property real fontPointSize
    property string placeholder

    id: search_bar_input
    anchors {
        verticalCenter: parent.verticalCenter
        left: parent.left
        leftMargin: 10
    }

    font.pointSize: fontPointSize


    Text {
        id: placeholder_text
        anchors {
            verticalCenter: parent.verticalCenter
        }

        font.pointSize: search_bar_input.font.pointSize
        color: 'gray'
        visible: !search_bar_input.text
        text: placeholder
    }
}
