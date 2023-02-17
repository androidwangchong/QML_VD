import QtQuick 2.6
import Toou2D 1.0

Image {
    id: root
    state: "normal"
    asynchronous: true
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
        hoverEnabled: enableMouse
        visible: enableMouse
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
        className: "WImage"

        property alias source: root.source

        Component.onCompleted: {
            initialize()
        }
    }
}
