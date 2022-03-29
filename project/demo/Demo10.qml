//import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick 2.14
import QtQml 2.14
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import './fun.js' as Fun

Item {
    id: mainItem
    property var text: 'demo10'

    Item{
        id:tItem
        anchors.fill: parent
        property var colorBuilder:Fun.getColorBuilder(Qt.rgba)

        Row{
            spacing:10

            objectName: "Row的obj名字"
            // 中继器
            Repeater{
//                model: 3
                model:['one','two']

                Button{
//                    text:index+" btn"
                    text:mainItem.text+' —— '+index+'=='+modelData

                    onClicked:console.log(parent.objectName,'---',parent) // 父类是 Row ，跳过中继器  【Row的obj名字 --- QQuickRow(0x6000006995f0, "Row的obj名字")】

                    style: ButtonStyle {
                              background: Rectangle {
                                  implicitWidth: 200
                                  implicitHeight: 100
                                  border.width: control.activeFocus ? 2 : 1
                                  border.color: "blue"
                                  radius: 4
                                  gradient: Gradient {
//                                      control.pressed 按压
                                      GradientStop { position: 0 ; color: control.pressed ? "red" : "yellow" }
                                      GradientStop { position: 1 ; color: control.pressed ? "orange" : "green" }
                                  }
                              }
                          }
                }
            }
        }



    }
}
