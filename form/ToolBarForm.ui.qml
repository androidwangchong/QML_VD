import QtQuick 2.4
import "../widget"

Rectangle {
    width: 1180
    height: 48
    color: "#00000000"

    property alias miniButton: miniButton
    property alias maxButton: maxButton
    property alias closeButton: closeButton
    property alias activeButton: activeButton
    property alias toolBarMouseArea: toolBarMouseArea


    MouseArea {
        id: toolBarMouseArea
        anchors {
            left: parent.left
            top: parent.top
        }
        width: parent.width
        height: parent.height
        acceptedButtons: Qt.LeftButton //只处理鼠标左键
        property point clickPos: "0,0"
    }


    Row {
        id: buttonRow
        spacing: 2
        anchors {
            right: parent.right
            rightMargin: 21
            verticalCenter: parent.verticalCenter
        }
        WImageButton {
            id: miniButton
            width: 32
            height: 32
            iconWidth: 20
            iconHeight: 20
            bgGroupName: "max_button_bg"
            iconGroupName: "mini_button"

        }
        WImageButton {
            id: maxButton
            width: 32
            height: 32
            iconWidth: 20
            iconHeight: 20
            bgGroupName: "max_button_bg"
            iconGroupName: "max_button"

        }
        WImageButton {
            id: closeButton
            width: 32
            height: 32
            iconWidth: 20
            iconHeight: 20
            bgGroupName: "close_button_bg"
            iconGroupName: "close_button"

        }
    }
    WGradientButton {
        id: activeButton
        height: 32
        buttonText: qsTr("Upgrade to Pro")
        buttonRadius: 5
        iconWidth: 24
        iconHeight: 24
        iconTextGap: 5
        gapWidth: 7
        textGroupName: "active_button_text"
        iconGroupName: "active_button_image"
        bgGroupName: "activate_button_bg"
        fillGroupName: "activate_button_bg"
        anchors {
            right: buttonRow.left
            rightMargin: 16
            verticalCenter: parent.verticalCenter
        }
    }


}
