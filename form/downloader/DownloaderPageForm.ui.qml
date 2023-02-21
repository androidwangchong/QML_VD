import QtQuick 2.4
import QtQuick.Controls 2.14
import "../../widget"

Item {

    property alias tabPage: tabPage



    WRectangle {
        id: mainRect
        anchors.fill: parent
        radius: 8
        groupName: "main_page_rect_bg"


        WTabButton {
            id: tabPage
            width: 213; height: 37
            tabItem1Text: qsTr("Converting")
            tabItem2Text: qsTr("Finished")
            itemSelectIndex: 0
            anchors {
                left: parent.left
                leftMargin: 24
                top: parent.top
                topMargin: 16
            }
        }


        WGradientButton {
            id: ghostButton
            height: 32
            iconWidth: 16
            iconHeight: 16
            iconTextGap: 8
            gapWidth: 12
            buttonTextWeight: Font.Normal
            textGroupName: "ghost_button_text"
            bgGroupName: "ghost_button_bg"
            iconGroupName: "add_files_button_image"
            buttonText: qsTr("Paste URL")
            anchors {
                right: parent.right
                rightMargin: 24
                top: parent.top
                topMargin: 19
            }
        }


        WRectangle {
            id: line
            width: parent.width
            height: 1
            groupName: "rect_line_bg"
            anchors {
                top: parent.top
                topMargin: 68
            }
        }






        SwipeView {
            width: parent.width
            anchors {
                top: line.bottom
                bottom: parent.bottom
            }
            interactive: false
            orientation: Qt.Horizontal
            currentIndex: tabPage.itemSelectIndex
            clip: true
            Item {
                DownloadingPage {
                    id: downloadingPage
                    anchors.fill: parent
                }
            }
            Item {
                DownloadFinishPage {
                    id: finishPage
                    anchors.fill: parent
                }
            }
        }

















    }
}
