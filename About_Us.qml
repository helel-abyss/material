import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

ApplicationWindow{
       width: 320; height: 240
       title: "About_Us"
       visible: false
       color: "#4c4c4c"
       Rectangle {
           id: rectangle
           anchors.fill: parent
           color: "#ffffff"

           Text {
           text: "$*?"
           font.pixelSize: 20
           anchors.centerIn: parent
           }

       }

}
