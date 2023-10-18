import QtQuick 2.15
import QtQuick.Controls
import QtLocation
import QtPositioning
import ProjectSamples
import '../../../../ui'

Page {
    id: event_place_info_page
    objectName: 'eventPlaceMap'

    required property var eventLocationData

    function isPlaceDefined() {
        return eventLocationData['place'] !== null
    }

    function getCoordinates() {
        if (isPlaceDefined()) {
            return eventLocationData['place']['coords']
        }
        return eventLocationData['location']['coords']
    }

    Column {
        anchors {
            fill: parent
            margins: 20
        }
        spacing: 10

        Rectangle {
            id: location_info_container
            width: parent.width
            height: 60
            border {
                width: 1
                color: 'lightgray'
            }
            radius: 4
            clip: true

            Row {
                anchors {
                    fill: parent
                    margins: 10
                }
                height: 40
                spacing: 10

                Icon {
                    id: location_icon
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.height - 5
                    height: width
                    iconUrl: Constants.getIcon('Map', false)
                }

                Column {
                    id: location_full_info
                    width: parent.width - location_icon.width
                    height: location_name.height + (isPlaceDefined() ? location_address.height : 0)

                    Label {
                        id: location_name
                        width: parent.width
                        text: eventLocationData['location']['name']
                        font {
                            bold: true
                            pointSize: 12
                        }
                    }

                    Label {
                        id: location_address
                        visible: eventLocationData['place']['address'] !== null
                        width: parent.width
                        text: eventLocationData['place']['address'] || ''
                        font {
                            bold: true
                            pointSize: location_name.font.pointSize * 0.8
                        }
                        wrapMode: Text.WordWrap
                        opacity: 0.5
                    }
                }
            }
        }

        EventMap {
            height: event_place_info_page.height - location_info_container.height
            coordinates: getCoordinates()
        }
    }
}
