# 🚀 Setting Up a Jupyter Server from Scratch

A complete guide for beginners to set up Jupyter Notebook/Lab on a clean computer.

---

## Table of Contents

1. [Prerequisites](#1-prerequisites)
2. [Installing Python](#2-installing-python)
3. [Setting Up a Virtual Environment](#3-setting-up-a-virtual-environment)
4. [Installing Jupyter](#4-installing-jupyter)
5. [Running Jupyter](#5-running-jupyter)
6. [Installing Data Science Libraries](#6-installing-data-science-libraries)
7. [Configuring Jupyter Server](#7-configuring-jupyter-server-optional)
8. [Running Jupyter as a Remote Server](#8-running-jupyter-as-a-remote-server-advanced)
9. [Troubleshooting](#9-troubleshooting)
10. [Quick Reference](#10-quick-reference)

---

## 1. Prerequisites

Before starting, ensure you have:
- Administrative/sudo access to your computer
- Internet connection for downloading packages
- At least 2GB of free disk space

---

## 2. Installing Python

### Windows

1. **Download Python**
   - Go to [python.org/downloads](https://www.python.org/downloads/)
   - Download the latest Python 3.x version (e.g., Python 3.12)

2. **Run the Installer**
   - **IMPORTANT**: Check the box ✅ **"Add Python to PATH"** at the bottom
   - Click "Install Now"
   - Wait for installation to complete

3. **Verify Installation**
   - Open Command Prompt (search "cmd" in Start menu)
   - Type:
     ```cmd
     python --version
     ```
   - You should see something like: `Python 3.12.x`

### macOS

1. **Option A: Using Homebrew (Recommended)**
   
   First, install Homebrew if you don't have it:
   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```
   
   Then install Python:
   ```bash
   brew install python
   ```

2. **Option B: Download from python.org**
   - Go to [python.org/downloads](https://www.python.org/downloads/)
   - Download the macOS installer
   - Run the .pkg file and follow the prompts

3. **Verify Installation**
   ```bash
   python3 --version
   ```

### Linux (Ubuntu/Debian)

Python usually comes pre-installed. If not:

```bash
# Update package list
sudo apt update

# Install Python and pip
sudo apt install python3 python3-pip python3-venv

# Verify installation
python3 --version
pip3 --version
```

### Linux (Fedora/RHEL/CentOS)

```bash
# Install Python
sudo dnf install python3 python3-pip

# Verify installation
python3 --version
```

---

## 3. Setting Up a Virtual Environment

A virtual environment keeps your project dependencies isolated. This is a **best practice** that prevents conflicts between different projects.

### Why Use Virtual Environments?

- Keeps dependencies organized per project
- Avoids conflicts between different package versions
- Makes projects reproducible
- Keeps your system Python clean

### Create a Project Directory

```bash
# Create a directory for your data science work
mkdir data_science_projects
cd data_science_projects
```

### Create a Virtual Environment

#### Windows (Command Prompt)
```cmd
python -m venv jupyter_env
```

#### Windows (PowerShell)
```powershell
python -m venv jupyter_env
```

#### macOS / Linux
```bash
python3 -m venv jupyter_env
```

### Activate the Virtual Environment

#### Windows (Command Prompt)
```cmd
jupyter_env\Scripts\activate
```

#### Windows (PowerShell)
```powershell
jupyter_env\Scripts\Activate.ps1
```

> **Note**: If you get an execution policy error in PowerShell, run:
> ```powershell
> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
> ```

#### macOS / Linux
```bash
source jupyter_env/bin/activate
```

### Verify Activation

When activated, you'll see `(jupyter_env)` at the beginning of your command prompt:

```
(jupyter_env) C:\Users\YourName\data_science_projects>
```

or

```
(jupyter_env) user@computer:~/data_science_projects$
```

### Deactivate (When Done)

```bash
deactivate
```

---

## 4. Installing Jupyter

With your virtual environment **activated**, install Jupyter:

### Option A: Jupyter Notebook (Classic)

```bash
pip install notebook
```

### Option B: JupyterLab (Modern Interface - Recommended)

```bash
pip install jupyterlab
```

### Option C: Install Both

```bash
pip install notebook jupyterlab
```

### Verify Installation

```bash
jupyter --version
```

You should see output like:
```
Selected Jupyter core packages...
IPython          : 8.x.x
jupyter_client   : 8.x.x
jupyter_core     : 5.x.x
jupyterlab       : 4.x.x
notebook         : 7.x.x
...
```

### Register the Virtual Environment as a Jupyter Kernel

This step ensures Jupyter uses your virtual environment (with all installed packages) instead of the system Python:

```bash
python -m ipykernel install --user --name=<venv-name> --display-name="Python (data-science)"
```

Replace `<venv-name>` with your actual virtual environment name (e.g., `jupyter_env`).

After running this command, you can select "Python (data-science)" as your kernel in Jupyter.

---

## 5. Running Jupyter

### Start Jupyter Notebook

```bash
jupyter notebook
```

### Start JupyterLab

```bash
jupyter lab
```

### What Happens Next

1. A browser window will automatically open
2. You'll see the Jupyter interface at `http://localhost:8888`
3. The terminal will show server logs

### Stopping Jupyter

- In the terminal, press `Ctrl + C`
- Type `y` to confirm shutdown

### Specifying a Directory

To start Jupyter in a specific folder:

```bash
jupyter notebook /path/to/your/folder
```

or

```bash
cd /path/to/your/folder
jupyter notebook
```

---

## 6. Installing Data Science Libraries

With your virtual environment activated, install the essential data science stack:

### Core Libraries

```bash
pip install pandas numpy matplotlib seaborn scipy
```

### Extended Stack (Optional but Recommended)

```bash
pip install scikit-learn statsmodels plotly openpyxl xlrd
```

### All-in-One Command

```bash
pip install pandas numpy matplotlib seaborn scipy scikit-learn statsmodels plotly openpyxl
```

### What Each Library Does

| Library | Purpose |
|---------|---------|
| `pandas` | Data manipulation and analysis |
| `numpy` | Numerical computing |
| `matplotlib` | Basic plotting and visualization |
| `seaborn` | Statistical visualization |
| `scipy` | Scientific computing |
| `scikit-learn` | Machine learning |
| `statsmodels` | Statistical modeling |
| `plotly` | Interactive visualizations |
| `openpyxl` | Reading/writing Excel files |

### Save Your Environment

To save your installed packages for later:

```bash
pip freeze > requirements.txt
```

To recreate the environment on another machine:

```bash
pip install -r requirements.txt
```

---

## 7. Configuring Jupyter Server (Optional)

### Generate Configuration File

```bash
jupyter notebook --generate-config
```

This creates a configuration file at:
- **Windows**: `C:\Users\YourName\.jupyter\jupyter_notebook_config.py`
- **macOS/Linux**: `~/.jupyter/jupyter_notebook_config.py`

### Common Configuration Options

Edit the config file with a text editor:

```python
# Set the default browser
c.ServerApp.browser = 'chrome'

# Change the default port (default is 8888)
c.ServerApp.port = 8888

# Set the default directory when Jupyter starts
c.ServerApp.root_dir = '/path/to/your/notebooks'

# Disable automatic browser opening
c.ServerApp.open_browser = False

# Allow access from any IP (for remote access)
c.ServerApp.ip = '0.0.0.0'
```

---

## 8. Running Jupyter as a Remote Server (Advanced)

If you want to access Jupyter from another computer on your network:

### Step 1: Set a Password

```bash
jupyter notebook password
```

Enter and confirm your password. This creates a hashed password in your config.

### Step 2: Generate SSL Certificate (Recommended for Security)

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout jupyter_key.key -out jupyter_cert.pem
```

### Step 3: Update Configuration

Edit `jupyter_notebook_config.py`:

```python
c.ServerApp.ip = '0.0.0.0'
c.ServerApp.port = 8888
c.ServerApp.open_browser = False
c.ServerApp.certfile = '/path/to/jupyter_cert.pem'
c.ServerApp.keyfile = '/path/to/jupyter_key.key'
```

### Step 4: Start the Server

```bash
jupyter notebook
```

### Step 5: Access from Another Computer

Open a browser and go to:
```
https://your-server-ip:8888
```

> **Note**: You may see a security warning about the self-signed certificate. This is normal for self-signed certs.

### Firewall Configuration

#### Windows
Allow port 8888 through Windows Firewall.

#### Linux (UFW)
```bash
sudo ufw allow 8888
```

#### macOS
The firewall usually allows outbound connections by default.

---

## 9. Troubleshooting

### Problem: "python" or "pip" not recognized

**Windows Solution:**
- Reinstall Python and check "Add Python to PATH"
- Or manually add Python to PATH:
  1. Search "Environment Variables" in Start menu
  2. Edit "Path" under System Variables
  3. Add: `C:\Users\YourName\AppData\Local\Programs\Python\Python3x\`
  4. Add: `C:\Users\YourName\AppData\Local\Programs\Python\Python3x\Scripts\`

**macOS/Linux Solution:**
- Use `python3` and `pip3` instead of `python` and `pip`

### Problem: Permission Denied (Linux/macOS)

Don't use `sudo pip install`. Instead:
- Use a virtual environment (recommended)
- Or use `pip install --user package_name`

### Problem: Jupyter Won't Start

1. Make sure your virtual environment is activated
2. Try reinstalling:
   ```bash
   pip uninstall notebook jupyterlab
   pip install notebook jupyterlab
   ```

### Problem: Browser Doesn't Open Automatically

Manually open your browser and go to:
```
http://localhost:8888
```

Or copy the URL with token from the terminal output.

### Problem: Port Already in Use

```bash
# Use a different port
jupyter notebook --port 8889
```

### Problem: Kernel Dies or Won't Start

```bash
# Reinstall ipykernel
pip uninstall ipykernel
pip install ipykernel

# Register the kernel
python -m ipykernel install --user --name=jupyter_env
```

### Problem: Import Error for pandas/numpy

Make sure you:
1. Activated your virtual environment
2. Installed the packages in that environment
3. Are using the correct kernel in Jupyter

---

## 10. Quick Reference

### Daily Workflow

```bash
# 1. Navigate to your project folder
cd data_science_projects

# 2. Activate virtual environment
source jupyter_env/bin/activate  # macOS/Linux
# OR
jupyter_env\Scripts\activate     # Windows

# 3. Start Jupyter
jupyter lab
# OR
jupyter notebook

# 4. Work on your notebooks...

# 5. When done, stop Jupyter (Ctrl+C) and deactivate
deactivate
```

### Essential Commands

| Task | Command |
|------|---------|
| Create virtual environment | `python -m venv env_name` |
| Activate (Windows) | `env_name\Scripts\activate` |
| Activate (macOS/Linux) | `source env_name/bin/activate` |
| Deactivate | `deactivate` |
| Install package | `pip install package_name` |
| Start Jupyter Notebook | `jupyter notebook` |
| Start JupyterLab | `jupyter lab` |
| Stop Jupyter | `Ctrl + C` |
| List installed packages | `pip list` |
| Save requirements | `pip freeze > requirements.txt` |
| Install from requirements | `pip install -r requirements.txt` |

### Jupyter Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `Shift + Enter` | Run cell and move to next |
| `Ctrl + Enter` | Run cell and stay |
| `Esc` | Enter command mode |
| `Enter` | Enter edit mode |
| `A` (command mode) | Insert cell above |
| `B` (command mode) | Insert cell below |
| `DD` (command mode) | Delete cell |
| `M` (command mode) | Change to Markdown |
| `Y` (command mode) | Change to Code |
| `Ctrl + S` | Save notebook |

---

## 🎉 You're Ready!

You now have a fully functional Jupyter environment for data science. 

**Next Steps:**
1. Download the `data_science_tour.ipynb` notebook
2. Place it in your project folder
3. Open it in Jupyter
4. Start exploring!

---

*Happy coding! 🐍📊*
