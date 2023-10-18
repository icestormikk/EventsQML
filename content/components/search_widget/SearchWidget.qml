import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import '../../ui/calendar_block'
import './search_item'
import '../../services/events.js' as EventsTools

Item {
    id: search_list_container
    width: parent.width
    height: widget_container.height

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

    Item {
        id: widget_container
        width: parent.width
        height: 600

        SwipeView {
            id: search_list
            anchors {
                fill: parent
            }
            currentIndex: 0
            spacing: 10
            interactive: false
            clip: true

            SearchItem {
                id: city_parameter
                title: 'Выбор города'
                description: 'Для начала давайте определимся с городом, где будет проходить мероприятие'
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
                description: 'Отлично! Теперь отфильтруем события по дате'
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
                description: 'Теперь нужно определиться с типом меропрятия: концерт, выставка, а может сходим на квест?'
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
                description: 'Ну и последний штрих - если вам известно название мероприятия, укажите его'
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
                    popup_window.close()
                }
            }
        }

        PageIndicator {
            id: indicator

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
