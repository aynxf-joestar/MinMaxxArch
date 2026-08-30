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
    color: "#282828"// Catppuccin Mocha Crust

    RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 12
        anchors.rightMargin: 12
        spacing: 10

        // --- WORKSPACE INDICATOR ---
        RowLayout {
            spacing: 6

            Repeater {
                model: 9 // Displays workspaces 1 through 9

                Rectangle {
                    required property int index
                    property int wsId: index + 1
                    
                    // Look up if the workspace actually exists in Hyprland
                    property var hyprWs: Hyprland.workspaces.values.find(ws => ws.id === wsId)
                    // Check if this workspace is currently active/focused
                    property bool isActive: Hyprland.focusedWorkspace && Hyprland.focusedWorkspace.id === wsId

                    implicitWidth: isActive ? 24 : 10
                    implicitHeight: 10
                    radius: 0
                    
                    // Smooth transition when switching workspaces
                    Behavior on implicitWidth { NumberAnimation { duration: 150 } }

                    // Color logic: Cyan if active, light blue if open windows exist, muted gray if empty
                    color: isActive ? "#b8bb26" : (hyprWs ? "#98971a" : "#665c54")

                    MouseArea {
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        // Click to instantly jump to that workspace
                        onClicked: Hyprland.dispatch("workspace " + wsId)
                    }
                }
            }
        }

        // --- CENTER SPACER ---
        // This pushes the workspace module to the left and subsequent modules to the right
        Item {
            Layout.fillWidth: true
        } 
    }
}

