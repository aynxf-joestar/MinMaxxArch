import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

PanelWindow {
    anchors {
        top: true
        left: true
        right: true
    }
    implicitHeight: 30
    color: "#1a1b26" 
    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 12
        spacing: 10
        RowLayout { //WORKSPACEEEEEEEEEEE
            spacing: 4
            Repeater {
                model: 9 // Displays workspaces 1 through 9
                Rectangle {
                    required property int index
                    property int wsId: index + 1
                    property var hyprWs: Hyprland.workspaces.values.find(ws => ws.id === wsId)
                    property bool isActive: Hyprland.focusedWorkspace && Hyprland.focusedWorkspace.id === wsId
                    implicitWidth: isActive ? 24 : 12
                    implicitHeight: 12
                    //radius:10 
                    // Smooth transition when switching workspaces
                    Behavior on implicitWidth { NumberAnimation { duration:150 } }
                    color: isActive ? "#f776ae" : (hyprWs ? "#7aa2f7" : "#c0caf5")
                }
            }
        }
        //Item {
        //    Layout.fillWidth: true
        //} 
    }
}
