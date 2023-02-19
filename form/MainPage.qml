import QtQuick 2.4

MainPageForm {


    function positionViewAtIndex(idx) {
        for (let i = 0; i < swipeView.count; ++i) {
            swipeView.itemAt(i).visible = true
        }
        swipeView.contentItem.highlightMoveDuration = 250
        swipeView.currentIndex = idx
        swipeViewTimer.restart()
    }


    Timer {
        id: swipeViewTimer
        interval: 500
        onTriggered: {
            swipeView.contentItem.highlightMoveDuration = 0
            for (let i = 0; i < swipeView.count; ++i) {
                if (swipeView.currentIndex === i) continue
                swipeView.itemAt(i).visible = false
            }
        }
    }

    Connections {
        target: pageBar
        onCurrentIndexChanged: {
            positionViewAtIndex(pageBar.currentIndex)
        }
    }
}
