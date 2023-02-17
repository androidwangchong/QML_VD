import QtQuick 2.6
import Toou2D 1.0
import QtGraphicalEffects 1.0

/*
                        Qt.AlignLeft |      Qt.AlignLeft |      Qt.AlignRight |     Qt.AlignLeft |      Qt.AlignLeft |
                        Qt.AlignRight |     Qt.AlignTop |       Qt.AlignTop |       Qt.AlignRight |     Qt.AlignRight |
          None:0        Qt.AlignTop |       Qt.AlignBottom      Qt.AlignBottom      Qt.AlignTop         Qt.AlignBottom
                        Qt.AlignBottom
    *****************     *************       ***************   ***************       *************     *****************
    *               *    *             *     *              *   *              *     *             *    *               *
    *               *   *               *   *               *   *               *   *               *   *               *
    *               *   *               *   *               *   *               *   *               *   *               *
    *               *   *               *   *               *   *               *   *               *   *               *
    *               *   *               *   *               *   *               *   *               *   *               *
    *               *   *               *   *               *   *               *   *               *   *               *
    *               *    *             *     *              *   *              *    *               *    *             *
    *****************     *************       ***************   ***************     *****************     *************
*/

Item {
    id: root
    state: "normal"
    property int radius: 0
    property Component contentItem
    property bool enableMouse: false
    property int defaultCorners: Qt.AlignLeft | Qt.AlignRight | Qt.AlignTop | Qt.AlignBottom
    property int radiusCorners: defaultCorners

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

    QtObject {
        id: internal
        function aligns(direction) {
            return (root.radiusCorners & direction) === direction
        }
    }

    Loader {
        id: srcItem
        visible: false
        state: root.state
        enabled: root.enabled
        anchors.fill: parent
        sourceComponent: contentItem
    }

    Item {
        id: maskItem
        visible: false
        anchors.fill: parent
        Repeater {
            model: [
                {
                    "x": 0,
                    "y": root.radius,
                    "round": false,
                    "width": root.width,
                    "height": root.height - root.radius * 2,
                    "radius": root.radius
                }, {
                    "x": root.radius,
                    "y": 0,
                    "round": false,
                    "width": root.width - root.radius * 2,
                    "height": root.height,
                    "radius": root.radius
                }, {
                    "x": 0,
                    "y": 0,
                    "round": internal.aligns(Qt.AlignLeft | Qt.AlignTop),
                    "width": root.radius * 2,
                    "height": root.radius * 2,
                    "radius": root.radius
                }, {
                    "x": root.width - root.radius * 2,
                    "y": 0,
                    "round": internal.aligns(Qt.AlignRight | Qt.AlignTop),
                    "width": root.radius * 2,
                    "height": root.radius * 2,
                    "radius": root.radius
                }, {
                    "x": 0,
                    "y": root.height - root.radius * 2,
                    "round": internal.aligns(Qt.AlignLeft | Qt.AlignBottom),
                    "width": root.radius * 2,
                    "height": root.radius * 2,
                    "radius": root.radius
                }, {
                    "x": root.width - root.radius * 2,
                    "y": root.height - root.radius * 2,
                    "round": internal.aligns(Qt.AlignRight | Qt.AlignBottom),
                    "width": root.radius * 2,
                    "height": root.radius * 2,
                    "radius": root.radius
                }
            ]
            Rectangle {
                x: modelData.x; y: modelData.y
                width: modelData.width; height: modelData.height
                radius: modelData.round ? modelData.radius : 0
                color: "black"
            }
        }
    }

    Rectangle {
        id: maskItemRect
        visible: false
        radius: root.radius
        smooth: true
        anchors.fill: parent
    }

    OpacityMask {
        anchors.fill: srcItem
        source: srcItem
        maskSource: radiusCorners === defaultCorners ? maskItemRect : maskItem
        visible: true
        antialiasing: true
    }
}
