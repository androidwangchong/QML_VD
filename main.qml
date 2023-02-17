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

QTQUICKCONTROLS.ApplicationWindow {
    id: _root_window_

//    color: "#00000000"
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    flags: isWin32Platform ? (Qt.FramelessWindowHint | Qt.Window): Qt.Window

    property string defaultAppStartupTheme: "Light"
    property bool isWin32Platform: Qt.platform.os === "windows" || Qt.platform.os === "winrt"


    T2DWorld {
        id: appTheme
        appThemePaths: ["qrc:/themes/"]
        appStartupTheme: defaultAppStartupTheme
        mouseAreaCursorShape: Qt.PointingHandCursor
    }

    WGradientButton {
        id: wGradientButton
        width: 128
        height: 38
        bgGroupName: "activate_button_bg"
        fillGroupName: "activate_button_bg"
        anchors {
            centerIn: parent
        }
        buttonText: "123123123123"
    }




}
