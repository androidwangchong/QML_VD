import QtQuick 2.4
import QtQuick.Controls 2.14
import "chatgpt"
import "downloader"
import "video2mp3"
import "../widget"

Item {

    property alias swipeView: swipeView



    property var shadowSize: 10

    width: parent.width - shadowSize
    height: parent.height - shadowSize


    SwipeView {
        id: swipeView

        interactive: false
        orientation: Qt.Vertical
        clip: true
        anchors {
            fill: parent
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
