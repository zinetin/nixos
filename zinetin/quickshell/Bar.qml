import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import "modules/Workspaces"

PanelWindow {
  id: rootbar

  anchors = {
    top: true
    left: true
    right: true
  }

  implicitHeight: 30
  color: root.colBg

  RowLayout {
    anchors.fill: parent
    anchors.margins: 8

    Workspaces {}

    Item { Layout.fillWidth: true }
  }
}
