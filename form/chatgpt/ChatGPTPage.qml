import QtQuick 2.4

ChatGPTPageForm {

    Connections {
        target: tabPage
        onTabClicked: function (index) {
            tabPage.redRound = false
            tabPage.itemSelectIndex = index
//            checkPageChanged()
        }
    }


}
