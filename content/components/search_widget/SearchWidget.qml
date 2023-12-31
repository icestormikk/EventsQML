import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import ProjectSamples
import '../../services/events.js' as EventsTools
import '../../ui/calendar_block'
import './search_item'
import '../../ui'

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

        function clear() {
            city = undefined; eventDate = new Date(); category = undefined; title = '';
        }
    }

    Column {
        id: widget_container
        width: parent.width
        height: 600

        Item {
            width: parent.width
            height: parent.height - controls_container.height

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

        Item {
            id: controls_container
            width: parent.width
            height: 60

            IconButton {
                height: parent.height - 16
                width: height
                anchors {
                    verticalCenter: parent.verticalCenter
                    left: parent.left
                    leftMargin: 20
                }

                url: Constants.getIcon('Reset', false)
                bgColor: '#FF6969'
                radius: 10
                onButtonClicked: () => {
                    parameters.clear()
                    search_list.currentIndex = 0
                }

                isEnabled: search_list.currentIndex !== 0
            }

            IconButton {
                height: parent.height - 16
                width: height
                anchors.centerIn: parent

                url: Constants.getIcon('Previous', false)
                bgColor: '#FF6969'
                radius: 10
                onButtonClicked: () => {
                    search_list.decrementCurrentIndex()
                }

                isEnabled: search_list.currentIndex > 0
            }

            IconButton {
                id: next_button
                height: parent.height - 16
                width: height
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                    rightMargin: 20
                }

                url: Constants.getIcon('Accept', false)
                radius: 10
                bgColor: '#539165'
                onButtonClicked: () => {
                    EventsStore.events.filterParameters = parameters.toJsObject()
                    EventsTools.getEvents()
                    popup_window.close()
                }

                states: [
                    State {
                        name: "isNotLast"
                        when: search_list.currentIndex !== search_list.count - 1
                        PropertyChanges {
                            target: next_button
                            url: Constants.getIcon('Next', false)
                            onButtonClicked: () => {
                                search_list.incrementCurrentIndex()
                            }
                        }
                    },
                    State {
                        name: "isLast"
                        when: search_list.currentIndex === search_list.count - 1
                        PropertyChanges {
                            target: next_button
                            url: Constants.getIcon('Accept', false)
                            onButtonClicked: () => {
                                EventsStore.events.filterParameters = parameters.toJsObject()
                                EventsTools.getEvents()
                                popup_window.close()
                            }
                        }
                    }
                ]
            }
        }
    }
}
