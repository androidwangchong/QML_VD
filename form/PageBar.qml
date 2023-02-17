import QtQuick 2.4
import "../widget"

PageBarForm {
    property int listviewItemHeight: 56
    property int listviewHoverIndex: -1
    property int listviewPressIndex: -1
    Component.onCompleted: {
        listview.delegate = delegate
        listview.model = listmodel
    }

    ListModel {
        id: listmodel
        ListElement{ icon:"mainBgImage"; name:qsTr("Quick Search") }
        ListElement{ icon:"mainBgImage"; name:qsTr("Downloader") }
        ListElement{ icon:"mainBgImage"; name:qsTr("Video to MP3") }
    }
    Component {
        id: delegate
        Item {
            width: 192
            height: listviewItemHeight
            Item {
                width: parent.width
                height: parent.height - 2 * 2
                anchors.centerIn: parent
                WRectangle {
                    id: itemHover
                    anchors.fill: parent
                    visible: (listviewHoverIndex === index)
                    groupName: "pagebar_listview_item_hover"
                }
                WImage {
                    id: icon
                    width: 20; height: 20
                    anchors {
                        left: parent.left; leftMargin: 16
                        verticalCenter: parent.verticalCenter
                    }
                    state: {
                        if (index === listview.currentIndex || index === listviewPressIndex) {
                            return "press"
                        } else if (index === listviewHoverIndex) {
                            return "hover"
                        } else {
                            return "normal"
                        }
                    }
                    groupName: model.icon
                }
                WTextView {
                    id: itemName
                    font {
                        bold: true
                    }
                    anchors {
                        left: icon.right; leftMargin: 8
                        verticalCenter: icon.verticalCenter
                    }
                    state: {
                        if (index === listview.currentIndex || index === listviewPressIndex) {
                            return "press"
                        } else if (index === listviewHoverIndex) {
                            return "hover"
                        } else {
                            return "normal"
                        }
                    }
                    groupName: "pagebar_item_text"
                    text: model.name
                }
            }
            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                onEntered: listviewHoverIndex = index
                onPressed: listviewPressIndex = index
                onExited: {
                    listviewHoverIndex = -1
                    listviewPressIndex = -1
                }
                onClicked: {
                    listview.currentIndex = index

                }
            }
        }
    }



}
