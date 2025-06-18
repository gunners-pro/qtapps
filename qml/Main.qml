import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Window {
    id: window
    width: 800
    height: 480
    visible: true
    title: qsTr("QtApps")

    property bool sidebarVisible: false

    GridLayout {
        id: gridLayout
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0
    }

    Rectangle {
        id: header_bar
        y: 0
        height: 60
        color: "#f9b2b2"
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
        color: "#efc495"
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
    }
}
