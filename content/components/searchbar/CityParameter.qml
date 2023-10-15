import QtQuick 2.15
import QtQuick.Controls

Item {
    id: city_search_parameter

    width: parent.width
    height: combo_box.height + 10

    Row {
        anchors.fill: parent

        ComboBox {
            id: combo_box
            width: city_search_parameter.width - submit_button.width
            model: ["Yaroslavl", "Moscow", "Vologda"]
        }

        Button {
            id: submit_button
            height: city_search_parameter.height
            width: height

            text: 'Submit'
            onClicked: {
                parameter_container.onSubmit('Pasha')
            }
        }
    }
}
