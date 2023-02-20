import QtQuick 2.4

DownloaderPageForm {

    Connections {
        target: tabPage
        onTabClicked: function (index) {
            tabPage.redRound = false
            tabPage.itemSelectIndex = index
//            checkPageChanged()
        }
    }

}
