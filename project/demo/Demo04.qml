import QtQuick.Window 2.12
import QtQuick 2.14
import QtQuick.Controls 2.14
import "./fun.js" as Fun
Item {
    id:tItem
    property var text: 'demo4'
    Item{
        id: mainItem
        anchors.fill: parent
        // 颜色随机生成器
        property var colorBuilder: Fun.getColorBuilder(Qt.rgba)

        ListView{
            id: listM
            anchors.fill: parent

            // 数据模型
            model: ListModel {
            ListElement {
                name: "Bill Smith"
                number: "555 3264"
                group: "group-1"
            }
            ListElement {
                name: "Sgfsh"
                number: "6543231"
                group: "group-1"
            }
            ListElement {
                name: "John Brown"
                number: "555 8426"
                group: "group-2"
            }
            ListElement {
                name: "Sam Wise"
                number: "555 0473"
                group: "group-1"
            }
            ListElement {
                name: "akjfh"
                number: "5342"
                group: "group-2"
            }
            ListElement {
                name: "alkjal"
                number: "6543"
                group: "group-2"
            }
        }

        // 代理
        delegate: Rectangle{
        width: listM.width
        height: listM.height*0.1
        color: (!ListView.isCurrentItem)?mainItem.colorBuilder(): "gray"
        Text {
            anchors.fill: parent
            text:'传递的text：',tItem.text, '—— name: '+name+' == age: '+number+'=='+ (parent.isCurrent()?'✅': '❌')
            font.pointSize: parent.ListView.isCurrentItem?16: 10
            font.italic: parent.ListView.isCurrentItem
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                console.log('index: ', index)
                listM.currentIndex=index
            }
        }

        function isCurrent()
        {
            return index===listM.currentIndex
        }
    }

    // 分组 —— 要排好顺序 —— 【 model 必须是listModel 】
    section.property: "group"
    section.delegate: Rectangle{
    width: listM.width
    height: listM.height*0.15
    Text {
        anchors.centerIn: parent
        text: section
        font.bold: true
        font.pointSize: 25
    }
}

Component.onCompleted: {
    console.log('ListM.isCurrentItem', ListView.isCurrentItem)
    listM.model.append({name: "添加的", number: '13245678908765432456'})
}
}
}
}
