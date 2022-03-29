//import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.14
import QtQuick 2.14
import './fun.js' as Fun

Item {
    id: mainItem
    //    anchors.fill: parent
    // 颜色随机生成器
    property var colorBuilder: Fun.getColorBuilder(Qt.rgba)

    property var text: "按钮"
    //        实例对象
    Grid{
        spacing: 3
        columns: 3
        Text {
            id: textItem
            text: mainItem.text
            //            text: 'Text'
            color: "red"
            //        font.pointSize: 36
            font{
                pointSize: 36
            }
            //            x: 0;y: 0
            //            width: 100
            //            height: 200
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }

        Button{
            id: btn
            text: mainItem.text
            //            anchors.top: textItem.bottom
            // 槽函数
            onClicked: {
                console.log("btn click")
                text="修改的值"
                let op=new Fun.OperatorNum(100)
                console.log("Fun的add：", op.add(1))
                console.log("Fun的sub：", op.sub(1))
            }
            // 基本上属性都有一个属性变化的值
            //            onTextChanged: consoleLog(add(11, 22))

            //            方法
            function add(n1, n2)
            {
                return n1+n2
            }

            function consoleLog(str)
            {
                console.log(str)
            }
        }

        Label{
            id: labelItem
            text: btn.text+"_label"
            color: 'red'
        }

        Slider {
            id: sliderItem
            from: 1
            value: 25
            to: 100
        }

        Rectangle {
            width: 100
            height: 100
            color: "red"
            border.color: "black"
            border.width: 5
            radius: 10
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    parent.color = mainItem.colorBuilder()
                }
            }
        }
    }
}
