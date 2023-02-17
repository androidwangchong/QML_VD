import QtQuick 2.6
import QtGraphicalEffects 1.0

Item {
    id: root
    width: Math.max(minWidth, itemList.width + gapWidth * 2)
    property alias buttonText: btnText.text
    property alias buttonRadius: bg.radius
    property alias radiusCorners: bg.radiusCorners

    property string textGroupName: ""
    property string bgGroupName: ""
    property string fillGroupName: ""
    property string iconGroupName: ""

    property int gapWidth: 20
    property int minWidth: 0
    property int vOffset: 0

    property int iconWidth: 0
    property int iconHeight: 0
    property int iconTextGap: 0


    signal clicked
    signal entered
    signal exited

    WRoundRectangle {
        id: bg
        radius: 4
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
        }
    }
}
