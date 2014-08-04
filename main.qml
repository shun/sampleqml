import QtQuick 2.2
import QtQuick.Controls 1.1



ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    property int modelid:1
    property int colnum: 3

    Item {
        width: 200; height: 250

        ListModel {
            id: myModel1
            ListElement { type: "Dog"; age: 8 }
            ListElement { type: "Cat"; age: 5 }
        }
        ListModel {
            id: myModel2
            ListElement { type: "Panda"; age: 8 }
            ListElement { type: "Lion"; age: 5 }
            ListElement { type: "Yagi"; age: 5 }
            ListElement { type: "Buta"; age: 5 }
            ListElement { type: "Inoshishi"; age: 5 }
            ListElement { type: "Hose"; age: 5 }
        }
        ListModel {
            id: myModel3
            ListElement { type: "Cheetah"; age: 8 }
            ListElement { type: "Cow"; age: 5 }
            ListElement { type: "Pigion"; age: 5 }
        }
        Component {
            id: myDelegate
            Text {text: type + ", " + age }
//            Rectangle {color : "red"; border.width:2 }
        }

        ListView {
            anchors.fill: parent
            model: modelid == 1 ? myModel1 : (modelid == 2 ? myModel2 : (modelid == 3 ? myModel3 : mymodel1))
            delegate: myDelegate
        }
    }

    function updateModelId() {
        if (modelid == 3)
            modelid = 1
        else
            modelid += 1
    }
    function updateColNum() {
        if (colnum == 5)
            colnum = 1
        else
            colnum += 1
    }

    function updateText() {
        myrows.children[1].mylabel = "up"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            updateModelId()
            updateColNum()
            updateText()

        }
    }


    Row {
        id:myrows
        x:100
        y:100

        Repeater {
            model: colnum
            Rectangle {
                property string mylabel: "defo"
                width: 100; height: 40
                border.width: 1
                color: "yellow"
                Text {
                    text:mylabel
                }
            }
        }
    }


    Row {
        x:100
        y:200

        Rectangle {
            id: rec1
            width:  100
            height: 100
            color: "salmon"
            border.width: 1
            Text {
                text:"para1"
            }

        }
        Rectangle {
            id: rec2
            width:  100
            height: 100
            color: "salmon"
            border.width: 1

            Text {
                text:"para2"
            }
        }

    }

/*
    Rectangle{
        anchors.fill: parent
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onPositionChanged: {
                console.log("x: " + mouseX + " , y: " + mouseY)
            }
        }

        Column {
            Repeater {
                model: 3
                Rectangle {
                    width: 100; height: 40
                    border.width: 1
                    color: "yellow"
                }
            }
        }
    }
*/
}
