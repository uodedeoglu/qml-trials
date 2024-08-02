import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    GridLayout{
        anchors.fill: parent
        columns: 2

        DoubleSpinBox{
            id: dsbStartingMHz
            minVal: 400.0
            maxVal: 700.0
            value: 500
            stepSize: 0.1
            digits: 2
        }

        DoubleSpinBox{
            id: dsbStoppingMHz
            minVal: 400.0
            maxVal: 700.0
            value: 500
            stepSize: 0.1
            digits: 2
        }

        Keys.onTabPressed: ()=>{
                               if(dsbStartingMHz.focus){
                                   dsbStoppingMHz.focus = true;
                               }
                               else if(dsbStoppingMHz.focus){
                                   sendButton.focus = true;
                               }
                               else if(sendButton.focus){
                                   dsbStartingMHz.focus = true;
                               }
                           }

        Button{
            id: sendButton
            text: "Send it"
            width: 100
            height: 20
            Layout.columnSpan: 2
        }

    }
}
