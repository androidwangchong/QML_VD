import QtQuick 2.4

ToolBarForm {

    signal miniWindowClicked
    signal maxWindowClicked
    signal colseWindowClicked
    signal activeButtonClicked



    miniButton.onClicked :{
        miniWindowClicked()
    }
    maxButton.onClicked :{
        maxWindowClicked()
    }
    closeButton.onClicked :{
        colseWindowClicked()
    }
    activeButton.onClicked :{
        activeButtonClicked()
    }
    toolBarMouseArea.onPressed: {
        toolBarMouseArea.clickPos = Qt.point(toolBarMouseArea.mouseX, toolBarMouseArea.mouseY)
    }
    toolBarMouseArea.onPositionChanged: {
        var delta = Qt.point(toolBarMouseArea.mouseX - toolBarMouseArea.clickPos.x,
                             toolBarMouseArea.mouseY - toolBarMouseArea.clickPos.y)
        _root_window_.setX(_root_window_.x + delta.x)
        _root_window_.setY(_root_window_.y + delta.y)
    }

}
