import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQml 2.14
import './fun.js' as Fun

Item {
    id: mainItem
    property var text: 'demo6'

    Item{
        id:tItem
        anchors.fill: parent
        property var colorBuilder:Fun.getColorBuilder(Qt.rgba)
        Text{
            anchors.top:loader.bottom
            text:mainItem.text+'3种调用封装组件的方法'
        }

        // 1、1、同目录下组件文件直接使用
//        Component{
//            id:testCom
//            TestComponent {
//                text:'封装组件label.text'
//                color:tItem.colorBuilder()
//            }
//        }
//        Column{
            // 1、普通使用方法
//                Component.onCompleted: {
//                    for(let i=0;i<10;i++)
//                        testCom.createObject(this)

//                }

//            2、js创建调用的组件
//            Component.onCompleted: {
                // 2.1、createComponent(url, mode, parent)
//                let cmp=Qt.createComponent('./TestComponent.qml',Component.PreferSynchronous,tItem) // 同步=PreferSynchronous 异步=Asynchronous
//                if(cmp&&cmp.status === Component.Ready){
//                    // 2.2、object createObject(parent, object properties)
//                    cmp.createObject(this,{text:"js创建调用的组件",color:tItem.colorBuilder(),triggeredOnStart: true})
//                }

//                creatTimerCmp(10,cmp,{text:"js创建调用的组件",color:tItem.colorBuilder()})
//            }

//            function creatTimerCmp(num,cmp,data={}){
//                if(cmp&&cmp.status === Component.Ready){
//                    for(let i=0;i<num;i++)
//                        cmp.createObject(this,data) // 【this指向Colum】
//                }
//            }

    //    }


            // 3、Loader创建组件
            Loader{id:loader}
            Component.onCompleted: {
                loader.setSource('./TestComponent.qml',{text:"Loader创建调用的组件",color:tItem.colorBuilder()})
            }

    }
}
