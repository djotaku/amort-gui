// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
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
        onClicked: {
            Qt.quit();
        }

        TextInput {
            id: principle_input
            x: 93
            y: 47
            width: 80
            height: 20
            text: qsTr("Principle")
            font.pixelSize: 12
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

        TextInput {
            id: interest_input1
            x: 93
            y: 71
            width: 80
            height: 20
            text: qsTr("interest")
            font.pixelSize: 12
        }

        Text {
            id: text3
            x: 27
            y: 98
            text: qsTr("Payments")
            font.pixelSize: 12
        }

        TextInput {
            id: paymets_input1
            x: 93
            y: 95
            width: 80
            height: 20
            text: qsTr("Payments")
            font.pixelSize: 12
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
    }

    Row {
        id: row1
        x: 0
        y: 182
        width: 360
        height: 178
    }
}
