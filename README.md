# QML-studyNote
# QML学习笔记资料 —— 学习过程中遇到的问题
[安装地址：https://download.qt.io/official_releases/online_installers/](https://download.qt.io/official_releases/online_installers/)

---

## 1、创建项目空文件

> windows 系统 —— 选择 **_MSVC_**
> 
> linux 系统 —— 选择 **_MinGW_**

## 2、QT 助手

> Windows 下： C:\Qt\Qt[版本号]\[版本号]\mingw49_32\bin\assistant.exe
> 
> Mac 下： /Users/apple/Qt[版本号]/[版本号]/clang_64/bin/Assistant.app

### 2.1、基本模块介绍

| 模块                              | 介绍                                                                                                                  |
| --------------------------------- | --------------------------------------------------------------------------------------------------------------------- |
| QMake Manual                      | 核心工具 qmake 帮助手册，含有其使用方式及 pro 文件格式等。                                                            |
| Qt Assistant Manual               | Qt 助手帮助手册。                                                                                                     |
| Qt Designer Manual                | Qt 设计师帮助手册。                                                                                                   |
| Qt Linguist Manual                | Qt 语言家帮助手册，程序的多国语言支持可以查阅这个手册。                                                               |
| Qt Creator Manual                 | 集成开发环境 QtCreator 的帮助手册。                                                                                   |
| Qt 5.14.2 Reference Documentation | Qt 开发文档总纲，含有 Qt 模块列表、类列表、函数列表、类型列表、名字空间列表等，还有非常多的编译生成、调试等各类文档。 |
| Qt Core                           | 核心模块文档，元对象系统、属性系统、对象模型、对象树、信号和槽、资源系统、多线程、文件处理、XML 读写等方面文档。      |
| Qt GUI                            | 底层绘图模块，图形用户界面组件的基础类，包括 OpenGL。                                                                 |
| Qt Widgets                        | 大量的窗口类、控件类，用于构建常规的窗体程序。                                                                        |
| Qt Multimedia                     | 音频处理、视频处理、收音机、摄像头等功能。                                                                            |
| Qt Multimedia Widgets             | 用于 Qt Multimedia 模块功能显示的窗体和控件。                                                                         |
| Qt Network                        | 网络编程模块，如 TCP、UDP、组播等。                                                                                   |
| Qt SQL                            | 数据库编程模块，可以连接 SQLite、MySQL、PostgreSQL 等数据库。                                                         |
| Qt Test                           | 单元测试模块，用于测试开发好的 Qt 程序或库的运行效率。                                                                |
| Qt WebKit                         | 新实现的基于 WebKit2 的类，并带有 QML API。                                                                           |
| Qt WebKit Widgets                 | WebKit1 和 从 Qt4 传承而来的基于 QWidget 的 WebKit 窗体。                                                             |
| Qt QML                            | 支持 QML 和 JavaScript 的基本类。                                                                                     |
| Qt Quick                          | 新的基于 QML 语言的编程框架，一般用于手机等移动设备系统的用户界面开发。                                               |
| Qt Quick Controls                 | Qt Quick 基本控件模块。                                                                                               |
| Qt Quick Dialogs                  | Qt Quick 对话框模块。                                                                                                 |
| Qt Quick Layouts                  | Qt Quick 界面布局模块。                                                                                               |

## 3、文件简介

### 3.1、projectName.pro 文件

> CONFIG += c++11 _# —— c++11 标准支持（现在可以到 17）_

### 3.2、main.cpp 文件

QGuiApplication app(argc,argv) _报错的时候用_

```
#include <QCoreApplication>

QApplication app(argc,argv)
```

### 3.3、引入 js 文件

```
// as 后面的名称必须大写，不然会报 Invalid import qualifier ID 的错误
import './func.js' as Func
```

## 4、常用属性和类型

### 4.1、附加属性 Component —— 可附加到任何属性上去 （attached）

> 附加信号：
> completed() —— 组件完成时 —— Component.onCompleted: { // 组件完成时的操作 }
> destruction() —— 组件销毁时 —— Component.onDestruction: { // 组件销毁时的操作 }

### 4.2、修改 listView 的 model 数据

```
Item {
        anchors.fill: parent

        ListView {
            id: list
            anchors.fill: parent
            model: [{id: 1, name: "111"}, {id: 2, name: "222"}]
            delegate: Text{
                text: index +' === '+ modelData.id + '===' + modelData.name
            }

        // 【 修改 model 数据要这样才能生效 】
        Component.onCompleted: {
            let arr=list.model
            arr.push({ id: 3, name: "333" })
            list.model =arr
        }
    }
```
