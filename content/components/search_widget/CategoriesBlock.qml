import QtQuick 2.15
import QtQuick.Controls
import '../../services/categories.js' as CategoriesTools

ComboBox {
    id: categories_block

    property var categories: [{name: 'Любая категория', slug: ''}]

    model: categories
    textRole: 'name'

    Component.onCompleted: {
        CategoriesTools.getCategories(
            (response) => {
                categories_block.model = [...categories, ...response]
            }
        )
    }
}
