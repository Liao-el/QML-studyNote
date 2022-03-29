//import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick 2.14
import QtQuick.Controls 2.14
import "./fun.js" as Fun

Item {
    id: mainItem
    // 颜色随机生成器
    property var colorBuilder: Fun.getColorBuilder(Qt.rgba)
    property var text: 'demo3'

    ListView {
        id: list
        anchors.fill: parent
        model: [{id: 1, name: "afadf"}, {id: 2, name: "fajfkd"}]
        //            model: 20

        // 代理
        delegate: ItemDelegate{
        width: parent.width
        text: index +' === '+ modelData.id + '===' + modelData.name + ' —— ' + (list.currentIndex == index?"✅": "❌")
        background: Rectangle{
        color: getColor()
    }

    highlighted: List.isCurrentItem

    onClicked: {
        list.currentIndex = index
        console.log('index: ', index, ' data: ', JSON.stringify(modelData))
    }

    function getColor()
    {
        let obj=Fun.getColorRandom()
        console.log('颜色：', obj.red, obj.green, obj.blue)
        return Qt.rgba(obj.red, obj.green, obj.blue)
    }
}

Component.onCompleted: {
    let arr=list.model
    arr.push({id: 3, name: "demo3"})
    list.model =arr
}
}

}

