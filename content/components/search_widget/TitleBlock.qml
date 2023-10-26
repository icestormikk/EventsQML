import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples

TextField {
    id: title_block

    width: parent.width
    height: 60
    color: Constants.secondaryColor

    placeholderText: 'Название мероприятия'
    placeholderTextColor: Constants.secondaryColor

    background: Rectangle {
        implicitWidth: 120
        implicitHeight: 60
        border {
            color: Constants.secondaryColor
            width: 1
        }

        radius: 2
        color: 'transparent'
    }
}
