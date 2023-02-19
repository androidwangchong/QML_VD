import QtQuick 2.4
import "../../widget"

Item {

    property alias tabPage: tabPage

    width: 952
    height: 707

    WRectangle {
        id: mainRect
        width: 952
        height: 707
        groupName: "main_page_rect_bg"


        Row {
            id: stypeButtonRow
            spacing: 30
            anchors {
                top: parent.top
                topMargin: 30
                horizontalCenter: parent.horizontalCenter
            }
            WGradientButton {
                id: leftIconButton
                height: 44
                iconWidth: 24
                iconHeight: 24
                iconTextGap: 8
                textGroupName: "left_icon_button_text"
                bgGroupName: "left_icon_button_bg"
                iconGroupName: "download_button"
                buttonText: qsTr("Download")
            }

            WGradientButton {
                id: textButton
                height: 44
                textGroupName: "left_icon_button_text"
                bgGroupName: "left_icon_button_bg"
                buttonText: qsTr("Download")
            }

            WGradientButton {
                id: miniButton
                height: 44
                textGroupName: "left_icon_button_text"
                bgGroupName: "left_icon_button_bg"
                buttonText: qsTr("1")
            }
        }
        Row {
            id: stypeOutLineButtonRow
            spacing: 30
            anchors {
                top: stypeButtonRow.bottom
                topMargin: 30
                horizontalCenter: parent.horizontalCenter
            }
            WGradientButton {
                id: leftIconOutlineButton
                height: 32
                iconWidth: 16
                iconHeight: 16
                iconTextGap: 4
                gapWidth: 16
                buttonTextWeight: Font.Normal
                textGroupName: "left_icon_out_line_button_text"
                bgGroupName: "left_icon_out_line_button_bg"
                iconGroupName: "download_button"
                buttonText: qsTr("Download")
            }

            WGradientButton {
                id: outlineButton
                height: 32
                gapWidth: 16
                buttonTextWeight: Font.Normal
                textGroupName: "out_line_button_text"
                bgGroupName: "out_line_button_bg"
                buttonText: qsTr("Download")
            }
            WGradientButton {
                id: miniOutLineButton
                height: 32
                minWidth: 70
                textGroupName: "out_line_button_text"
                bgGroupName: "out_line_button_bg"
                buttonText: qsTr("1")
            }

        }
        Row {
            id: ghostButtonRow
            spacing: 30
            anchors {
                top: stypeOutLineButtonRow.bottom
                topMargin: 30
                horizontalCenter: parent.horizontalCenter
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
                buttonText: qsTr("Download")
            }

            WTabButton {
                id: tabPage
                width: 320; height: 28
                tabItem1Text: qsTr("Converting")
                tabItem2Text: qsTr("Finished")

            }

        }


    }

}
