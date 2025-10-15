#!/bin/bash
set -e  # Exit on error

echo "🚀 Starting Win Lookalike installation..."

# Ensure script is not run as root
if [ "$EUID" -eq 0 ]; then
  echo "❌ Please run this script as a normal user, not with sudo."
  exit 1
fi

# === 1. Install dependencies ===
echo "📦 Installing required packages..."
sudo dnf install -y make git wget gnome-extensions-app

# === 2. Clone Win_Lookalike repository ===
echo "🧩 Cloning Win Lookalike repository..."
git clone https://github.com/StiviKM/Win_Lookalike "$HOME/Win_Lookalike"

# === 3. Copy the icon file to home ===
echo "🖼️ Copying icon file..."
cp "$HOME/Win_Lookalike/.arc_icon.png" "$HOME/.arc_icon.png"

# === 4. Download and install Dash-to-Panel ===
echo "⬇️ Downloading Dash-to-Panel extension..."
wget -O /tmp/dash-to-panel.zip \
  https://github.com/home-sweet-gnome/dash-to-panel/releases/download/v72/dash-to-panel@jderose9.github.com_v72.zip

echo "🧱 Installing Dash-to-Panel..."
gnome-extensions install /tmp/dash-to-panel.zip --force

# === 5. Clone and install ArcMenu ===
echo "🧭 Cloning and installing ArcMenu..."
git clone https://gitlab.com/arcmenu/ArcMenu.git "$HOME/ArcMenu"
cd "$HOME/ArcMenu"
make install
cd ~

# === 6. Cleanup ===
rm -f /tmp/dash-to-panel.zip
rm -rf "$HOME/ArcMenu"

echo
echo "✅ Win Lookalike installation complete!"
echo "Please log out and log back in, then run the next script (WinLook_Second.sh)."
