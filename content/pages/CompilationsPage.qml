import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples
import '../services/compilations.js' as CompilationsTools
import '../ui'
import '../components/compilation'

Page {
    id: compilations_page
    objectName: Constants.compilationsPageName

    background: Rectangle {
        anchors.fill: parent
        color: 'transparent'
    }

    property var compilationsData
    property string nextPageUrl

    ScrollView {
        id: compilations_view
        anchors {
            fill: parent
            margins: 10
        }

        Column {
            anchors.fill: parent

            Row {
                id: collection_block
                width: parent.width
                spacing: 10

                Rectangle {
                    id: collection_icon
                    height: 90
                    width: height
                    radius: 4
                    clip: true
                    color: '#f2f0b6'
                    border {
                        width: 1
                        color: 'lightgray'
                    }

                    Icon {
                        height: parent.height
                        width: height
                        iconUrl: Constants.getIcon('Group')
                        iconMargins: 10
                    }
                }

                Column {
                    width: parent.width - collection_icon.width
                    height: parent.height
                    spacing: 2

                    Label {
                        id: today_events_title
                        text: 'Подборки'
                        font {
                            bold: true
                            pointSize: 16
                        }
                    }
                    Label {
                        id: today_events_description
                        text: 'Подборки мероприятий, фильмов, выставок, объединённых общей тематикой. Составлено и оформлено командой <b>KudaGo</b> специально для читателей.'
                        font {
                            pointSize: 10
                        }
                        opacity: 0.6
                        width: parent.width - 5
                        wrapMode: Text.WordWrap
                        elide: "ElideRight"
                    }
                }
            }

            Item {
                width: parent.width
                height: parent.height - collection_block.height

                CompilationsList {
                    anchors {
                        topMargin: 40
                    }

                    compilations: compilationsData
                    nextPageLink: nextPageUrl
                }
            }
        }
    }

    Component.onCompleted: {
        CompilationsTools.getAllCompilations(
            (results, next) => {
                compilationsData = results
                nextPageUrl = next
            }
        )
    }
}
