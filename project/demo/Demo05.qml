import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQml 2.14
import "./fun.js" as Fun
Item {
    id:mainItem
    property var text: 'demo5'
    Item{
        id:tItem
        anchors.fill: parent
        property var colorBuilder: Fun.getColorBuilder(Qt.rgba)

        // 组件
        Component{
            id:timeComponent
            Label{
                text: mainItem.text+'label'
                font.pointSize: 18
                font.italic:true
                font.bold:true
                color: tItem.colorBuilder()

                Timer{
                    interval: 1000
                    repeat: true
                    running: true
                    triggeredOnStart: false
                    onTriggered: {
//                        parent.text=Qt.formatDateTime(new Date(),'yyyy-MM-dd hh:mm:ss')
                        parent.setDateStr(Qt.formatDateTime(new Date(),'yyyy-MM-dd hh:mm:ss'))

                    }
                }

                function setDateStr(str){
                    text=str
                }
            }

        }


        // 使用组件
        Column{
            Component.onCompleted: {
                repeatComponent(10)
            }

            function repeatComponent(num){
                for(let i=0;i<num;i++)
                    timeComponent.createObject(this,{text:"triggeredOnStart不是true的时候不会立刻触发,延迟1s"})
            }
        }

    }
}
