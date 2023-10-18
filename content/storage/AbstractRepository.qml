import QtQuick 2.15

QtObject {
    readonly property var connection: Database {}
    readonly property var logger: QtObject {
        function write(message) {
            console.log(`SQL: ${message}`)
        }
    }

    function find(fields = [], tableName, filterQueryString = '', ...parameters) {
        const result = []

        if (!connection) {
            throw new Error('Database is not initialized!')
        }

        connection.database.transaction(
            function (tx) {
                const query = `SELECT ${[...fields]} FROM ${tableName} ${filterQueryString.length > 0 ? `WHERE ${filterQueryString}` : ''}`
                logger.write(query + ` (${parameters.join(', ')})`)

                const response = tx.executeSql(query, [...parameters])
                logger.write('Successfully fetched ' + response.rows.length + ' row(s)')

                for (let i = 0; i < response.rows.length; i++) {
                    result.push(response.rows.item(i))
                }
            }
        )

        return result
    }

    function findOne(fields = '*', tableName, filterQueryString = '', ...parameters) {
        let event = undefined

        if (!connection) {
            throw new Error('Database is not initialized!')
        }

        connection.database.transaction(
            function (tx) {
                const query = `SELECT ${[...fields]} FROM ${tableName} ${filterQueryString.length > 0 ? `WHERE ${filterQueryString}` : ''} LIMIT 1`
                logger.write(query + `, ${parameters}`)

                const response = tx.executeSql(query, [...parameters])
                logger.write('Successfully fetched ' + response.rows.length + ' row')

                event = response.rows.item(0)
            }
        )

        return event
    }

    function create(tableName, obj) {
        if (!connection) {
            throw new Error('Database is not initialized!')
        }

        const [keys, values] = [Object.keys(obj), Object.values(obj)]
        connection.database.transaction(
            function (tx) {
                const query = `INSERT INTO ${tableName} (${keys.join(', ')}) VALUES (${Array(values.length).fill('?').join(', ')})`
                logger.write(query)

                tx.executeSql(query, [...values])
                logger.write('The object was successfully added to the database')
            }
        )
    }

    function remove(tableName, filterQueryString, ...parameters) {
        if (!connection) {
            throw new Error('Database is not initialized!')
        }
        if (filterQueryString.length === 0) {
            throw new Error('Filter query string is not initialized!')
        }

        connection.database.transaction(
            function (tx) {
                const query = `DELETE FROM ${tableName} WHERE ${filterQueryString}`
                logger.write(query + ` (${parameters.join(', ')})`)

                tx.executeSql(query, [...parameters])
                logger.write('The object was successfully removed from the database')
            }
        )
    }
}
