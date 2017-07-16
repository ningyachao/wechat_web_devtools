#! /bin/bash
# install desktop

echo '安装 桌面图标'

root_dir=$(cd `dirname $0`/.. && pwd -P)
dist_dir="$HOME/.wechat_dev_tools"

sed -r -e 's/\/path\/to/'${root_dir//\//\\\/}'/g' "$root_dir/desktop.simple" > "$dist_dir/wechat_dev_tools.desktop"

if type desktop-file-install >/dev/null 2>&1; then
  desktop-file-install "$dist_dir/wechat_dev_tools.desktop" --dir=$HOME/.local/share/applications
else
  echo 'no exists desktop-file-install'
  if [ -d "$HOME/.local/share/applications" ]; then
    cp "$dist_dir/wechat_dev_tools.desktop" $HOME/.local/share/applications/
  fi
fi

echo '安装 桌面图标 ok'