# dotfiles

KDE configuration files managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

```
~/dotfiles/
├── kde6/
│   └── .config/
│       ├── kdeglobals
│       ├── kwinrc
│       ├── plasmashellrc
│       ├── plasma-org.kde.plasma.desktop-appletsrc
│       ├── kglobalshortcutsrc
│       ├── khotkeysrc
│       ├── kcminputrc
│       └── kxkbrc
└── konsole/
    ├── .config/
    │   └── konsolerc
    └── .local/share/konsole/
        └── *.profile
```

Stow creates symlinks from `~/.config/` pointing to the corresponding files in this repository.  
When KDE modifies a config through the UI, the changes go directly into the repository.

## Installation on a new machine

```bash
# 1. Install dependencies
sudo pacman -S stow git

# 2. Clone the repository
git clone git@github.com:you/dotfiles.git ~/dotfiles

# 3. Apply configs
cd ~/dotfiles
stow kde6
stow konsole
```

If `~/.config/` already contains files (conflict), use `--adopt` followed by `git checkout`.  
**Warning:** `--adopt` moves existing files from `~/.config/` into the repository, overwriting your dotfiles with the machine's defaults. `git checkout .` restores your versions afterwards.

```bash
stow --adopt kde6
git diff        # review what was overwritten by default configs
git checkout .  # restore your versions from the repository
```

After `git checkout .`, your configs are back in the repository and symlinked into `~/.config/`.

## Saving changes made through the UI

Since Stow uses symlinks, files in the repository are updated automatically.  
Just commit the changes:

```bash
cd ~/dotfiles
git diff                        # review changes
git add .
git commit -m "update kwinrc"
git push
```

Or using lazygit (`sudo pacman -S lazygit`):

```bash
cd ~/dotfiles && lazygit
```

## Stow commands reference

| Command | Action |
|---|---|
| `stow kde6` | create symlinks |
| `stow -D kde6` | remove symlinks |
| `stow -R kde6` | recreate symlinks |
| `stow --adopt kde6` | adopt existing files from `~/.config/` |

## Adding a new config file

```bash
# Copy the file into the repository
cp ~/.config/newapp.conf ~/dotfiles/kde6/.config/

# Recreate symlinks
cd ~/dotfiles
stow -R kde6

# Commit
git add . && git commit -m "add newapp config"
```
