import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3

Window {
    id: window
    visible: true
    width: 800
    height: 600
    title: qsTr("Dark Switch")
    color: "#2c2b30"

    DarkSwitch{
        id: darkSwitch
        anchors.centerIn: parent
    }
    Text{
        id: switchText1
        text: "Switch Left"
        color: darkSwitch.checked? "#969697" : "#3ea1fd"
        anchors{verticalCenter: darkSwitch.verticalCenter; right: darkSwitch.left; rightMargin: 50}
        font{family: "Arial"; pointSize: 18}
    }
    Text{
        id: switchText2
        text: "Switch Right"
        color: darkSwitch.checked? "#3ea1fd" : "#969697"
        anchors{verticalCenter: darkSwitch.verticalCenter; left: darkSwitch.right; leftMargin: 50}
        font{family: "Arial"; pointSize: 18}
    }
}
