.import "index.js" as API_TOOLS
.import ProjectSamples as Stores

function getEvents(parametersObj) {
    const loc = parametersObj['location'].value.slug
    const actual_since = parametersObj['actual_since'].value.toISOString()
    const category = parametersObj['category'].value.slug
    const title = parametersObj['title'].value
    const fields = 'id,title,slug,is_free,short_title'

    const query = API_TOOLS.buildQueryParametersString({loc, actual_since, category, title, fields})

    Stores.EventsStore.events.isLoading = true

    API_TOOLS.sendRequest(
        `events/${query}`,
        (response) => {
            const { results, next, previous, count } = response

            Stores.EventsStore.events = { items: results, isLoading: false, totalCount: count }
            Stores.EventsStore.next = next
            Stores.EventsStore.previous = previous
        }
    )
}

function getEventById(id, onSuccess = () => {}, onFailed = () => {}) {
    const lang = 'ru'
    const expand = 'images,dates,location,place'
    const text_format = 'plain'

    const query = API_TOOLS.buildQueryParametersString({lang, expand, text_format})

    API_TOOLS.sendRequest(
        `events/${id}${query}`,
        (response) => {
            onSuccess(response)
        },
        (response) => {
            onFailed(response)
        }
    )
}

function getTodayEvents(onSuccess = () => {}, onFailed = () => {}) {
    const lang = 'ru'
    const fields = 'object'
    const expand = 'object'
    const date = new Date().toISOString()

    const query = API_TOOLS.buildQueryParametersString({lang, fields, date, expand})

    API_TOOLS.sendRequest(
        `events-of-the-day/${query}`,
        (response) => {
            const { results, next, previous } = response
            const events = results.map((event) => event['object'])

            onSuccess({events, next, previous})
        },
        (response) => {
            onFailed(response)
        }
    )
}

function appendEvents(linkToNext, onSuccess = () => {}) {
    const query = linkToNext.slice(linkToNext.lastIndexOf('events'))

    Stores.EventsStore.events.isLoading = true

    API_TOOLS.sendRequest(
        query,
        (response) => {
            const { results, next, previous, count } = response
            Stores.EventsStore.events = {
                items: [...Stores.EventsStore.events.items, ...results],
                isLoading: false,
                totalCount: count
            }
            Stores.EventsStore.next = next
            Stores.EventsStore.previous = previous

            onSuccess()
        }
    )
}
