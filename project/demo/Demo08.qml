//import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick 2.14
import QtQml 2.14
import "./fun.js" as Fun

Item {
    id: mainItem
    property var text: 'demo8'

    Item{
        id:tItem
        anchors.fill: parent
        property var colorBuilder:Fun.getColorBuilder(Qt.rgba)

        Component{
            id:rectPage
            Rectangle{
                MouseArea{
                    anchors.fill: parent
                    onClicked: stack.pop()
                }
            }
        }
        Component{
            id:testCom
            TestComponent {
                text:mainItem.text+'stack直接调用组件'
                color:tItem.colorBuilder()
            }
        }

        StackView{
            id:stack
            anchors.fill:parent

            initialItem: Component{
                Rectangle{
                    color: tItem.colorBuilder()
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
//                            stack.push(rectPage,{color:tItem.colorBuilder()})
                            stack.push(testCom)
//                            stack.push('./TestComponent.qml',{text:"stack用url创建调用的组件",color:tItem.colorBuilder()})

                        }
                    }
                }
            }
        }

    }
}
