//import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick 2.14
import QtQml 2.14
import QtQuick.Controls 2.14
import './fun.js' as Fun

Item {
    id: mainItem
    property var text: 'demo11'

    Item{
        id:tItem
        anchors.fill: parent
        property var colorBuilder:Fun.getColorBuilder(Qt.rgba)

        property var pages: [mainItem.text,'111','222','333','444']

        TabBar{
            id:titleBar
            anchors.left: parent.left
            anchors.right: parent.right

            currentIndex: view.currentIndex

            Repeater{
                model:tItem.pages

                TabButton{
                    text: modelData
                    onClicked: view.currentIndex=index
                }
            }
        }

        SwipeView {
            id: view
//            anchors.fill: parent
            anchors.top: titleBar.bottom
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            currentIndex: 1

//            Text {
//                text: "page 111"
//            }
//            Text {
//                text: "page 222"
//            }
//            Text {
//                text: "page 333"
//            }

            // 使用中继器
            Repeater{
                model: tItem.pages.length
                Rectangle{
                    color: tItem.colorBuilder()
                }
            }
        }

        // 底部小圈圈——指示器
        PageIndicator {
            id: indicator

            count: view.count
            currentIndex: view.currentIndex

            anchors.bottom: view.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }



    }
}
