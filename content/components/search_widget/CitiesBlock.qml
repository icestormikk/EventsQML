import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples
import '../../services/cities.js' as CitiesTools

ComboBox {
    id: cities_block

    property var categories: [{name: 'Любой город', slug: ''}]

    model: categories
    textRole: 'name'

    Material.foreground: Constants.secondaryColor

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

    Component.onCompleted: {
        CitiesTools.getCities(
            (response) => {
                cities_block.model = [...categories, ...response]
            }
        )
    }
}
