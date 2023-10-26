import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples
import '../ui'

Item {
    id: credits_container
    width: parent.width
    height: 500

    function getStaticCreditItems() {
        return [
            {
                title: 'Графический дизайнер',
                value: 'Darya Bondarenko',
                firstIcon: Constants.getIcon('GraphicDesign', false),
                secondIcon: Constants.getIcon('Cat', false)
            }

        ]
    }

    Column {
        anchors {
            fill: parent
            margins: 10
        }

        Item {
            width: parent.width
            height: 100

            Icon {
                width: 80
                height: width
                iconUrl: Constants.getIcon('GraphicDesign', false)
                anchors {
                    left: parent.left
                    top: parent.top
                    leftMargin: 20
                    topMargin: 10
                }
                opacity: 0.6
            }

            Column {
                anchors {
                    verticalCenter: parent.verticalCenter
                    right: parent.right
                }

                Label {
                    id: title
                    text: 'UI,UX-дизайнер'
                    font {
                        weight: 900
                        pointSize: 16
                    }
                    horizontalAlignment: "AlignRight"
                    opacity: 0.8
                }
                Label {
                    id: value
                    text: 'Darya Bondarenko'
                    font {
                        weight: 600
                        pointSize: 12
                    }
                    horizontalAlignment: "AlignRight"
                    opacity: 0.5
                }
            }
        }
        Item {
            width: parent.width
            height: 100

            Icon {
                width: 90
                height: width
                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                }

                iconUrl: Constants.getIcon('Code')
            }

            Column {
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                }

                Label {
                    text: 'Разработчик'
                    font: title.font
                    opacity: title.opacity
                    horizontalAlignment: "AlignLeft"
                }
                Label {
                    text: 'Pavel Zhigalov'
                    font: value.font
                    opacity: value.opacity
                    horizontalAlignment: "AlignLeft"
                }
            }
        }
    }
}
