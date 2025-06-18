import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Window {
    id: window
    width: 800
    height: 480
    visible: true
    title: qsTr("QtApps")

    property bool sidebarVisible: false
    property string currentPage: "pages/HomePage.qml"

    Rectangle {
        id: header_bar
        y: 0
        height: 60
        anchors.left: sidebar.right
        anchors.right: parent.right
        anchors.leftMargin: 0
        anchors.rightMargin: 0

        RowLayout {
            id: rowLayout
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 15
            anchors.rightMargin: 0
            anchors.topMargin: 0
            anchors.bottomMargin: 0

            Button {
                id: button
                Layout.preferredWidth: 24
                Layout.preferredHeight: 24
                display: AbstractButton.IconOnly
                icon.source: "../Resources/Icons/list.png"
                icon.width: 40
                icon.height: 40
                onClicked: sidebarVisible = !sidebarVisible
            }
        }
    }

    Rectangle {
        id: sidebar
        x: 0
        width: sidebarVisible ? 150 : 0
        color: "#F2F2F2"
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 0
        anchors.bottomMargin: 0

        Behavior on width {
            NumberAnimation {
                duration: 300
                easing.type: Easing.OutBack

            }
        }

        ColumnLayout {
            spacing: 10
            width: parent.width

            Rectangle {
                id: customButton
                width: parent.width -20
                height: 35
                radius: 6
                color: mouseArea.containsMouse ? "#BEEF9E" : "#F2F2F2"
                Layout.rightMargin: 10
                Layout.leftMargin: 10
                Layout.topMargin: 60


                Text {
                    text: "Contador"
                    anchors.centerIn: parent
                    color: "#1E352F"
                    font.bold: true
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: currentPage = "pages/HomePage.qml"
                }

                Behavior on color {
                    ColorAnimation { duration: 150 }
                }
            }
        }
    }

    // Conteúdo principal
    Rectangle {
        id: mainContent
        anchors.left: sidebar.right
        anchors.right: parent.right
        anchors.top: header_bar.bottom
        anchors.bottom: parent.bottom

        Loader {
            id: pageLoader
            anchors.fill: parent
            source: currentPage
        }
    }
}
