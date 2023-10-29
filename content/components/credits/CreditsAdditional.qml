import QtQuick 2.15
import QtQuick.Controls
import ProjectSamples

Item {
    id: credits_additional_info_block
    width: parent.width
    height: 100

    function getStaticCreditsInfos() {
        return [
            {
                title: 'Код приложения',
                description: 'Исходный код приложения размещён в <a href="https://github.com/icestormikk/EventsQML"><b>публичном репозитории</b></a> на GitHub.'
            },
            {
                title: 'Стек инструментов',
                description: 'Приложение было написано с использованием следующих языков: ' + ['QML', 'JavaScript', 'C++'].map((lang) => `<b>${lang}</b>`).join(', ')
            }
        ]
    }

    Column {
        anchors {
            left: parent.left
            leftMargin: 10
            right: parent.right
            rightMargin: 10
        }
        spacing: 6

        Repeater {
            id: info_block
            width: parent.width

            model: getStaticCreditsInfos()
            delegate: Column {
                width: info_block.width

                Label {
                    width: parent.width
                    font {
                        weight: 900
                        pointSize: 14
                    }
                    text: modelData['title']
                    wrapMode: Text.WordWrap
                    color: Constants.secondaryColor
                }
                Label {
                    width: parent.width
                    font {
                        pointSize: 10
                    }
                    text: modelData['description']
                    wrapMode: Text.WordWrap
                    opacity: 0.8
                    color: Constants.secondaryColor
                    onLinkActivated: (link) => {
                        Qt.openUrlExternally(link)
                    }
                }
            }
        }
    }
}
