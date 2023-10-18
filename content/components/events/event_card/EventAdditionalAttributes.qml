import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples
import '../../../ui'

Page {
    id: event_additional_attributes_page
    objectName: 'eventAdditionalAttributes'

    readonly property var selectedEventData: EventsStore.selectedEvent

    function getStaticAdditionalAttributes() {
        if (!selectedEventData) {
            return []
        }

        return [
            {
                id: 'price',
                title: 'Стоимость',
                icon: Constants.getIcon('Cost', false),
                value: selectedEventData['price'] || 'Бесплатно'
            },
            {
                id: 'age',
                title: 'Возрастное органичение',
                icon: Constants.getIcon('Age', false),
                value: `${selectedEventData['age_restriction']}`
            },
            {
                id: 'site',
                title: 'Ссылка на сайт',
                icon: Constants.getIcon('Link', false),
                value: selectedEventData['site_url']
            }
        ]
    }

    Column {
        id: attributes_container
        anchors {
            fill: parent
            margins: 20
        }
        spacing: 10

        Repeater {
            id: event_attributes

            model: getStaticAdditionalAttributes()
            delegate: Item {
                id: attribute
                width: attributes_container.width
                height: 30

                Row {
                    anchors.fill: parent
                    spacing: 10

                    Icon {
                        id: attribute_icon
                        anchors.verticalCenter: parent.verticalCenter
                        width: attribute.height
                        height: width
                        iconUrl: modelData['icon']
                    }
                    Column {
                        id: attribute_value
                        anchors.verticalCenter: parent.verticalCenter
                        width: attribute.width - (attribute_icon.width + parent.spacing)
                        height: parent.height

                        Label {
                            id: value
                            text: `<b>${modelData['title']}: </b>${modelData['id'] === 'site' ? `<a href='${modelData['value']}'>${modelData['value']}</a>` : `<span>${modelData['value']}</span>`}`
                            font {
                                pointSize: 12
                            }
                            width: parent.width
                            wrapMode: Text.WordWrap
                            onLinkActivated: Qt.openUrlExternally(link)
                        }
                    }
                }
            }
        }
    }
}
