import QtQuick 2.6
import Toou2D 1.0

Text {
    id: root
    property bool enableMouse: false
    property alias groupName: theme.groupName
//    property var fBoldName: bold.name
    property alias familyName: root.font.family
    onGroupNameChanged: {
        theme.initialize()
    }

    signal clicked
    signal entered
    signal exited

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        enabled: enableMouse
        visible: enableMouse
        hoverEnabled: enableMouse
        cursorShape: containsMouse ? Qt.PointingHandCursor : Qt.ArrowCursor
        onClicked: root.clicked()
        onPressed: root.state = "press"
        onReleased: root.state = containsMouse ? "hover" : "normal"
        onEntered: {
            root.state = "hover"
            root.entered()
        }
        onExited: {
            root.state = "normal"
            root.exited()
        }
    }

    TThemeBinder {
        id: theme
        state: root.enabled ? root.state : "disable"
        className: "WTextView"

        property int family: 0
        property alias color: root.color
        property alias bold: root.font.bold
        property alias opacity: root.opacity
        property alias weight: root.font.weight
        property alias pixelSize: root.font.pixelSize

        function init() {
            initialize()
//            if (family === 0) {
//                root.font.family = semibold.name
//            } else if (family === 1) {
//                root.font.family = fBoldName
//            } else if (family === 2) {
//                root.font.family = medium.name
//            } else if (family === 3) {
//                root.font.family = light.name
//            } else if (family === 4) {
//                root.font.family = regular.name
//            }
        }

        Component.onCompleted: {
            init()
        }
    }
}
