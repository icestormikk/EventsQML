import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples

Rectangle {
    id: news_card

    anchors {
        left: parent.left
        right: parent.right
    }
    height: news_info_container.height + 10
    color: 'white'
    radius: 6

    Column {
        id: news_info_container
        width: parent.width
        spacing: 10

        NewsImagesSwiper {
            width: parent.width
            height: 240
            newsImages: modelData['images']
        }

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width - 10
            spacing: 6

            Label {
                id: news_title
                text: modelData['title']
                font {
                    weight: 800
                    pointSize: 12
                }
                wrapMode: Text.WordWrap
                width: parent.width
            }
            Label {
                id: news_description
                text: modelData['description']
                font {
                    pointSize: 10
                }
                opacity: 0.6
                wrapMode: Text.WordWrap
                elide: "ElideRight"
                width: parent.width
            }
        }
    }

    MouseArea {
        width: parent.width
        height: parent.height
        onClicked: {
            Qt.openUrlExternally(modelData['site_url'])
        }
    }
}
