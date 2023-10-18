import QtQuick 2.15

QtObject {
    readonly property var repository: AbstractRepository {}
    readonly property string eventsTableName: 'events'

    function getAllEvents() {
        return repository.find('*', eventsTableName)
    }

    function getEventById(id) {
        return repository.findOne('*', eventsTableName, 'event_id = ?', id)
    }

    function createEvent(eventObj) {
        const event_id = eventObj.id
        const data = JSON.stringify(eventObj)

        return repository.create(eventsTableName, {event_id, data})
    }

    function removeEventById(id) {
        return repository.remove(eventsTableName, 'id = ?', id)
    }
}
