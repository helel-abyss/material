import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import Qt.labs.folderlistmodel 2.1
import QtCanvas3D 1.1
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
                    onTriggered: Qt.quit();
                }
                 MenuItem {
                    text: qsTr("S&ave")
                    onTriggered: Qt.quit();
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
                text: qsTr("Copy")
                onClicked: copyAction
                x: option_toolbar_button.x + 400
            }
            ToolButton {
                id: cut_toolbar_button
                text: qsTr("Cut")
                onClicked: cutAction
                x: copy_toolbar_button.x + 40
            }
            ToolButton {
                id: paste_toolbar_button
                text: qsTr("Paste")
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
//defind Item to show 3dmodel
    Item{
        visible: ture
        anchors.top: toolBar.bottom
        anchors.right: parent.right
        height: parent.height * 0.7
        width: parent.width * 0.8
        Canvas3D {

             id: canvas;
             anchors.fill: parent;

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
         }

}

}
