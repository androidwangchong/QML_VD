import QtQuick 2.6
import Toou2D 1.0

Rectangle {
    id: root
    state: "normal"
    property bool enableMouse: false
    property alias groupName: theme.groupName
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
        className: "WRectangle"

        property alias color: root.color
        property alias width: root.width
        property alias height: root.height
        property alias radius: root.radius
        property alias opacity: root.opacity

        TThemeBinder {
            target: root.border
            childName: "border"

            property int width: root.border.width
            property color color: root.border.color
        }

        Component.onCompleted: {
            initialize()
        }
    }
}
