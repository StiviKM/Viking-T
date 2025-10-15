#!/bin/bash
set -e  # Exit on error

echo "🚀 Starting Viking-T final setup and cleanup..."

# === Paths ===
VIKING_DIR="$HOME/Viking-T"
WALLPAPER_SRC="$VIKING_DIR/Wallpaper.jpg"
WALLPAPER_DST="$HOME/.viking-wallpaper.jpg"
ICON_REPO="https://github.com/yeyushengfan258/Win11-icon-theme.git"
ICON_DIR="$HOME/Win11-icon-theme"
DTP_CONF="$VIKING_DIR/Dash_To_Panel_Win"
ARC_CONF="$VIKING_DIR/Arc_Menu_Win"

# === 1. Load GNOME extension settings ===
if [ -f "$DTP_CONF" ]; then
  echo "🔧 Loading Dash to Panel config..."
  dconf load /org/gnome/shell/extensions/dash-to-panel/ < "$DTP_CONF"
else
  echo "⚠️ Dash_To_Panel_Win config not found."
fi

if [ -f "$ARC_CONF" ]; then
  echo "🧭 Loading ArcMenu config..."
  dconf load /org/gnome/shell/extensions/arcmenu/ < "$ARC_CONF"
else
  echo "⚠️ Arc_Menu_Win config not found."
fi

# === 2. Install Windows 11 icon theme ===
if [ ! -d "$ICON_DIR" ]; then
  echo "🎨 Cloning Win11 icon theme..."
  git clone "$ICON_REPO" "$ICON_DIR"
else
  echo "🎨 Win11 icon theme already cloned."
fi

cd "$ICON_DIR"
echo "🛠️ Installing icon theme..."
./install.sh
cd ~

echo "🎨 Applying Win11 icon theme..."
gsettings set org.gnome.desktop.interface icon-theme "Win11-dark"

# === 3. Move wallpaper and set background ===
if [ -f "$WALLPAPER_SRC" ]; then
  echo "🖼️ Moving and applying wallpaper..."
  mv -f "$WALLPAPER_SRC" "$WALLPAPER_DST"
  gsettings set org.gnome.desktop.background picture-uri "file://$WALLPAPER_DST"
  gsettings set org.gnome.desktop.background picture-uri-dark "file://$WALLPAPER_DST"
else
  echo "⚠️ Wallpaper.jpg not found in $VIKING_DIR."
fi

# === 4. Enable extensions ===
echo "⚙️ Ensuring GNOME extensions are enabled..."
gnome-extensions enable dash-to-panel@jderose9.github.com || echo "❌ Could not enable Dash-to-Panel."
gnome-extensions enable arcmenu@arcmenu.com || echo "❌ Could not enable ArcMenu."

# === 5. Cleanup unnecessary files ===
echo "🧹 Cleaning up..."
rm -f /tmp/dash-to-panel.zip
rm -rf "$VIKING_DIR"
rm -rf "$ICON_DIR"

echo
echo "✅ Viking-T setup completed successfully!"
echo "Your wallpaper, icons, and extensions are now active."
echo "You can reload GNOME Shell with Alt+F2 → 'r' → Enter to apply final changes."
