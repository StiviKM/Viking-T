#!/bin/bash
set -e  # Exit on error

echo "🚀 Starting Win Lookalike final setup and cleanup..."

# === Paths ===
WIN_DIR="$HOME/Win_Lookalike"
WALLPAPER_SRC="$WIN_DIR/Wallpaper.jpg"
WALLPAPER_DST="$HOME/.viking-wallpaper.jpg"
ICON_REPO="https://github.com/yeyushengfan258/Win11-icon-theme.git"
ICON_DIR="$HOME/Win11-icon-theme"
DTP_CONF="$WIN_DIR/Dash_To_Panel_Win"
ARC_CONF="$WIN_DIR/Arc_Menu_Win"
DIN_CONF="$WIN_DIR/Desktop_Icons_NG_Win"  # Optional config for Desktop Icons NG

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

if [ -f "$DIN_CONF" ]; then
  echo "🖥️ Loading Desktop Icons NG config..."
  dconf load /org/gnome/shell/extensions/desktop-icons-ng/ < "$DIN_CONF"
else
  echo "⚠️ Desktop_Icons_NG_Win config not found. Default settings will be used."
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
  echo "⚠️ Wallpaper.jpg not found in $WIN_DIR."
fi

# === 4. Enable extensions ===
echo "⚙️ Ensuring GNOME extensions are enabled..."
gnome-extensions enable dash-to-panel@jderose9.github.com || echo "❌ Could not enable Dash-to-Panel."
gnome-extensions enable arcmenu@arcmenu.com || echo "❌ Could not enable ArcMenu."
gnome-extensions disable arcmenu@arcmenu.com || true
gnome-extensions enable arcmenu@arcmenu.com
gnome-extensions enable ding@rastersoft.com || echo "❌ Could not enable Desktop Icons NG."
gnome-extensions enable appindicatorsupport@rgcjonas.gmail.com || echo "❌ Could not enable AppIndicator Support."

# === 5. Set pinned apps on Dash ===
echo "📌 Setting pinned apps..."
gsettings set org.gnome.shell favorite-apps "['org.mozilla.firefox.desktop', 'org.gnome.Nautilus.desktop']"

# === 6. Set Local Format to Bulgarian and add Traditional Phonetic Keyboard Layout ===
gsettings set org.gnome.system.locale region 'bg_BG.UTF-8'
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('xkb', 'bg+phonetic')]"

# === 7. Enabling minimize and maximize buttons ===
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close'

# === 8. Enabling Nautilus Settings === 
gsettings set org.gnome.nautilus.list-view use-tree-view true
gsettings set org.gnome.nautilus.preferences show-delete-permanently true
gsettings set org.gnome.nautilus.preferences show-create-link true
gsettings set org.gtk.gtk4.Settings.FileChooser sort-directories-first true
gsettings set org.gnome.nautilus.preferences recursive-search 'always'
gsettings set org.gnome.nautilus.preferences show-image-thumbnails 'always'
gsettings set org.gnome.nautilus.preferences show-directory-item-counts 'always'

# === 9. Cleanup unnecessary files ===
echo "🧹 Cleaning up..."
rm -f /tmp/dash-to-panel.zip
rm -rf "$WIN_DIR"
rm -rf "$ICON_DIR"

echo
echo "✅ Win Lookalike setup completed successfully!"
echo "Your wallpaper, icons, and extensions (including Desktop Icons NG) are now active."
