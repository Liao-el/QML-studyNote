import QtQuick 2.0
import QtQuick.Controls 1.4
//import QtQml 2.14


    Label{
        text: 'label'
        font.pointSize: 18
        font.italic:true
        font.bold:true

//        required property var colorBuilder // 必填属性
         property var color:'gray'

//        required property var triggeredOnStartVal

        Timer{
            id:timer
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


        MouseArea{
            anchors.fill: parent
            onClicked: stack.pop()
        }
    }

