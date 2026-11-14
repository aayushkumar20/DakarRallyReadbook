#!/usr/bin/env bash
# ==============================================================================
# Setup GitHub Actions Self-Hosted Runner on macOS for Huawei HarmonyOS Builds
# Dakar Rally Digital Roadbook & ERTF Unik4 Telemetry
# ==============================================================================

set -e

REPO_URL="https://github.com/aayushkumar20/DakarRallyReadbook"
RUNNER_DIR="$HOME/actions-runner"
RUNNER_VERSION="2.321.0"
ARCH=$(uname -m)

echo "=========================================================="
echo " Dakar Rally - GitHub Self-Hosted macOS Runner Setup"
echo " Target Repository: $REPO_URL"
echo " Architecture:      $ARCH"
echo "=========================================================="

if [ "$ARCH" = "arm64" ]; then
    RUNNER_ARCH="arm64"
else
    RUNNER_ARCH="x64"
fi

# 1. Verify DevEco Studio installation
if [ ! -d "/Applications/DevEco-Studio.app" ]; then
    echo "⚠️ Warning: DevEco Studio not detected at /Applications/DevEco-Studio.app"
    echo "Please ensure DevEco Studio is installed to build HarmonyOS apps."
else
    echo "✅ DevEco Studio detected at /Applications/DevEco-Studio.app"
fi

# 2. Setup OpenHarmony NPM Registry in user home
echo "Configuring ~/.npmrc for @ohos packages..."
echo "@ohos:registry=https://repo.harmonyos.com/npm/" > ~/.npmrc
echo "strict-ssl=false" >> ~/.npmrc
echo "✅ Configured ~/.npmrc"

# 3. Create runner directory
mkdir -p "$RUNNER_DIR"
cd "$RUNNER_DIR"

# 4. Download GitHub Actions runner if not present
RUNNER_TAR="actions-runner-osx-${RUNNER_ARCH}-${RUNNER_VERSION}.tar.gz"
if [ ! -f "$RUNNER_TAR" ] && [ ! -f "config.sh" ]; then
    echo "Downloading GitHub Actions runner ($RUNNER_ARCH v$RUNNER_VERSION)..."
    curl -o "$RUNNER_TAR" -L "https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/${RUNNER_TAR}"
    echo "Extracting installer..."
    tar xzf "./$RUNNER_TAR"
    rm -f "./$RUNNER_TAR"
    echo "✅ Runner extracted to $RUNNER_DIR"
fi

# 5. Check if runner is already configured
if [ -f ".runner" ]; then
    echo "✅ Runner is already configured in $RUNNER_DIR!"
    echo "To run interactively: ./run.sh"
    echo "To run as service:    ./svc.sh start"
    exit 0
fi

# 6. Prompt for Registration Token
echo ""
echo "----------------------------------------------------------"
echo "To obtain your GitHub Runner Registration Token:"
echo "1. Go to: $REPO_URL/settings/actions/runners/new?arch=$RUNNER_ARCH&os=osx"
echo "2. Copy the token shown after '--token <TOKEN>'"
echo "----------------------------------------------------------"
echo ""

if [ -z "$1" ]; then
    read -rp "Enter your GitHub Runner Registration Token: " RUNNER_TOKEN
else
    RUNNER_TOKEN="$1"
fi

if [ -z "$RUNNER_TOKEN" ]; then
    echo "❌ Error: Token cannot be empty. Run the script again with your token."
    exit 1
fi

# 7. Configure runner
echo "Configuring runner with repository..."
./config.sh --url "$REPO_URL" --token "$RUNNER_TOKEN" --name "macOS-HarmonyOS-Runner" --labels "self-hosted,macOS,$RUNNER_ARCH" --unattended --replace

echo ""
echo "✅ Runner successfully registered!"
echo ""
echo "To install and run as a persistent macOS background service:"
echo "  cd $RUNNER_DIR"
echo "  ./svc.sh install"
echo "  ./svc.sh start"
echo ""
echo "Or run in foreground for testing:"
echo "  cd $RUNNER_DIR && ./run.sh"
