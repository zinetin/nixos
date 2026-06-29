import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

RowLayout {
  Repeater {
    model: {
      let workspaces = Hyprland.workspaces.values;
      return workspaces.sort((a, b) => a.id - b.id );
    }

    Text {
      property var ws: modelData
      property bool isActive: Hyprland.focusedWorkspace?.id === ws.id

      text: ws.name.startsWith("special: ") ? ws.name.replace("speical: ", "s") : ws.id
      color: isActive ? root.colYellow : root.colBlue

      font {
        pixelSize: root.fontSize
        bold: true
        family: root.fontFamily
      }

      MouseArea {
        anchors.fill: parent
        onClicked: Hyprland.dispatch("hl.dsp.focus({ workspace = " + ws.id + "})")
      }
    }
  }
}
