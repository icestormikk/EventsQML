import QtQuick 2.15
import ProjectSamples

QtObject {
    readonly property var repository: AbstractRepository {}
    readonly property string eventsTableName: 'favourite_events'

    function getAllFavouriteEvents() {
        const result = repository.find('*', eventsTableName)
            .map((event) => JSON.parse(event['data']))

        EventsStore.events.favouriteItems = [...result]
        return result
    }

    function getFavouriteEventById(id) {
        return repository.findOne('*', eventsTableName, 'event_id = ?', id)
    }

    function createFavouriteEvent(eventObj) {
        const event_id = eventObj.id
        const data = JSON.stringify(eventObj)
        const result = repository.create(eventsTableName, {event_id, data})

        getAllFavouriteEvents()
        return result
    }

    function updateFavouriteEventById(id, newObj) {
        const result = repository.update(eventsTableName, JSON.stringify(newObj), 'event_id = ?', id)

        getAllFavouriteEvents()
        return result
    }

    function removeFavouriteEventById(id) {
        const result = repository.remove(eventsTableName, 'event_id = ?', id)

        getAllFavouriteEvents()
        return result
    }
}
