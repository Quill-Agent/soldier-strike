#!/usr/bin/env bash
# Downloads the binary game assets (pixel-art textures, SFX, music, three.js)
# and unpacks them into public/ — run once after cloning.
set -e
cd "$(dirname "$0")"
curl -L -o /tmp/soldier-strike-assets.zip "https://d2ol7oe51mr4n9.cloudfront.net/user_3GEeqy4X8bGhvossH45YMdlgtZe/864d4e24-0fb9-4b66-83d7-b24fc2bc9ad4.zip"
unzip -o /tmp/soldier-strike-assets.zip -d public/
rm /tmp/soldier-strike-assets.zip
echo "Assets installed. Run: cd public && python3 -m http.server 8080"