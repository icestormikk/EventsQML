import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import ProjectSamples
import '..'

ColumnLayout {
    id: calendar_block
    property var selectedDate: new Date(0)

    function isEqual(firstDate, secondDate) {
        return firstDate.getTime() === secondDate.getTime()
    }

    CalendarControls {
        calendarId: grid
    }

    DayOfWeekRow {
        locale: grid.locale
        Layout.fillWidth: true
    }

    MonthGrid {
        id: grid
        Layout.fillWidth: true

        month: new Date().getMonth()
        year: new Date().getFullYear()
        locale: Qt.locale("ru")

        delegate: CalendarDelegate {
            calendarId: grid
            isDateEquals: isEqual
        }
    }

    Item {
        width: parent.width
        height: selected_date_info.height
        visible: !isEqual(selectedDate, new Date(0))

        Text {
            id: selected_date_info
            anchors.centerIn: parent
            text: selectedDate.toLocaleDateString(Qt.locale('ru_RU'))
            font {
                bold: true
                pointSize: 12
            }
            color: 'green'
            wrapMode: Text.WordWrap
        }
    }
}
