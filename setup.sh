#!/usr/bin/env bash
# Downloads the COMPLETE Soldier Strike game (all source code + binary assets)
# and unpacks it into this folder. Run once after cloning.
set -e
cd "$(dirname "$0")"
curl -L -o /tmp/soldier-strike-full.zip "https://d2ol7oe51mr4n9.cloudfront.net/user_3GEeqy4X8bGhvossH45YMdlgtZe/9d3e8549-9878-4de7-a278-e7fa7c2e1669.zip"
unzip -o /tmp/soldier-strike-full.zip -d .
rm /tmp/soldier-strike-full.zip
echo "Full game unpacked: server.js, public/, tools/, design/"
echo "Play the client locally: cd public && python3 -m http.server 8080"
echo "To publish the source into this git repo: git add -A && git commit -m 'full source' && git push"