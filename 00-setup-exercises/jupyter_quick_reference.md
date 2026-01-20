# 📋 Jupyter Quick Reference Card

## Daily Startup Commands

### Windows (Command Prompt)
```cmd
cd %USERPROFILE%\data_science_projects
jupyter_env\Scripts\activate
jupyter lab
```

### macOS / Linux
```bash
cd ~/data_science_projects
source jupyter_env/bin/activate
jupyter lab
```

---

## Essential Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `Shift + Enter` | Run cell, move to next |
| `Ctrl + Enter` | Run cell, stay in place |
| `Esc` | Command mode |
| `Enter` | Edit mode |
| `A` | Insert cell above (command mode) |
| `B` | Insert cell below (command mode) |
| `DD` | Delete cell (command mode) |
| `M` | Convert to Markdown (command mode) |
| `Y` | Convert to Code (command mode) |
| `Ctrl + S` | Save notebook |
| `Ctrl + Shift + -` | Split cell at cursor |
| `Shift + M` | Merge selected cells |

---

## Common pip Commands

```bash
# Install a package
pip install package_name

# Install multiple packages
pip install pandas numpy matplotlib

# Install specific version
pip install pandas==2.0.0

# Upgrade a package
pip install --upgrade package_name

# Uninstall a package
pip uninstall package_name

# List installed packages
pip list

# Save environment
pip freeze > requirements.txt

# Recreate environment
pip install -r requirements.txt
```

---

## Jupyter Server Commands

```bash
# Start Jupyter Notebook
jupyter notebook

# Start JupyterLab
jupyter lab

# Start on specific port
jupyter lab --port 8889

# Start without opening browser
jupyter lab --no-browser

# List running servers
jupyter server list

# Stop server (in terminal)
Ctrl + C
```

---

## Virtual Environment Commands

### Create
```bash
# Windows
python -m venv env_name

# macOS/Linux
python3 -m venv env_name
```

### Activate
```bash
# Windows (Command Prompt)
env_name\Scripts\activate

# Windows (PowerShell)
env_name\Scripts\Activate.ps1

# macOS/Linux
source env_name/bin/activate
```

### Deactivate
```bash
deactivate
```

---

## Common Data Science Imports

```python
# Data manipulation
import pandas as pd
import numpy as np

# Visualization
import matplotlib.pyplot as plt
import seaborn as sns

# Statistics
from scipy import stats

# Machine learning
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression

# Display settings
pd.set_option('display.max_columns', None)
plt.style.use('seaborn-v0_8-whitegrid')
```

---

## Useful Pandas Operations

```python
# Load data
df = pd.read_csv('file.csv')
df = pd.read_excel('file.xlsx')

# Explore data
df.head()           # First 5 rows
df.tail()           # Last 5 rows
df.shape            # (rows, columns)
df.columns          # Column names
df.dtypes           # Data types
df.describe()       # Statistics
df.info()           # Summary

# Filter data
df[df['column'] > 50]
df[(df['A'] > 10) & (df['B'] < 20)]
df.query('age > 25 and salary < 50000')

# Group and aggregate
df.groupby('category')['value'].mean()
df.groupby(['A', 'B']).agg({'C': 'sum', 'D': 'mean'})

# Handle missing data
df.isnull().sum()
df.dropna()
df.fillna(0)
```

---

## Quick Plotting

```python
# Line plot
plt.plot(x, y)
plt.title('Title')
plt.xlabel('X Label')
plt.ylabel('Y Label')
plt.show()

# Scatter plot
plt.scatter(x, y, c=colors, s=sizes)

# Bar chart
plt.bar(categories, values)

# Histogram
plt.hist(data, bins=20)

# Box plot
plt.boxplot(data)

# Save figure
plt.savefig('plot.png', dpi=150)
```

---

## Troubleshooting Quick Fixes

| Problem | Solution |
|---------|----------|
| "Module not found" | `pip install module_name` |
| "Command not found" | Activate virtual environment first |
| Port in use | `jupyter lab --port 8889` |
| Kernel dies | `pip install --upgrade ipykernel` |
| Permission denied | Don't use `sudo pip`, use venv |

---

## File Paths

| OS | Jupyter Config |
|----|----------------|
| Windows | `C:\Users\NAME\.jupyter\` |
| macOS | `~/.jupyter/` |
| Linux | `~/.jupyter/` |

| OS | Notebook Checkpoints |
|----|---------------------|
| All | `.ipynb_checkpoints/` (in notebook directory) |

---

*Keep this card handy! 🐍📊*
