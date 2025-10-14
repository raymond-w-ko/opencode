#!/bin/bash -ex
git clean -fxd
bun install
cd packages/opencode
bun run build

# Detect OS and copy appropriate binary
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    cp dist/opencode-linux-x64/bin/opencode $HOME/bin/opencode
elif [[ "$OSTYPE" == "darwin"* ]]; then
    cp dist/opencode-darwin-arm64/bin/opencode $HOME/bin/opencode
else
    echo "Unsupported OS: $OSTYPE"
    exit 1
fi

