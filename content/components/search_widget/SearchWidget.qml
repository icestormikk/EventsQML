import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import '../../ui/calendar_block'
import './search_item'
import '../../services/events.js' as EventsTools

Item {
    id: search_list_container
    anchors {
        fill: parent
        margins: 20
    }

    height: isOpen ? Screen.height : parent.height

    property bool isOpen: false
    property QtObject parameters: QtObject {
        property var city
        property date eventDate: new Date()
        property var category
        property string title: ''

        function toJsObject() {
            return {
                location: {
                    name: qsTr('Город'),
                    value: city,
                    onShow: () => city?.name
                },
                actual_since: {
                    name: qsTr('Дата проведения'),
                    value: eventDate,
                    onShow: () => eventDate.getTime() === 0 ? 'Любая дата' : Qt.formatDate(eventDate, 'dd.MM.yyyy')
                },
                category: {
                    name: qsTr('Категория'),
                    value: category,
                    onShow: () => category?.name
                },
                title: {
                    name: qsTr('Название'),
                    value: title,
                    onShow: () => (title && title.length > 0) ? title : 'Любое название'
                }
            }
        }
    }

    ClosedSearchList {
        visible: !isOpen

        onClick: () => {
            isOpen = !isOpen
        }
    }

    Item {
        width: parent.width
        visible: isOpen
        height: isOpen ? (search_page.height - search_list_container.anchors.margins * 2) : 60

        SwipeView {
            id: search_list
            z: 1
            visible: isOpen

            anchors {
                fill: parent
            }
            currentIndex: 0
            spacing: 10
            interactive: false

            SearchItem {
                id: city_parameter
                title: 'Выбор города'
                description: 'blablablablablablablablablablablablablablablablablabla'
                content: CitiesBlock {
                    id: city

                    onCurrentValueChanged: {
                        parameters.city = city.currentValue
                    }
                }
            }
            SearchItem {
                id: date_parameter
                title: 'Дата проведения'
                description: 'blablablablablablablablablablablablablablablablablabla'
                content: CalendarBlock {
                    id: calendar

                    onSelectedDateChanged: {
                        parameters.eventDate = calendar.selectedDate
                    }
                }
            }
            SearchItem {
                id: category_parameter
                title: 'Категория'
                description: 'blablablablablablablablablablablablablablablablablabla'
                content: CategoriesBlock {
                    id: categories

                    onCurrentValueChanged: {
                        parameters.category = categories.currentValue
                    }
                }
            }
            SearchItem {
                id: title_parameter
                title: 'Название'
                description: 'blablablablablablablablablablablablablablablablablabla'
                content: TitleBlock {
                    id: title

                    onTextChanged: {
                        parameters.title = title.text
                    }
                }
            }
            SearchItem {
                id: submit_choise
                title: 'Подтверждение'
                description: 'И последний этап - проверьте правильность заполнения полей. Для изменения какого-либо параметра кликните по нему.'
                content: SubmitChoisesBlock {
                    items: Object.entries(parameters.toJsObject())
                    swipeContainer: search_list
                }
                onSubmit: () => {
                    EventsTools.getEvents(parameters.toJsObject())
                    isOpen = false
                }
            }
        }

        PageIndicator {
            id: indicator
            visible: isOpen

            count: search_list.count
            currentIndex: search_list.currentIndex

            anchors.bottom: search_list.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Behavior on height {
            NumberAnimation { duration: 200 }
        }
    }
}
