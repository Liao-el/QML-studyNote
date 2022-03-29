//import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick 2.14
import QtQml 2.14
import './fun.js' as Fun

Item {
    id: mainItem
    property var text: 'demo7'

    Item{
        id:tItem
        anchors.fill: parent
        property var colorBuilder:Fun.getColorBuilder(Qt.rgba)

        Rectangle{
            width:100
            height: 100
            color: tItem.colorBuilder()

//            anchors.left:parent.left

            MouseArea{
                anchors.fill:parent
                // 拖拽
                drag.target: parent

                onClicked: {
                    console.log('x=',mouse.x,' y=',mouse.y,'—— mouseX=',mouseX,' mouseY=',mouseY,'—— mapToGlobal()=',mapToGlobal(mouseX,mouseY))
                }
            }

            Text {
                anchors.centerIn: parent
                text: mainItem.text
                color: tItem.colorBuilder()
                MouseArea{
                    anchors.fill:parent
                    propagateComposedEvents: true // 事件穿透
                    onClicked: {
                        mouse.accepted=false
                        console.log("text —— 鼠标点击")
                    }
                }
            }
        }

    }
}
