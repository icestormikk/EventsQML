import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples

Item {
    id: credits_container
    width: parent.width
    height: 600

    function getStaticCreditSections() {
        return [
            {
                title: 'Авторы',
                componentUrl: './CreditsAuthors.qml'
            },
            {
                title: 'API',
                componentUrl: './CreditsApi.qml'
            },
            {
                title: 'Дополнительно',
                componentUrl: './CreditsAdditional.qml'
            }
        ]
    }

    Column {
        anchors.fill: parent

        Repeater {
            id: sections_repeater
            width: parent.width

            model: getStaticCreditSections()
            delegate: Column {
                width: sections_repeater.width

                Rectangle {
                    width: parent.width
                    height: 40
                    color: Constants.activeTheme ? Qt.rgba(255, 255, 255, 0.1) : 'lightgray'

                    Label {
                        id: section_header
                        anchors.centerIn: parent
                        font {
                            bold: true
                            pointSize: 14
                        }
                        text: modelData['title']
                        color: Constants.secondaryColor
                    }
                }

                Loader {
                    id: section_loader
                    width: parent.width
                    height: childrenRect.height
                    source: modelData['componentUrl']
                }
            }
        }
    }
}
