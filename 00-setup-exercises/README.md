# Jupyter Setup Exercises

Materials for setting up a Jupyter data science environment and exploring introductory data science concepts.

## Table of Contents

- [Files](#files)
- [Getting Started](#getting-started)
- [Starting Jupyter Server](#starting-jupyter-server)
- [Requirements](#requirements)
- [Homebrew Installation (macOS)](#homebrew-installation-macos)
- [Python Installation](#python-installation)
- [Git Installation](#git-installation)
- [GitHub CLI Setup](#github-cli-setup)
- [SSH Key Setup for GitHub](#ssh-key-setup-for-github)
- [Git Configuration](#git-configuration)

---

## Files

### Setup Guides

| File | Description |
|------|-------------|
| `jupyter_setup_guide.md` | Complete step-by-step guide for installing Python, creating virtual environments, and setting up Jupyter Notebook/Lab on Windows, macOS, and Linux |
| `jupyter_quick_reference.md` | Cheat sheet with common commands for daily Jupyter workflow, keyboard shortcuts, pip commands, and troubleshooting tips |

### Setup Scripts

| File | Description |
|------|-------------|
| `setup_jupyter_macos_linux.sh` | Automated setup script for macOS/Linux that creates a project directory, virtual environment, installs Jupyter and data science libraries |
| `setup_jupyter_windows.bat` | Automated setup script for Windows that performs the same setup process via Command Prompt |

### Tutorial Materials

| File | Description |
|------|-------------|
| `data_science_tour.ipynb` | Interactive Jupyter notebook demonstrating core data science skills: data loading, cleaning, filtering, visualization, correlation analysis, group-by operations, feature engineering, and predictive insights |
| `student_performance.csv` | Dataset containing 14,000+ student records with features like study hours, attendance, exam scores, motivation, stress level, and final grades — used in the data science tour notebook |

## Getting Started

1. Follow `jupyter_setup_guide.md` to install Python and Jupyter
2. Or run the appropriate setup script for your OS:
   - macOS/Linux: `chmod +x setup_jupyter_macos_linux.sh && ./setup_jupyter_macos_linux.sh`
   - Windows: Double-click `setup_jupyter_windows.bat`
3. Open `data_science_tour.ipynb` in Jupyter to explore the tutorial

## Starting Jupyter Server

After initial setup, use these commands to start Jupyter:

### macOS/Linux

```bash
# Navigate to your project directory
cd ~/data_science_projects

# Activate virtual environment
source jupyter_env/bin/activate

# Start JupyterLab (recommended)
jupyter lab

# Or start classic Jupyter Notebook
jupyter notebook
```

### Windows

```cmd
# Navigate to your project directory
cd %USERPROFILE%\data_science_projects

# Activate virtual environment
jupyter_env\Scripts\activate

# Start JupyterLab (recommended)
jupyter lab

# Or start classic Jupyter Notebook
jupyter notebook
```

### Common Options

```bash
# Start on a specific port
jupyter lab --port 8889

# Start without opening browser
jupyter lab --no-browser

# Start in a specific directory
jupyter lab --notebook-dir=/path/to/notebooks
```

### Stopping Jupyter

Press `Ctrl + C` in the terminal, then type `y` to confirm.

### Deactivating Virtual Environment

When done, deactivate the virtual environment:

```bash
deactivate
```

## Requirements

- Python 3.x
- Libraries: pandas, numpy, matplotlib, seaborn, scipy, scikit-learn

### Installing Dependencies

After creating and activating your virtual environment, install all required packages:

```bash
pip install -r requirements.txt
```

This installs all libraries needed for the data science tour notebook, including:
- **pandas, numpy** — Data manipulation
- **matplotlib, seaborn, plotly** — Visualization
- **scipy, statsmodels** — Statistical analysis
- **scikit-learn** — Machine learning
- **jupyterlab, notebook** — Jupyter environment

---

## Homebrew Installation (macOS)

Homebrew is a package manager for macOS that makes it easy to install developer tools.

### Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Add Homebrew to PATH

After installation, follow the instructions shown in the terminal. Typically:

```bash
# For Apple Silicon (M1/M2/M3)
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# For Intel Macs
echo 'eval "$(/usr/local/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/usr/local/bin/brew shellenv)"
```

### Verify Installation

```bash
brew --version
```

### Common Commands

| Command | Description |
|---------|-------------|
| `brew install <package>` | Install a package |
| `brew uninstall <package>` | Uninstall a package |
| `brew update` | Update Homebrew |
| `brew upgrade` | Upgrade all packages |
| `brew list` | List installed packages |
| `brew search <name>` | Search for packages |

---

## Python Installation

### macOS

```bash
brew install python
```

### Windows

1. Download from [python.org/downloads](https://www.python.org/downloads/)
2. Run the installer
3. **Important**: Check "Add Python to PATH" at the bottom of the installer
4. Click "Install Now"

Or using winget:
```bash
winget install --id Python.Python.3.12
```

### Linux

#### Debian/Ubuntu
```bash
sudo apt update
sudo apt install python3 python3-pip python3-venv
```

#### Fedora
```bash
sudo dnf install python3 python3-pip
```

### Verify Installation

```bash
# macOS/Linux
python3 --version
pip3 --version

# Windows
python --version
pip --version
```

### Create a Virtual Environment

Virtual environments isolate project dependencies:

```bash
# Create
python3 -m venv myenv        # macOS/Linux
python -m venv myenv         # Windows

# Activate
source myenv/bin/activate    # macOS/Linux
myenv\Scripts\activate       # Windows

# Deactivate
deactivate
```

---

## Git Installation

### macOS

```bash
brew install git
```

### Windows

#### Option 1: Git for Windows (Recommended)
Download and install from [git-scm.com](https://git-scm.com/download/win)

During installation:
- Select "Git from the command line and also from 3rd-party software"
- Select "Use bundled OpenSSH"
- Select "Checkout Windows-style, commit Unix-style line endings"
- Select "Use Windows' default console window" or "Use MinTTY"

#### Option 2: winget
```bash
winget install --id Git.Git
```

### Linux

#### Debian/Ubuntu
```bash
sudo apt update
sudo apt install git
```

#### Fedora
```bash
sudo dnf install git
```

#### Arch Linux
```bash
sudo pacman -S git
```

### Verify Installation

```bash
git --version
```

You should see something like: `git version 2.x.x`

---

## GitHub CLI Setup

The GitHub CLI (`gh`) allows you to interact with GitHub from the command line — create repos, manage pull requests, and more.

### Installation

#### macOS
```bash
brew install gh
```

#### Windows
```bash
winget install --id GitHub.cli
```
Or download from [cli.github.com](https://cli.github.com/)

#### Linux (Debian/Ubuntu)
```bash
sudo apt install gh
```

#### Linux (Fedora)
```bash
sudo dnf install gh
```

### Authentication

After installing, authenticate with your GitHub account:

```bash
gh auth login
```

Follow the prompts:
1. Select `GitHub.com`
2. Choose your preferred protocol (HTTPS or SSH)
3. Authenticate via web browser

### Verify Setup

```bash
gh auth status
```

### Common Commands

| Command | Description |
|---------|-------------|
| `gh repo create` | Create a new repository |
| `gh repo clone owner/repo` | Clone a repository |
| `gh pr create` | Create a pull request |
| `gh pr list` | List pull requests |
| `gh issue create` | Create an issue |
| `gh issue list` | List issues |

### Multiple Accounts

To add another GitHub account:

```bash
gh auth login
```

To switch between accounts:

```bash
gh auth switch
```

To see all authenticated accounts:

```bash
gh auth status
```

---

## SSH Key Setup for GitHub

SSH keys provide secure authentication to GitHub without entering your password each time.

### Generate an SSH Key

Use Ed25519 (recommended by GitHub):

```bash
ssh-keygen -t ed25519 -C "your_email@example.com" -f ~/.ssh/id_ed25519_github
```

Press Enter to accept defaults (or set a passphrase for extra security).

### Add Key to SSH Agent

#### macOS/Linux
```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519_github
```

#### Windows (Git Bash)
```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519_github
```

#### Windows (PowerShell)
```powershell
Start-Service ssh-agent
ssh-add $env:USERPROFILE\.ssh\id_ed25519_github
```

### Copy Public Key

#### macOS
```bash
pbcopy < ~/.ssh/id_ed25519_github.pub
```

#### Linux
```bash
cat ~/.ssh/id_ed25519_github.pub
# Then copy the output manually
```

#### Windows
```bash
clip < ~/.ssh/id_ed25519_github.pub
```

### Add Key to GitHub

1. Go to [GitHub Settings > SSH and GPG keys](https://github.com/settings/keys)
2. Click **New SSH key**
3. Give it a title (e.g., "My Laptop")
4. Paste your public key
5. Click **Add SSH key**

### Test Connection

```bash
ssh -T git@github.com
```

You should see: `Hi username! You've successfully authenticated...`

### Multiple GitHub Accounts

If you have multiple GitHub accounts, configure `~/.ssh/config`:

```
# Personal account
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_personal
    IdentitiesOnly yes

# Work/School account
Host github.com-work
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_work
    IdentitiesOnly yes
```

Then clone using the appropriate host alias:

```bash
# Personal account
git clone git@github.com:username/repo.git

# Work account
git clone git@github.com-work:username/repo.git
```

### Troubleshooting

**Permission denied (publickey)**
- Ensure the SSH agent is running: `eval "$(ssh-agent -s)"`
- Add your key: `ssh-add ~/.ssh/id_ed25519_github`
- Verify key is added: `ssh-add -l`

**Wrong account used**
- Check your SSH config file (`~/.ssh/config`)
- Use the correct host alias when cloning

---

## Git Configuration

Configure Git with your identity and preferences.

### Required: Set Your Identity

```bash
git config --global user.name "Your Name"
git config --global user.email "your_email@example.com"
```

### Set Default Branch Name

```bash
git config --global init.defaultBranch main
```

### Set Default Editor

```bash
# VS Code
git config --global core.editor "code --wait"

# Vim
git config --global core.editor "vim"

# Nano
git config --global core.editor "nano"
```

### Useful Aliases

```bash
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.cm "commit -m"
git config --global alias.lg "log --oneline --graph --all"
```

### Line Ending Configuration

#### macOS/Linux
```bash
git config --global core.autocrlf input
```

#### Windows
```bash
git config --global core.autocrlf true
```

### Credential Helper

#### macOS (use Keychain)
```bash
git config --global credential.helper osxkeychain
```

#### Windows (use Windows Credential Manager)
```bash
git config --global credential.helper wincred
```

#### Linux (cache for 1 hour)
```bash
git config --global credential.helper 'cache --timeout=3600'
```

### Per-Repository Configuration

For different identities per project (e.g., work vs personal):

```bash
cd /path/to/work/repo
git config user.name "Work Name"
git config user.email "work@company.com"
```

### View Your Configuration

```bash
# View all settings
git config --list

# View specific setting
git config user.name

# View where settings are defined
git config --list --show-origin
```

### Recommended Global Settings

```bash
# Enable colored output
git config --global color.ui auto

# Set pull behavior to rebase
git config --global pull.rebase true

# Prune deleted remote branches on fetch
git config --global fetch.prune true

# Set default push behavior
git config --global push.default current
```
