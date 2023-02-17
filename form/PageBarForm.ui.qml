import QtQuick 2.4
import "../widget"


Item {

    property alias listview: listview
    width: 192
    height: 184
    ListView {
        id: listview
        width: 192
        height: 184
        interactive: false
        anchors {
            top: parent.top; topMargin: 26
            horizontalCenter: parent.horizontalCenter
        }
        highlight: Item {
            WRectangle {
                width: parent.width
                height: parent.height - 2 * 2
                anchors.centerIn: parent
                groupName: "pagebar_listview_item_select"
            }
        }
        highlightFollowsCurrentItem: true
        highlightMoveDuration: 200
    }


}
