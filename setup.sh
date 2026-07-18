#!/usr/bin/env bash
# Downloads the COMPLETE Soldier Strike game (all source code + binary assets)
# and unpacks it into this folder. Run once after cloning.
set -e
cd "$(dirname "$0")"
curl -L -o /tmp/soldier-strike-full.zip "https://d2ol7oe51mr4n9.cloudfront.net/user_3GEeqy4X8bGhvossH45YMdlgtZe/b0638f4c-f8a5-4db7-81d5-edd3d97de0f5.zip"
unzip -o /tmp/soldier-strike-full.zip -d .
rm /tmp/soldier-strike-full.zip
echo "Full game unpacked: server.js, public/, tools/, design/"
echo "Play the client locally: cd public && python3 -m http.server 8080"
echo "To publish the source into this git repo: git add -A && git commit -m 'full source' && git push"