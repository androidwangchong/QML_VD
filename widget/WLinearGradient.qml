import QtQuick 2.6
import QtGraphicalEffects 1.0
import Toou2D 1.0

LinearGradient {
    id: root
    state: "normal"
    property alias groupName: theme.groupName
    onGroupNameChanged: {
        theme.initialize()
    }

    gradient: Gradient {
        GradientStop {
            id: gradientStart
            position: 0.0
        }
        GradientStop {
            id: gradientStop
            position: 1.0
        }
    }
    start: Qt.point(theme.gradientStartX, theme.gradientStartY)
    end: Qt.point(theme.gradientEndX >= 0 ? theme.gradientEndX : root.width,
                  theme.gradientEndY >= 0 ? theme.gradientEndY : root.height)

    TThemeBinder {
        id: theme
        state: root.enabled ? root.state : "disable"
        className: "WLinearGradient"

        property int gradientStartX: 0
        property int gradientEndX: 0
        property int gradientStartY: 0
        property int gradientEndY: 0
        property alias gradientStartColor: gradientStart.color
        property alias gradientStopColor: gradientStop.color

        Component.onCompleted: {
            initialize()
        }
    }
}
