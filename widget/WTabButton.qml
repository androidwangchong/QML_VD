import QtQuick 2.14

WRectangle {
    id: root
    radius: 5
    groupName: "tab_button_bg"

    property bool redRound: false
    property int itemSelectIndex: 0
    property alias tabItem1Text: tabItem1.text
    property alias tabItem2Text: tabItem2.text
    property int gapWidth: 2

    signal tabClicked(var index)

    Row {
        id: row
        width: parent.width - 2 * gapWidth
        height: parent.height - 2 * gapWidth
        spacing: 4
        anchors.centerIn: parent
        Item {
            width: (parent.width - row.spacing) / 2
            height: parent.height
            WRectangle {
                id: tabItemBg1
                enableMouse: true
                radius: root.radius
                anchors.fill: parent
                enabled: itemSelectIndex !== 0
                groupName: "tab_button_item_bg"
                onClicked: tabClicked(0)
            }
            WTextView {
                id: tabItem1
                state: tabItemBg1.state
                groupName: "tab_button_text"
                anchors.centerIn: parent
                enabled: itemSelectIndex !== 0
            }
        }
        Item {
            x: parent.width / 2 + row.spacing
            width: (parent.width - row.spacing) / 2
            height: parent.height
            WRectangle {
                id: tabItemBg2
                enableMouse: true
                radius: root.radius
                anchors.fill: parent
                enabled: itemSelectIndex !== 1
                groupName: "tab_button_item_bg"
                onClicked: tabClicked(1)
            }
            WTextView {
                id: tabItem2
                state: tabItemBg2.state
                groupName: "tab_button_text"
                anchors.centerIn: parent
                enabled: itemSelectIndex !== 1
            }
            WRectangle {
                id: redRect
                width: 6; height: 6
                anchors {
                    top: tabItem2.top; topMargin: 1
                    left: tabItem2.right; leftMargin: 2
                }
                groupName: "tab_button_red_round"
                visible: redRound
            }
            SequentialAnimation {
                loops: Animation.Infinite
                running: true
                PropertyAnimation {
                    properties: "scale"
                    from: 0.5; to: 1.2
                    duration: 500
                    easing.type: Easing.Linear
                    target: redRect
                }
                PropertyAnimation {
                    properties: "scale"
                    from: 1.2; to: 0.5
                    duration: 500
                    easing.type: Easing.Linear
                    target: redRect
                }
            }
        }
    }



}
