import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

PanelWindow {
  id: root

  property color colBg: "#1a1b26"
  property color colFg: "#a9b1d6"
  property color colMuted: "#444b6a"
  property color colCyan: "#66ffff"
  property color colBlue: "#7aa2f7"
  property color colYellow: "#e1e368"
  property string fontFamiliy: "JetBrainsMono Nerd Font"
  property int fontSize: 14

  anchors {
    top: true
    left: true
    right: true
  }
  implicitHeight: 30
  color: colBg

  RowLayout {
    anchors.fill: parent
    anchors.margins: 8

    Repeater {
      model: 10

      Text {
	property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
	property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)

	text: index + 1
	color: isActive ? colYellow : (ws ? "#7aa2f7" : "#444b6a")
	font { pixelSize: 14; bold: true}

	MouseArea {
	  anchors.fill: parent
	  onClicked: Hyprland.dispatch("workspace " + (index + 1))
	}
      }
    }

    Item { Layout.fillWidth: true }
  }
}
