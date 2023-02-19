import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.2 as QTQUICKCONTROLS
import QtQuick.Layouts 1.3
import Toou2D 1.0
import QtMultimedia 5.12
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.2
import Qt.labs.platform 1.1
import "widget"
import "form"

QTQUICKCONTROLS.ApplicationWindow {
    id: _root_window_

    color: "#00000000"
    visible: true
    width: 1180
    height: 767
    title: qsTr("Hello World")
    flags: isWin32Platform ? (Qt.FramelessWindowHint | Qt.Window): Qt.Window



    property string defaultAppStartupTheme: "Light"
    property bool isWin32Platform: Qt.platform.os === "windows" || Qt.platform.os === "winrt"
    property int _beforeMinVisibility: Window.Windowed
    property bool isForceExit: false


    T2DWorld {
        id: appTheme
        appThemePaths: ["qrc:/themes/"]
        appStartupTheme: defaultAppStartupTheme
        mouseAreaCursorShape: Qt.PointingHandCursor
    }

    Rectangle {
        id: rootRect
        width: 1180
        height: 767
        color: "#00000000"
        WImage {
            id: mainBgImage
            anchors {
                fill: parent
            }
            groupName: "mainBgImage"
        }
        ToolBar {
            id: toolBar
        }
        WImage {
            id: appNameImage
            width: 216
            height: 150
            groupName: "app_name_image"
        }
        PageBar {
            id: pageBar
            anchors {
                left: parent.left
                leftMargin: 12
                top: parent.top
                topMargin: 113
            }
        }

        MainPage {
            id: mainPage
            anchors {
                top: parent.top
                topMargin: 43
                right: parent.right
                rightMargin: 7
            }
        }

    }


    Connections {
        target: toolBar
        onMiniWindowClicked: {
            minimizeWindows()
        }
        onMaxWindowClicked: {
            maximizeWindows()
        }
        onColseWindowClicked: {
            exitProgram()
        }
        onActiveButtonClicked: {

        }
    }
    function exitProgram(forceExit = false) {
        console.log("exitProgram:", forceExit)
        _root_window_.isForceExit = forceExit
        if (isForceExit) {
            closeAllDialog()
        }
        _root_window_.close()
    }
    function minimizeWindows() {
        if (isMinVisibility()) return
        _beforeMinVisibility = _root_window_.visibility
        _root_window_.showMinimized()
    }
    function maximizeWindows() {
        if (isMaxVisibility() || isMinVisibility()) return
        _root_window_.showMaximized()
        _beforeMinVisibility = _root_window_.visibility
    }
    function restoreWindows() {
        if (!isMaxVisibility() || isMinVisibility()) return
        _root_window_.showNormal()
        _beforeMinVisibility = _root_window_.visibility
    }
    function isMaxVisibility() {
        return _root_window_.visibility === Window.Maximized
    }
    function isMinVisibility() {
        return _root_window_.visibility === Window.Minimized
    }
    function isFullScreenVisibility() {
        return _root_window_.visibility === Window.FullScreen
    }


}
