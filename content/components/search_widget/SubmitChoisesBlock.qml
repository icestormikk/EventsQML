import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples

ListView {
    id: parameters_block

    required property var items
    required property var swipeContainer

    width: parent.width
    height: 100
    spacing: 8
    model: items
    delegate: Button {
        width: parent.width
        height: parameter_name.height

        Label {
            id: parameter_name
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
            }

            text: `${modelData[1].name}: `
            font {
                pointSize: 12
            }
            color: Constants.secondaryColor
        }

        Label {
            id: parameter_value
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }

            text: modelData[1].onShow()
            font: parameter_name.font
            opacity: 0.6
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere
            color: parameter_name.color
        }

        background: Rectangle {
            anchors.fill: parent
            color: 'transparent'
        }

        onClicked: {
            swipeContainer.setCurrentIndex(index)
        }
    }
}
