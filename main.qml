import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import Qt.labs.folderlistmodel 2.1
import QtCanvas3D 1.1
import QtQuick.Controls.Material 2.1

import "qrc:/Renderand_display_3d_objects.js" as Render
ApplicationWindow{
    id: mainwindow
    visible: true
    height: 1080
    width: 1920
    title: qsTr("彩虹快乐风男")
    color: "#353535"

    About_Us{
        id: about_us
    }

    menuBar: MenuBar {

            Menu {
                title: qsTr("&File")

                MenuItem {
                    text: qsTr("N&ew")
                    onTriggered: Qt.quit();
                }
                 MenuItem {
                    text: qsTr("O&pen")
                    onTriggered: Qt.quit()
                }
                 MenuItem {
                    text: qsTr("S&ave")
                    onTriggered: Qt.quit()
                }
                 MenuSeparator{}
                 MenuItem {
                    text: qsTr("E&xit")
                    onTriggered: Qt.quit();

                }


            }
            Menu {
                title: qsTr("&Edit")
                MenuItem {
                  action: cutAction
                }
                MenuSeparator{}
                MenuItem {
                  action: copyAction
                }
                MenuItem {
                  action: pasteAction
                }
            }

            Menu {
                title: qsTr("&Help")
                MenuItem {
                    text: qsTr("About...")
                    onTriggered: about_us.show()
                }
            }


        }

    toolBar: ToolBar {
         height: 30
         width: 1920
         anchors.top: MenuBar.bottom
         style: ToolBarStyle {
                  padding {
                      left: 8
                      right: 8
                      top: 3
                      bottom: 3
                  }
                  background: Rectangle {
                      border.color: "#36648B"
                      color: "#607B8B"
                      }

              }

             ToolButton {
                id: new_toolbar_button
                text: qsTr("New")
                scale: 0.1
                iconSource: "/new/prefix1/F:/无定义/icon/Icons8-Ios7-Ecommerce-Empty-Box.ico"
                x: -100
                y: -115
            }
             ToolButton {
                id: edit_toolbar_button
                text: qsTr("Edit")
                scale: 0.1
                iconSource: "/new/prefix1/F:/无定义/icon/Iconsmind-Outline-File.ico"
                anchors.top: new_toolbar_button.top
                x: new_toolbar_button.x + 40
            }
             ToolButton {
                id: option_toolbar_button
                text: qsTr("Option")
                scale: 0.1
                iconSource: "/new/prefix1/F:/无定义/icon/Designbolts-Seo-Website-Optimization.ico"
                anchors.top: new_toolbar_button.top
                x: edit_toolbar_button.x + 40
            }

            ToolButton {
                id: copy_toolbar_button
                Text {
                    text: qsTr("Copy")
                    font.family :"Microsoft Sans Serif"
                    font.bold: ture
                    font.pixelSize: 14
                    anchors.centerIn: parent
                }
                onClicked: copyAction
                x: option_toolbar_button.x + 400
            }
            ToolButton {
                id: cut_toolbar_button
                Text {
                    text: qsTr("Cut")
                    font.family :"Microsoft Sans Serif"
                    font.bold: ture
                    font.pixelSize: 14
                    anchors.centerIn: parent
                }
                onClicked: cutAction
                x: copy_toolbar_button.x + 40
            }
            ToolButton {
                id: paste_toolbar_button
                Text {
                    text: qsTr("Paste")
                    font.family :"Microsoft Sans Serif"
                    font.bold: ture
                    font.pixelSize: 14
                    anchors.centerIn: parent
                }
                onClicked: pasteAction
                x: cut_toolbar_button.x + 40
            }


     }


        Action {
            id: copyAction
            text: qsTr("&Copy")
            shortcut: StandardKey.Copy
            iconName: "edit-copy"
            enabled: (!!activeFocusItem && !!activeFocusItem["copy"])
            onTriggered: activeFocusItem.copy()
        }

        Action {
            id: cutAction
            text: qsTr("Cu&t")
            shortcut: StandardKey.Cut
            iconName: "edit-cut"
            enabled: (!!activeFocusItem && !!activeFocusItem["cut"])
            onTriggered: activeFocusItem.cut()
        }


        Action {

            id: pasteAction
            text: qsTr("&Paste")
            shortcut: StandardKey.Paste
            iconName: "edit-paste"
            enabled: (!!activeFocusItem && !!activeFocusItem["paste"])
            onTriggered: activeFocusItem.paste()
        }




//defind Item to show 3dmodel
    Item{
        id: canvas_item
        visible: ture

        anchors.top: toolBar.bottom
        anchors.right: parent.right
        height: parent.height * 0.7
        width: parent.width * 0.8
        Canvas3D {

             id: canvas;
             anchors.fill: parent;
             property double xRot: 0.0
             property double yRot: 45.0
             property double distance: 2.0

             onInitializeGL:
             {
                 Render.initializeGL(canvas);
             }

             onPaintGL:
             {
                 Render.paintGL(canvas);
             }

             onResizeGL:
             {
                 Render.resizeGL(canvas);
             }
             MouseArea {
                 anchors.fill: parent
                 onMouseXChanged: {
                     Render.rotate(0.1,0,0)
                 }
                 onMouseYChanged: {
                     Render.rotate(0,0.1,0)
                 }

                 onWheel: {
                     var datl = wheel.angleDelta.y/120

                     if (datl >= 1){
                         Render.makeitbig()
                         datl = 0;
                     }
                     else{
                         Render.makeitsmall()}
                 }
                 onReleased: {
                     // Reset previous mouse positions to avoid rotation jumping
                     previousX = 0
                     previousY = 0
                 }
             }

         }

}
                Item{
                    visible: ture
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    anchors.topMargin: 6
                    height: parent.height
                    width: parent.width - canvas_item.width

                Rectangle{
                    anchors.fill:parent
                    color: "#363636"
                    Rectangle{
                        id: dir_2
                        anchors.fill: parent
                        anchors.margins: 6
                        radius: 10
                        color: "#528B8B"
                    }
                    Rectangle{
                        id: dir_title
                        anchors.top: dir_2.top
                        radius: 6
                        height: 14
                        width: 60
                        color: "#00CED1"
                        Text {
                            id: dir_title_txt
                            text: qsTr("Project")
                            font.bold: ture
                            font.family: "Microsoft Sans Serif"
                            font.pixelSize: 14
                            anchors.centerIn: parent
                        }
                    }


                }

                }

            Item{
                    visible: ture
                    anchors.right: canvas_item.right
                    anchors.rightMargin: 6
                    anchors.top:  canvas_item.bottom
                    height: parent.height - canvas_item.height
                    width: canvas_item.width
                    MouseArea {
                        anchors.fill: parent
                        acceptedButtons: Qt.LeftButton | Qt.RightButton
                        onClicked: {
                            if (mouse.button === Qt.RightButton)
                                contextMenu.popup()
                        }
                        onPressAndHold: {
                            if (mouse.source === Qt.MouseEventNotSynthesized)
                                contextMenu.popup()

                                        }

                        }

                        Menu {
                            id: contextMenu
                            MenuItem { text: "Cut" }
                            MenuItem { text: "Copy" }
                            MenuItem { text: "Paste" }
                        }
                    Rectangle{
                        id: ter_base
                        anchors.fill: parent
                        color: "#363636"
                        radius: 10
                        Rectangle{
                            id: txt_rec
                            anchors.fill:parent
                            anchors.margins: 10
                            radius: 10
                            color: "#6E7B8B"

                            TextEdit {
                                          id: textEdit
                                          text: ""
                                          font.pointSize: 14
                                          anchors.fill: parent
                                          anchors.margins: 4
                                          font.family: "Microsoft Sans Serif"
                                          height: contentHeight
                                          width: frame.width - vbar.width
                                          y: -vbar.position * textEdit.height
                                          wrapMode: TextEdit.Wrap
                                          selectByKeyboard: true
                                          selectByMouse: true
                                          font.underline: ture

                                          MouseArea{
                                              anchors.fill: parent
                                              onWheel: {
                                                  if (wheel.angleDelta.y > 0) {
                                                      vbar.decrease();
                                                  }
                                                  else {
                                                      vbar.increase();
                                                  }
                                              }
                                              onClicked: {
                                                  textEdit.forceActiveFocus();
                                              }
                                          }

                            }
                        }
                        Rectangle{
                            anchors.bottom: txt_rec.top
                            anchors.left: txt_rec.left
                            width: 70
                            height: 12
                            radius: 10
                            color: "#E0EEEE"
                            Text {
                                id: terminal_title
                                anchors.centerIn: parent
                                text: qsTr("Terminal")
                                color: "black"
                                font.bold : ture
                                font.pixelSize: 14
                                font.family :"Microsoft Sans Serif"
                            }

                        }
                    }

                }
}
