import QtQuick 2.15
import QtQuick.Controls
import '../../services/cities.js' as CitiesTools

ComboBox {
    id: cities_block

    property var categories: [{name: 'Любой город', slug: ''}]

    model: categories
    textRole: 'name'

    Component.onCompleted: {
        CitiesTools.getCities(
            (response) => {
                cities_block.model = [...categories, ...response]
            }
        )
    }
}
