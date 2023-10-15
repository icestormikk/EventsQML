import QtQuick 2.15
import QtQuick.Controls

Label {
    id: day_label
    width: parent.width / 7
    height: width

    required property var calendarId
    property var isDateEquals: (firstDate, secondDate) => {}

    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    opacity: model.month === grid.month ? 1 : 0.3
    color: model.today ? 'green' : (isDateEquals(selectedDate, model.date) ? 'white' : 'black')
    text: calendarId.locale.toString(model.date, "dd")
    font {
        bold: model.today || isEqual(selectedDate, model.date)
        pointSize: 12
    }
    background: Rectangle {
        id: day_bg
        color: isEqual(selectedDate, model.date) ? '#7BE382' : 'transparent'
        border {
            width: model.today ? 1 : 0
            color: '#7BE382'
        }

        radius: day_bg.width / 2
        clip: true
    }
    required property var model

    MouseArea {
        anchors.fill: parent
        onClicked: {
            calendar_block.selectedDate = model.date
        }
    }
}
