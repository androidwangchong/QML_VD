import QtQuick 2.6
import QtGraphicalEffects 1.0

Item {
    id: root
    width: Math.max(minWidth, itemList.width + gapWidth * 2)
    property alias buttonText: btnText.text
    property alias buttonRadius: bg.radius
    property alias radiusCorners: bg.radiusCorners
    property alias buttonState: bg.state
    property alias buttonTextWeight: btnText.font.weight

    property string textGroupName: ""
    property string bgGroupName: ""
    property string fillGroupName: "transparent_button_bg"
    property string iconGroupName: ""

    property int gapWidth: 24
    property int minWidth: 90
    property int vOffset: 0

    property int iconWidth: 0
    property int iconHeight: 0
    property int iconTextGap: 0



    signal clicked
    signal entered
    signal exited

    WRoundRectangle {
        id: bg
        enableMouse: true
        enabled: root.enabled
        anchors.fill: parent
        contentItem: WRectangle {
            id: bgRect
            state: parent.state
            enabled: parent.enabled
            groupName: bgGroupName
            WLinearGradient {
                id: fillRect
                state: parent.state
                enabled: parent.enabled
                anchors.fill: parent
                source: parent
                groupName: fillGroupName
            }
            Component.onCompleted: {
                bg.radius = bgRect.radius
            }
        }

        onClicked: root.clicked()
        onEntered: root.entered()
        onExited: root.exited()
    }



    Row {
        id: itemList
        width: btnText.contentWidth + btnIcon.width + iconTextGap
        spacing: iconTextGap
        anchors.centerIn: parent
        WImage {
            id: btnIcon
            state: bg.state
            enabled: bg.enabled
            width: iconWidth; height: iconHeight
            anchors {
                verticalCenter: parent.verticalCenter
                verticalCenterOffset: vOffset
            }
            groupName: iconGroupName
        }
        WTextView {
            id: btnText
            state: bg.state
            enabled: bg.enabled
            anchors {
                verticalCenter: parent.verticalCenter
                verticalCenterOffset: vOffset
            }
            groupName: textGroupName
            font {
                weight: Font.Bold
            }
        }
    }

    states: [
        State {
            name: "GENERAL"
            PropertyChanges {
                target: root
                enabled: true
            }
        },
        State {
            name: "hover"
            PropertyChanges {
                target: root
                enabled: true
            }
        },
        State {
            name: "press"
            PropertyChanges {
                target: root
                enabled: true
            }
        },
        State {
            name: "disable"
            PropertyChanges {
                target: root
                enabled: false
            }
        }
    ]



}
