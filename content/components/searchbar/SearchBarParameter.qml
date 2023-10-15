import QtQuick 2.15
import ProjectSamples
import '../extending_block'
import '../../ui'

Item {
    id: parameter_container

    property alias title: parameter_block.title
    property alias url: parameter_block.contentUrl
    property alias iconTitle: parameter_block.iconTitle
    property alias headerColorCode: parameter_block.headerColor
    property alias contentColorCode: parameter_block.contentColor

    property bool isCompleted: false
    property var onSubmit: (...args) => {}

    width: parent.width
    height: parameter_block.height

    ExtendingBlock {
        id: parameter_block
        title: 'Parameter title'
        contentUrl: ''
        iconTitle: 'Text'
        headerColor: 'gray'
        contentColor: 'lightgray'
    }

    AppliedLabel {
        anchors {
            right: parent.right
            rightMargin: 10
            top: parent.top
            topMargin: 10
        }
        visible: isCompleted
    }
}
