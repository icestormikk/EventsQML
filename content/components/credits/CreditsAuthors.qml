import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples
import '../../ui'

Column {
    anchors {
        left: parent.left
        leftMargin: 10
        right: parent.right
        rightMargin: 10
    }
    height: 250

    Item {
        width: parent.width
        height: 100

        Icon {
            id: designer_icon
            width: 110
            height: width
            iconUrl: Constants.getIcon('Designer', false)
            anchors {
                left: parent.left
                top: parent.top
                topMargin: 10
            }
        }
        Icon {
            width: 40
            height: width
            iconUrl: Constants.getIcon('GraphicDesign', false)
            x: designer_icon.width
            y: designer_icon.height - height
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
                color: Constants.secondaryColor
            }
            Label {
                id: value
                text: 'Darya Bondarenko'
                font {
                    weight: 600
                    pointSize: 12
                }
                horizontalAlignment: "AlignRight"
                color: Constants.secondaryColor
                opacity: 0.5
            }
        }
    }
    Item {
        width: parent.width
        height: 110

        Icon {
            id: programmer_icon
            width: 120
            height: width
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }

            iconUrl: Constants.getIcon('Programmer', false)
        }
        Icon {
            width: 80
            height: width
            iconUrl: Constants.getIcon('Code', false)
            anchors {
                right: programmer_icon.left
                rightMargin: -10
                bottom: programmer_icon.bottom
            }

            opacity: 0.6
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
                color: Constants.secondaryColor
            }
            Label {
                text: 'Pavel Zhigalov'
                font: value.font
                opacity: value.opacity
                horizontalAlignment: "AlignLeft"
                color: Constants.secondaryColor
            }
        }
    }
}
