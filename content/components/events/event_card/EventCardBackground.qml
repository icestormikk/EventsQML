import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples

SwipeView {
    id: swiper
    width: Constants.width
    height: 250

    required property var eventImages

    currentIndex: 0

    Repeater {
        id: images
        model: eventImages
        delegate: Image {
            id: image
            asynchronous: true
            source: eventImages[index]['thumbnails']['640x384']
            fillMode: Image.PreserveAspectFit
            autoTransform: true

            onStatusChanged: {
                if (image.status === Image.Ready && index === 0) {
                    if (Constants.height / 2.5 < image.paintedHeight) {
                        swiper.height = Constants.height / 2.5
                        image.fillMode = Image.PreserveAspectCrop
                    } else {
                        swiper.height = Math.max(100, image.paintedHeight)
                    }
                }
            }
        }
    }

    onCurrentItemChanged: {
        //console.log(currentItem.paintedHeight, Constants.height / 2)
        swiper.height = Math.max(100, currentItem.paintedHeight)
    }
}
