.import "index.js" as API_TOOLS
.import ProjectSamples as Stores

function getEvents(parametersObj) {
    const loc = parametersObj['location'].value.slug
    const actual_since = parametersObj['actual_since'].value.toISOString()
    const category = parametersObj['category'].value.slug
    const title = parametersObj['title'].value
    const fields = 'id,title,slug,is_free,publication_date'

    const query = API_TOOLS.buildQueryParametersString({loc, actual_since, category, title, fields})

    Stores.EventsStore.events.isLoading = true

    API_TOOLS.sendRequest(
        `events/${query}`,
        (response) => {
            const { results, next, previous } = response

            Stores.EventsStore.events = { items: results, isLoading: false }
            Stores.EventsStore.next = next
            Stores.EventsStore.previous = previous
        }
    )
}

function getEventById(id) {
    const lang = 'ru'
    const expand = 'images,dates,location,place'
    const text_format = 'plain'

    console.log(id)

    const query = API_TOOLS.buildQueryParametersString({lang, expand, text_format})

    API_TOOLS.sendRequest(
        `events/${id}${query}`,
        (response) => {
            Stores.EventsStore.selectedEvent = response
        }
    )
}
