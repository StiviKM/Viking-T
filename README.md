# Win_Lookalike 🖥️✨

**Win_Lookalike** is a GNOME desktop customization project designed to replicate the Windows aesthetic on **Fedora 42**. With a simple setup, you can transform your GNOME desktop to look and feel like Windows — including themes, icons, taskbars, and system tweaks.

---

## 📥 How to Download the Scripts

To get started with **Win_Lookalike**, follow these steps:

1. **Download the Scripts:**

   * Navigate to the [Win_Lookalike GitHub repository](https://github.com/StiviKM/Win_Lookalike).
   * Download the following files:

     * `WinLook_First.sh`
     * `WinLook_Second.sh`

2. **Move the Scripts to Your Home Directory:**

   ```bash
   mv WinLook_First.sh WinLook_Second.sh ~/
   ```

3. **Make the First Script Executable:**

   ```bash
   chmod +x ~/WinLook_First.sh
   ```

4. **Run the First Script:**

   ```bash
   ./WinLook_First.sh
   ```

> The second script (`WinLook_Second.sh`) will automatically execute upon your next login, applying additional configurations.

---

## ✨ Features and Functionalities

The **Win_Lookalike** scripts provide a comprehensive set of features to transform your GNOME desktop:

### 🎨 Visual Customizations

* Windows-like desktop theme and icons
* Taskbar configuration to mimic Windows taskbar
* Windows-style application menu (Arc Menu)
* Pre-configured Windows-style wallpaper

### ⚙️ System Tweaks

* Locale set to **Bulgarian** by default
* Adds **Bulgarian (Traditional Phonetic)** keyboard layout
* Automatic application of theme and system settings after login
* File manager tweaks to resemble Windows Explorer
* Window decorations matching Windows aesthetics

---

## 📝 FULL LIST: Settings Changed & Actions Performed

The **Win_Lookalike** scripts modify your GNOME desktop and system in the following ways:

### 📦 Installed Packages

* Installs **make** for building software.
* Installs **git** for version control.
* Installs **wget** for downloading files.
* Installs **GNOME Extensions App** to manage GNOME extensions.
* Installs **meson** and **ninja-build** for building GNOME extensions.

### 🧹 Cleanup

* Removes all temporary files and assets used during installation.

### 🌟 Desktop & GNOME Tweaks

* Sets your **favorite applications** in the GNOME dock (Firefox and Nautilus).
* Sets the **system language/region to Bulgarian**.
* Adds **US and Bulgarian (Traditional Phonetic) keyboard layouts**.
* Adjusts **window buttons** to match Windows layout (minimize, maximize, close on the right).
* Enables **tree view** in Nautilus file manager.
* Shows **“Delete Permanently” option** in Nautilus.
* Adds **“Create Link” option** in Nautilus context menu.
* Ensures **directories are shown first** in file chooser dialogs.
* Enables **recursive search** in Nautilus by default.
* Always displays **image thumbnails** in Nautilus.
* Shows **directory item counts** in Nautilus.

---

## 🙏 Acknowledgments

This project utilizes several open-source tools and extensions. Special thanks to the respective developers and communities for their contributions:

* **Dash to Panel** – Combines GNOME dash and top bar into a single panel: [GitHub](https://github.com/home-sweet-gnome/dash-to-panel)
* **Arc Menu** – GNOME Shell extension for a Windows-like Start menu: [GitLab](https://gitlab.com/arcmenu/ArcMenu)
* **AppIndicator** – GNOME Shell extension for Ubuntu AppIndicators: [GitHub](https://github.com/ubuntu/gnome-shell-extension-appindicator)
* **Win11 Icons** – Windows 11 inspired icon pack: [GitHub](https://github.com/yeyushengfan258/Win11-icon-theme)
* **Desktop Icons NG** – GNOME desktop icons manager: [GitHub](https://github.com/pop-os/desktop-icons-ng)

**Legal Notice**: This project uses a Windows-style wallpaper and icons inspired by Windows 11. These assets are used for aesthetic purposes only and are not affiliated with or endorsed by Microsoft Corporation. All trademarks and registered trademarks are the property of their respective owners.

---

## ⚠️ Critical Disclaimer

**These scripts are provided “AS IS” without any warranty. Use at your own risk.**

* **Fresh Install Recommended**: Optimized for **Fedora 42** only.
* **No Liability**: The author assumes no responsibility for data loss or system issues.
* **Security Notice**: Always review scripts from the internet before execution.

---

## 🎯 Use Cases

* **Desktop Makeover**: Transform your GNOME desktop into a Windows-like environment
* **Testing Environments**: Ideal for experimenting with GNOME tweaks and themes
* **Learning Linux**: Understand GNOME desktop configuration and scripting
* **Development**: Prepare a visually familiar environment for testing applications

---

## 🤝 Contributing

Found an issue or have suggestions? Contributions are welcome! Please open an issue on our [GitHub Repository](https://github.com/StiviKM/Win_Lookalike).

---
