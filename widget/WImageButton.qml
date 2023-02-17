import QtQuick 2.6
import QtGraphicalEffects 1.0

Item {
    id: root

    property int iconWidth: 0
    property int iconHeight: 0
    property string iconGroupName: ""
    property string bgGroupName: ""
    property alias bgRadius: bg.radius


    signal clicked
    signal entered
    signal exited


    WRectangle {
        id: bg
        radius: 8
        enableMouse: true
        enabled: root.enabled
        anchors.fill: parent
        groupName: bgGroupName
        onClicked: root.clicked()
        onEntered: root.entered()
        onExited: root.exited()
    }

    WImage {
        id: btnIcon
        state: bg.state
        enabled: bg.enabled
        width: iconWidth; height: iconHeight
        anchors {
            centerIn: parent
        }
        groupName: iconGroupName
    }
}
