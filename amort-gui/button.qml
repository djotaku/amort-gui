// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle{

  id: button
  width: 50; height: 43

  Text{
    id: buttonLabel
    anchors.centerIn: parent
    text: bLabel
  }

  property color buttonColor: "lightblue"
  property color onHoverColor: "gold"
  property color borderColor: "white"
  property string bLabel: "button label"

  signal buttonClick()
  onButtonClick:{
    console.log(buttonLabel.text + " clicked")
  }

  MouseArea{
    id: buttonMouseArea
    anchors.fill: parent
    onClicked: buttonClick()
    hoverEnabled: true
    onEntered: parent.border.color = onHoverColor
    onExited: parent.border.color = borderColor
  }

  //detmermines color of button by using the conditional operator
  color: buttonMouseArea.pressed ? Qt.darker(buttonColor, 1.5) : buttonColor
