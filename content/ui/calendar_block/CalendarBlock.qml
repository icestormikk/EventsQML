import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import ProjectSamples
import '..'

ColumnLayout {
    id: calendar_block

    property var selectedDate: new Date()

    function isEqual(firstDate, secondDate) {
        return firstDate.getTime() === secondDate.getTime()
    }

    CalendarControls {
        calendarId: grid
    }

    DayOfWeekRow {
        locale: grid.locale
        Layout.fillWidth: true
        delegate: Text {
            text: shortName
            font {
                bold: true
                pointSize: 12
            }

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: Constants.secondaryColor

            required property string shortName
        }
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
}
