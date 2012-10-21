// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import Qt 4.7
import "/usr/lib64/kde4/imports/org/kde/plasma/core" as PlasmaCore  
//remove the 64 on the above line for it to work with kubuntu - at least on Danielle's computer

Rectangle {
  
    signal calculateit(string principle, string interest, string payments);

  function thetable(table)
  {
    if(table==0)
    {
      rowtext.text="Calculations completed successfully.  Look for an amort.csv file to import into spreadsheet"
    }
  }
  
    width: 360
    height: 360
    Text {
        id: title
        x: 96
        y: 19
        anchors.centerIn: parent
        text: "Amortization Calculator"
        horizontalAlignment: Text.AlignLeft
        anchors.verticalCenterOffset: -153
        anchors.horizontalCenterOffset: -9
    }
    MouseArea {
        anchors.fill: parent
        
	Rectangle{
	  x: 93
          y: 47
          width: 80
          height: 20
          border.width: 3
          border.color: "black"
	  color: "lightsteelblue"
        TextInput {
            id: principle_input  
            width: 80
            height: 20
            x: 5
            y: 2
            text: qsTr("270000")
            font.pixelSize: 12	
	    selectionColor: "blue"
        }
	}

        Text {
            id: text1
            x: 27
            y: 53
            height: 14
            text: qsTr("Principle")
            font.pixelSize: 12
        }

        Text {
            id: text2
            x: 27
            y: 77
            width: 51
            height: 14
            text: qsTr("Interest")
            font.pixelSize: 12
        }
	Rectangle{
	  x: 93
          y: 71
          width: 80
          height: 20
          border.width: 3
          border.color: "black"
	  color: "lightsteelblue"
        TextInput {
            id: interest_input1
            x: 5
            y: 2
            width: 80
            height: 20
            text: qsTr(".04")
            font.pixelSize: 12
        }
	}

        Text {
            id: text3
            x: 27
            y: 98
            text: qsTr("Payments")
            font.pixelSize: 12
        }
	Rectangle{
	  x: 93
          y: 95
          width: 80
          height: 20
          border.width: 3
          border.color: "black"
	  color: "lightsteelblue"
        TextInput {
            id: paymets_input1
            x: 5
            y: 2
            width: 80
            height: 20
            text: qsTr("360")
            font.pixelSize: 12
        }
	}
        Text {
            id: text4
            x: 178
            y: 77
            text: qsTr("As a decimal (eg 4% = .04)")
            font.pixelSize: 12
        }

        Text {
            id: text5
            x: 178
            y: 101
            width: 116
            height: 24
            text: qsTr("Number of months (360, 180)")
            wrapMode: Text.WordWrap
            font.pixelSize: 12
        }

        Button{
            id: calculate
            x: 80
            y: 135
            width: 200
            bLabel: "Calculate"
            onButtonClick: calculateit(principle_input.text,interest_input1.text,paymets_input1.text)
        }
    }

    Row {
        id: row1
        x: 0
        y: 182
        width: 360
        height: 178
        Text{
	  id: "rowtext"
	  text: "Hello! Enter or modify the input data to calculate the amortization table!"
	}
    }
}
