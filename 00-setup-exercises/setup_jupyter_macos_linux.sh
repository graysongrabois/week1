#!/bin/bash
# ============================================================
# Jupyter Data Science Environment Setup Script for macOS/Linux
# ============================================================
# Usage: chmod +x setup_jupyter.sh && ./setup_jupyter.sh
# ============================================================

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo ""
echo "============================================================"
echo -e "${BLUE}   Jupyter Data Science Environment Setup${NC}"
echo "============================================================"
echo ""

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macOS"
    PYTHON_CMD="python3"
    PIP_CMD="pip3"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="Linux"
    PYTHON_CMD="python3"
    PIP_CMD="pip3"
else
    echo -e "${RED}[ERROR] Unsupported operating system: $OSTYPE${NC}"
    exit 1
fi

echo -e "${GREEN}[INFO]${NC} Detected OS: $OS"
echo ""

# Check if Python is installed
if ! command -v $PYTHON_CMD &> /dev/null; then
    echo -e "${RED}[ERROR] Python 3 is not installed!${NC}"
    echo ""
    if [[ "$OS" == "macOS" ]]; then
        echo "Install Python using Homebrew:"
        echo "  brew install python"
        echo ""
        echo "Or download from: https://www.python.org/downloads/"
    else
        echo "Install Python using your package manager:"
        echo "  Ubuntu/Debian: sudo apt install python3 python3-pip python3-venv"
        echo "  Fedora/RHEL:   sudo dnf install python3 python3-pip"
    fi
    exit 1
fi

echo -e "${GREEN}[OK]${NC} Python found: $($PYTHON_CMD --version)"
echo ""

# Check for venv module
if ! $PYTHON_CMD -m venv --help &> /dev/null; then
    echo -e "${RED}[ERROR] Python venv module not found!${NC}"
    echo ""
    if [[ "$OS" == "Linux" ]]; then
        echo "Install venv module:"
        echo "  Ubuntu/Debian: sudo apt install python3-venv"
    fi
    exit 1
fi

# Set project directory
PROJECT_DIR="$HOME/data_science_projects"
ENV_NAME="jupyter_env"

echo -e "${GREEN}[INFO]${NC} Creating project directory: $PROJECT_DIR"
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"
echo ""

# Create virtual environment
echo -e "${GREEN}[INFO]${NC} Creating virtual environment: $ENV_NAME"
if [ -d "$ENV_NAME" ]; then
    echo -e "${YELLOW}[WARN]${NC} Virtual environment already exists. Skipping creation."
else
    $PYTHON_CMD -m venv "$ENV_NAME"
fi
echo ""

# Activate virtual environment
echo -e "${GREEN}[INFO]${NC} Activating virtual environment..."
source "$ENV_NAME/bin/activate"
echo ""

# Upgrade pip
echo -e "${GREEN}[INFO]${NC} Upgrading pip..."
pip install --upgrade pip
echo ""

# Install Jupyter and data science libraries
echo -e "${GREEN}[INFO]${NC} Installing JupyterLab..."
pip install jupyterlab notebook
echo ""

echo -e "${GREEN}[INFO]${NC} Installing data science libraries..."
pip install pandas numpy matplotlib seaborn scipy scikit-learn openpyxl
echo ""

# Save requirements
echo -e "${GREEN}[INFO]${NC} Saving requirements.txt..."
pip freeze > requirements.txt
echo ""

# Create a startup script
echo -e "${GREEN}[INFO]${NC} Creating quick-start script..."
cat > start_jupyter.sh << 'EOF'
#!/bin/bash
cd "$(dirname "$0")"
source jupyter_env/bin/activate
echo ""
echo "============================================================"
echo "   Jupyter Environment Ready!"
echo "============================================================"
echo ""
echo "Starting JupyterLab..."
echo "Press Ctrl+C to stop the server when done."
echo ""
jupyter lab
EOF

chmod +x start_jupyter.sh

# Create an alias suggestion
SHELL_CONFIG=""
if [ -f "$HOME/.zshrc" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
elif [ -f "$HOME/.bashrc" ]; then
    SHELL_CONFIG="$HOME/.bashrc"
fi

echo ""
echo "============================================================"
echo -e "${GREEN}   SETUP COMPLETE!${NC}"
echo "============================================================"
echo ""
echo "Your Jupyter environment is ready at:"
echo "  $PROJECT_DIR"
echo ""
echo "To start Jupyter in the future:"
echo ""
echo "  Option 1: Run the startup script"
echo "    $PROJECT_DIR/start_jupyter.sh"
echo ""
echo "  Option 2: Manual activation"
echo "    cd $PROJECT_DIR"
echo "    source $ENV_NAME/bin/activate"
echo "    jupyter lab"
echo ""

if [ -n "$SHELL_CONFIG" ]; then
    echo "  Option 3: Add an alias (paste this in $SHELL_CONFIG):"
    echo "    alias jupyter-ds='cd $PROJECT_DIR && source $ENV_NAME/bin/activate && jupyter lab'"
    echo ""
fi

echo "============================================================"
echo ""

# Ask to launch
read -p "Would you like to launch Jupyter now? (y/n): " LAUNCH
if [[ "$LAUNCH" =~ ^[Yy]$ ]]; then
    echo ""
    echo "Starting JupyterLab..."
    jupyter lab
fi
