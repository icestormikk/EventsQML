import QtQuick 2.15
import ProjectSamples
import '../news'
import '../../ui'

Item {
    id: compilation_card
    anchors.fill: parent

    property var compilationData

    NewsImagesSwiper {
        id: swiper
        width: parent.width
        height: 250
        newsImages: compilationData['images']
    }

    Item {
        anchors {
            fill: parent
            margins: 10
        }

        IconButton {
            anchors {
                left: parent.left
            }

            size: 40
            url: Constants.getIcon('Previous', false)
            bgColor: Qt.rgba(255, 255, 255, 0.5)
            radius: 4

            onButtonClicked: () => {
                pages_stack.pop()
            }
        }
    }

    CompilationCardContent {
        id: content_block
        y: swiper.height - content_block.radius
        radius: 30
        width: parent.width
        height: Constants.height - y
    }
}
