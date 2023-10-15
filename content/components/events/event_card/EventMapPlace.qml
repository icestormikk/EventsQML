import QtQuick 2.15
import QtQuick.Controls
import QtLocation
import QtPositioning
import ProjectSamples
import '../../../ui'

Page {
    id: event_place_info_page
    objectName: 'eventPlaceMap'

    required property var eventLocationData

    Column {
        anchors {
            fill: parent
            margins: 20
        }

        property geoCoordinate startCentroid

        Row {
            width: parent.width
            height: 40

            Icon {
               id: icon
               iconUrl: Constants.getIcon('Map', false)
               width: parent.height - 5
               height: width
            }

            Label {
                id: address
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width
                text: eventLocationData['name']
                font {
                    bold: true
                    pointSize: 12
                }
            }
        }

        Plugin {
            id: mapPlugin
            name: "osm"
        }

        Map {
            id: map
            width: parent.width
            height: parent.height
            plugin: mapPlugin
            center: QtPositioning.coordinate(
                eventLocationData['coords']['lat'], eventLocationData['coords']['lon']
            )
            zoomLevel: 14

            PinchHandler {
                id: pinch
                target: null
                onActiveChanged: if (active) {
                    map.startCentroid = map.toCoordinate(pinch.centroid.position, false)
                }
                onScaleChanged: (delta) => {
                    map.zoomLevel += Math.log2(delta)
                    map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
                }
                onRotationChanged: (delta) => {
                    map.bearing -= delta
                    map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
                }
                grabPermissions: PointerHandler.TakeOverForbidden
            }
            WheelHandler {
                id: wheel
                acceptedDevices: Qt.platform.pluginName === "cocoa" || Qt.platform.pluginName === "wayland"
                                 ? PointerDevice.Mouse | PointerDevice.TouchPad
                                 : PointerDevice.Mouse
                rotationScale: 1/120
                property: "zoomLevel"
            }
            DragHandler {
                id: drag
                target: null
                onTranslationChanged: (delta) => map.pan(-delta.x, -delta.y)
            }
            Shortcut {
                enabled: map.zoomLevel < map.maximumZoomLevel
                sequence: StandardKey.ZoomIn
                onActivated: map.zoomLevel = Math.round(map.zoomLevel + 1)
            }
            Shortcut {
                enabled: map.zoomLevel > map.minimumZoomLevel
                sequence: StandardKey.ZoomOut
                onActivated: map.zoomLevel = Math.round(map.zoomLevel - 1)
            }
        }
    }
}
