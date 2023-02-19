import QtQuick 2.4
import QtQuick.Controls 2.14
import "chatgpt"
import "downloader"
import "video2mp3"
import "../widget"

Item {

    property alias swipeView: swipeView

    property var rectWidth: 952
    property var rectHeight: 707

    property var shadowSize: 10

    width: rectWidth + shadowSize
    height: rectWidth + shadowSize


    SwipeView {
        id: swipeView
        width: rectWidth
        height: rectWidth
        interactive: false
        orientation: Qt.Vertical
        clip: true
        anchors {
            centerIn: parent
        }

        Item {
            ChatGPTPage {
                anchors.fill: parent
            }
        }
        Item {
            DownloaderPage {
                id: downloaderPage
                anchors.fill: parent
            }
        }
        Item {
            Video2MP3Page {
                anchors.fill: parent
            }
        }
    }










}
