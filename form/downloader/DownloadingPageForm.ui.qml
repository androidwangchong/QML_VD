import QtQuick 2.4
import "../../widget"

Item {

    anchors.fill: parent
    WRectangle {
        id: noDownloadRect
        width: parent.width - 2
        height: parent.height - 2
        anchors {
            centerIn: parent
        }
        radius: 8

        WImage {
            id: bgImage
            width: 440
            height: 320
            groupName: "downloader_url_bg"
            anchors {
                top: parent.top
                topMargin: 126
                horizontalCenter: parent.horizontalCenter
            }

        }


        WImage {
            id: bgIcon
            width: 106
            height: 105
            groupName: "downloader_url_icon"
            anchors {
                top: bgImage.top
                topMargin: 29
                horizontalCenter: parent.horizontalCenter
            }
        }

        WTextView {
            id: title
            groupName: "downloader_url_title"
            text: qsTr("Drop video files here")
            anchors {
                top: bgIcon.bottom
                topMargin: 20
                horizontalCenter: parent.horizontalCenter
            }
            font {
                weight: Font.Medium
            }
        }

        WTextView {
            id: content
            width: 343
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignHCenter
            groupName: "downloader_url_content"
            text: qsTr("Support for downloading audio and video from over 10,000 sites")
            anchors {
                top: title.bottom
                topMargin: 8
                horizontalCenter: parent.horizontalCenter
            }
        }

        WGradientButton {
            id: textButton
            height: 36
            textGroupName: "left_icon_button_text"
            bgGroupName: "left_icon_button_bg"
            buttonText: qsTr("Paste URL")
            anchors {
                top: content.bottom
                topMargin: 20
                horizontalCenter: parent.horizontalCenter
            }
        }



    }



}
