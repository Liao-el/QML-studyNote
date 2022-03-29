//import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick 2.14
import QtQml 2.14
import QtQuick.Controls 2.14
import './fun.js' as Fun

Window {
    visible: true
    width: 1200
    height: 800
    title: qsTr("Hello World")

    Item{
        id: tItem
        anchors.fill: parent
        property var colorBuilder: Fun.getColorBuilder(Qt.rgba)

        property var pages1: [{name: '1、引用js', cmp: Demo01}, {name: '2、引用component', cmp: TestComponent}, {name: '3、ListView+onCompleteed', cmp: Demo03}
        , {name: '4、ListView+数据模型model', cmp: Demo04}, {name: '5、组件', cmp: Demo05}, {name: '6、3种调用封装组件的方法', cmp: Demo06}]
        property var pages2: [{name: '7、MouseArea', cmp: Demo07}, {name: '8、StackView', cmp: Demo08}, {name: '9、StackLayout', cmp: Demo09}
        , {name: '10、中继器 Repeater+ButtonStyle', cmp: Demo04}, {name: '11、SwipeView', cmp: Demo11}, {name: '12、总结'}]

        TabBar{
            id: titleBar1
            anchors.left: parent.left
            anchors.right: parent.right

            currentIndex: view.currentIndex

            Repeater{
                model: tItem.pages1

                TabButton{
                    text: modelData.name
                    onClicked: view.currentIndex=index
                }
            }
        }
        TabBar{
            id: titleBar2
            anchors.top: titleBar1.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            currentIndex: view.currentIndex-6

            Repeater{
                model: tItem.pages2

                TabButton{
                    text: modelData.name
                    onClicked: view.currentIndex=index+6
                }
            }
        }

        SwipeView {
            id: view
            anchors.top: titleBar2.bottom
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right

            currentIndex: 9

            Demo01{
                text: '1、引用js'
            }
            TestComponent{
                color: tItem.colorBuilder()
            }
            Demo03{
                text: '3、ListView+onCompleteed'
            }
            Demo04{
                text: '4、ListView+数据模型model'
            }
            Demo05{
                text: '5、组件'
            }
            Demo06{
                text: '6、3种调用封装组件的方法'
            }
            Demo07{
                text: '7、MouseArea'
            }
            Demo08{
                text: '8、StackView'
            }
            Demo09{
                text: '9、StackLayout'
            }
            Demo10{
                text: '10、中继器 Repeater + ButtonStyle'
            }
            Demo11{
                text: '11、SwipeView'
            }
            Text {
                text: '看Qt文档'
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
