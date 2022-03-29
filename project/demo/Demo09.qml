//import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.4
import QtQuick 2.14
import QtQml 2.14
import QtQuick.Layouts 1.14
import QtLocation 5.14
import './fun.js' as Fun

Item {
    id: mainItem
    property var text: 'demo9'

    Item{
        id:tItem
        anchors.fill: parent
        property var colorBuilder:Fun.getColorBuilder(Qt.rgba)

        Row{
            id:header
            // 1、简单
//            Button{
//                text: "page1"
//                onClicked: layout.currentIndex=0
//            }
//            Button{
//                text: "page2"
//                onClicked: layout.currentIndex=1
//            }

            // 2、封装
            Component {
                id:headerBtn
                Button{
//                    required property type name: value
//                    required
                    property string menuText
//                    required
                    property var stackLayout
//                    required
                    property int layoutIndex

                    text: menuText
                    onClicked: stackLayout.currentIndex=layoutIndex
                }
            }
            Component.onCompleted: {
                let menus=['mainItem.text','page11','page22']
                menus.forEach(function(item,index){
                              headerBtn.createObject(header,{menuText:item,stackLayout:layout,layoutIndex:index})
                              })
            }

        }

        StackLayout {
              id: layout
              anchors.top: header.bottom
              anchors.bottom: parent.bottom
              anchors.left: parent.left
              anchors.right:parent.right

              currentIndex: 1 // Rectangle页面的索引

              Rectangle {
                  color: 'red'
                  implicitWidth: 200
                  implicitHeight: 200
              }
              Rectangle {
                  color: 'green'
                  implicitWidth: 300
                  implicitHeight: 200
              }
          }

    }
}
