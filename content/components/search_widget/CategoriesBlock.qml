import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples
import '../../services/categories.js' as CategoriesTools

ComboBox {
    id: categories_block

    property var categories: [{name: 'Любая категория', slug: ''}]

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
        CategoriesTools.getCategories(
            (response) => {
                categories_block.model = [...categories, ...response]
            }
        )
    }
}
