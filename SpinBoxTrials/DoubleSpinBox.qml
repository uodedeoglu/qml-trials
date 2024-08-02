import QtQuick
import QtQuick.Controls

FocusScope {
    id: root

    required property real minVal
    required property real maxVal
    required property real stepSize
    required property real value
    required property int digits

    TextInput{
        id: tiValue
        inputMethodHints: Qt.ImhFormattedNumbersOnly
        background: Material.Orange

        text: value.toFixed(digits)
        focus: true

        validator: DoubleValidator{
            bottom: minVal
            top: maxVal
            decimals: digits
        }

        function stepUp(){
            if(value < maxVal){
                value = value + stepSize <= maxVal ? value + stepSize : maxVal;
                value = value.toFixed(digits);
            }
        }

        function stepDown(){
            if(value > minVal){
                value = value - stepSize >= minVal ? value - stepSize : minVal;
                value = value.toFixed(digits);
            }
        }

        function setValue(newValue){
            if(newValue >= maxVal){
                value = maxVal;
            }

            else if(newValue <= minVal){
                value = minVal;
            }

            else{
                value = newValue.toFixed(digits)
            }
        }

        WheelHandler{
            target: tiValue
            onWheel: (wheel) => {
                         if (wheel.angleDelta.y > 0) {
                             tiValue.stepUp()
                         }
                         else if (wheel.angleDelta.y < 0){
                             tiValue.stepDown()
                         }
                     }
        }

        Keys.onUpPressed: () => {
                              stepUp()
                          }

        Keys.onDownPressed: () => {
                                stepDown()
                            }

        Keys.onEnterPressed: () => {
                                 editingFinished();
                             }

        Keys.onReturnPressed: () => {
                                  editingFinished();
                              }

        onEditingFinished: () => {
                               setValue(parseFloat(text).toFixed(digits-1))
                           }

        onFocusChanged: () => {
                            if(!(root.focus)){
                                editingFinished();
                            }
                        }
    }
}
