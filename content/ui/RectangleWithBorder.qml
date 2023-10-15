import QtQuick 2.15

Rectangle {
    id: rect_borders

    property var borderSides: []
    property alias borderColor: rect_borders.border.color
    property alias borderWidth: rect_borders.border.width
    property string rectColor: 'transparent'

    anchors {
        fill: parent
        topMargin: borderSides.includes('top') ? 0 : -1
        bottomMargin: borderSides.includes('bottom') ? 0 : -1
        leftMargin: borderSides.includes('left') ? 0 : -1
        rightMargin: borderSides.includes('right') ? 0 : -1
    }
    color: rectColor
    border {
        color: 'gray'
    }
}
