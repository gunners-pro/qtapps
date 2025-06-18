import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Item {
    id: _item
    anchors.fill: parent

    ColumnLayout {
        spacing: 10
        anchors.centerIn: parent

        Text {
            text: "Contador: " + homeController.contador
            font.pixelSize: 24
            Layout.alignment: Qt.AlignHCenter
            Layout.topMargin: -60
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter
            Button {
                text: "Decrementar"
                onClicked: homeController.decrementar()
            }
            Button {
                text: "Incrementar"
                onClicked: homeController.incrementar()
            }
        }
    }
}
