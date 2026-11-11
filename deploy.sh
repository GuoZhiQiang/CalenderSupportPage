#!/bin/bash
# Run on the Aliyun server (cookzq.top) as root, e.g. from Workbench:
#   curl -fsSL https://guozhiqiang.github.io/CalenderSupportPage/deploy.sh | bash
set -u

G=https://guozhiqiang.github.io
ROOT=/usr/share/nginx/html

if ! command -v nginx >/dev/null; then
  dnf install -y nginx
fi
systemctl enable --now nginx

cd "$ROOT" || exit 1
fail=0
get() { curl -fsSL -m 30 -o "$1" "$2" || { echo "FAILED: $2"; fail=1; }; }

get index.html   $G/CalenderSupportPage/index.html
get privacy.html $G/CalenderSupportPage/privacy.html

mkdir -p timetravel/en
for f in index.html privacy.html style.css en/index.html en/privacy.html; do
  get timetravel/$f $G/timetravel/$f
done

echo "ICP footer: $(grep -c 'ICP备' index.html) (expect 1)"
echo "/           $(curl -sI http://localhost/ | head -1)"
echo "/timetravel $(curl -sI http://localhost/timetravel/ | head -1)"
[ $fail -eq 0 ] && echo "Deploy OK" || echo "Deploy finished with failures"
