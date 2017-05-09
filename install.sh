#!/bin/bash

set -e

if [ $UID != "0" ]; then
    echo "Must be run as root" >&2
    exit 1
fi

# Compute the install directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

set -x
DIR="$DIR"
PLIST="/Library/LaunchDaemons/com.mozilla.status-bot.plist"
{ set +x; } 2> /dev/null

# Create the plist in /Library/LaunchDaemons/
cat > "$PLIST" << EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.mozilla.status-bot</string>
    <key>ProgramArguments</key>
    <array>
        <string>$DIR/target/release/status-bot</string>
    </array>
    <key>KeepAlive</key>
    <true/>
    <key>UserName</key>
    <string>root</string>
</dict>
</plist>
EOF

set -x
launchctl load "$PLIST"
{ set +x; } 2> /dev/null

echo "done"
