import QtQuick 2.7
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3

Switch {
    id: control
    indicator: Item{
        id: indicatorItem
        implicitWidth: 135
        implicitHeight: 58
        x: control.leftPadding
        y: parent.height / 2 - height / 2
        RectangularGlow {
            id: effect
            anchors.fill: boundaryRect
            glowRadius: 3
            spread: 0.2
            color: "black"
            cornerRadius: boundaryRect.radius + glowRadius
        }
        Item {
            id: src
            anchors.fill: boundaryRect

            Rectangle {
                anchors.centerIn: parent
                width: src.width - 2
                height: src.height - 2
                color: "#262626"
                radius: boundaryRect.radius
            }
        }

        InnerShadow {
            anchors.fill: src
            cached: true
            horizontalOffset: 0
            verticalOffset: 0
            radius: 16
            samples: 32
            color: "#000000"
            smooth: true
            source: src
        }
        Rectangle{
            id: boundaryRect
            anchors.fill: parent
            anchors.margins: 3
            border{color: "#515151"; width: 2}
            radius: 12
            color: "transparent"
        }

        Item{
            id: handle
            x: control.checked ? boundaryRect.x + boundaryRect.width - width + 2 : boundaryRect.x - 2
            y: parent.height / 2 - height / 2
            width: 70
            height: boundaryRect.height
            Behavior on x{
                NumberAnimation{duration: 100}
            }

            RectangularGlow {
                id: handleEffect
                anchors.fill: handleRect
                glowRadius: 15
                spread: 0.2
                color: "#2e91ed"
                cornerRadius: handleRect.radius + glowRadius
            }
            Rectangle {
                id: handleRect
                radius: boundaryRect.radius
                anchors.fill: parent
                border{color: "#2e91ed"; width: 3}
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#272727" }
                    GradientStop { position: 0.33; color: "#2e2e2e" }
                    GradientStop { position: 1.0; color: "#0c0c0c" }
                }
            }

            RowLayout{
                id: vLineRow
                anchors.centerIn: parent
                Repeater{
                    model: 3
                    delegate: vLineComp
                }
            }

            Component{
                id: vLineComp
                Rectangle{
                    id: vLine
                    width: 5
                    height: 24
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "#545454" }
                        GradientStop { position: 1.0; color: "#2b2b2b" }
                    }
                    Rectangle{
                        anchors.centerIn: parent
                        width: 3
                        height: 22
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "#2c2c2c" }
                            GradientStop { position: 0.33; color: "#373737" }
                            GradientStop { position: 1.0; color: "#1b1b1b" }
                        }
                    }
                }
            }
        }
    }
}
