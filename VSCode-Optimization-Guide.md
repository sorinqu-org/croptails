# VS Code Optimization Guide for Godot Project

This guide provides steps to optimize VS Code performance in your Godot project, focusing on reducing lag during typing and code completion. Your hardware (RTX 3070, Ryzen 5 5600, 32GB RAM) is more than capable, so these tweaks target software bottlenecks like extensions, settings, and rendering.

## 1. Enable Hardware Acceleration
Hardware acceleration uses your GPU for rendering, which can significantly reduce lag on your RTX 3070.

- Open VS Code.
- Go to **File > Preferences > Settings** (or Ctrl+,).
- Search for "hardware acceleration".
- Set **Window: Hardware Acceleration** to "on" (it's currently disabled).
- Restart VS Code.

If issues persist after enabling, you can disable it again, but it should improve UI responsiveness.

## 2. Project-Specific Settings
A `.vscode/settings.json` file has been created in your project root with optimizations:
- Disabled unnecessary suggestions, snippets, and highlights to speed up typing.
- Excluded large asset folders (e.g., `assets/`, `addons/`) from file watching and search to prevent indexing overhead.
- Disabled GDScript linter in Godot Tools to reduce background processing.
- Configured GitLens (if installed) to limit scanning on large files.

Reload VS Code (Ctrl+Shift+P > "Developer: Reload Window") to apply.

## 3. Extension Review and Updates
Your installed extensions include:
- `geequlim.godot-tools@2.5.1` (handles GDScript support; current version, no update needed).
- No separate GDScript extension (bundled in Godot Tools).
- Git-related: Git History, Git Graph (no GitLens installed, despite mention; configs in settings.json are prepared if you install it).

To update all extensions:
- Open Command Palette (Ctrl+Shift+P).
- Run "Extensions: Update All Extensions".

If you install GitLens later:
- Search for "GitLens" in Extensions view and install.
- The settings.json already optimizes it for your project.

Disable unused extensions (e.g., Python, C++, Rust if not needed) via Extensions view > right-click > Disable. This reduces background load.

## 4. GitLens Configuration (If Installed)
Since GitLens isn't currently installed, this step is skipped. If you add it:
- The settings.json limits blame and annotations on large files (>100KB) and disables hovers/status bar to avoid lag in asset-heavy projects.

## 5. Testing Changes
- Reload VS Code.
- Open a GDScript file (e.g., `scripts/player/player.gd`).
- Type code and trigger completion (Ctrl+Space or auto).
- Monitor for lag. If improved, great! If not:
  - Disable Godot Tools temporarily: Extensions > Godot Tools > Disable > Reload.
  - Test typing without it to isolate.

Use VS Code's built-in profiler: Help > Toggle Developer Tools > Performance tab to monitor CPU/GPU during typing.

## 6. Additional Tips for Ongoing Maintenance
- **Limit Open Files/Tabs**: Close unused tabs; use Explorer to navigate.
- **Exclude Binary Files**: Already in settings.json, but add more if needed (e.g., `**/*.tres`, `**/*.scn`).
- **Update VS Code**: Help > Check for Updates. Run on latest stable version.
- **Godot Integration**: Ensure Godot editor path in settings points to your Godot executable (already set to "godot").
- **Memory Management**: If lag returns, increase VS Code memory: Add to settings.json: `"node.max_old_space_size": 8192` (uses more of your 32GB RAM).
- **Extensions to Consider**: If GDScript completion is slow, try "GDScript" by Kaleidawave (alternative to Godot Tools) but test one at a time.
- **Project Size**: Your project has many assets; consider using Godot's external editor integration fully and minimize VS Code's role to scripts only.
- **Backup Settings**: Sync settings via GitHub or Settings Sync extension for portability.

Apply these steps sequentially and report back if lag persists for further tweaks.
