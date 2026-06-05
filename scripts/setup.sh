#!/usr/bin/env bash
# Neovim 配置的系统依赖安装脚本
# 用法: bash scripts/setup.sh
set -euo pipefail

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; NC='\033[0m'

echo -e "${GREEN}==> 检查系统依赖...${NC}\n"

OS="$(uname -s)"
NEED_INSTALL=()
NEED_XCODE=false

# 按平台定义检查和安装命令
check() {
  local bin="$1" pkg_mac="$2" pkg_apt="$3"
  if command -v "$bin" &>/dev/null; then
    echo -e "  ${GREEN}✓${NC} $bin"
  else
    echo -e "  ${RED}✗${NC} $bin — 缺失"
    if [ "$OS" = "Darwin" ]; then
      NEED_INSTALL+=("$pkg_mac")
    else
      NEED_INSTALL+=("$pkg_apt")
    fi
  fi
}

check tree-sitter  tree-sitter-cli  tree-sitter-cli
check rg          ripgrep          ripgrep
check fd          fd               fd-find
check lazygit     lazygit          lazygit
check trash       trash            trash-cli
check curl        curl             curl
check tar         tar              tar
check cc          cc               build-essential

# macOS Xcode CLI tools
if [ "$OS" = "Darwin" ] && ! xcode-select -p &>/dev/null; then
  NEED_XCODE=true
  echo -e "  ${YELLOW}!${NC} Xcode CLI 工具未安装"
fi

echo ""

if [ ${#NEED_INSTALL[@]} -eq 0 ] && [ "$NEED_XCODE" = false ]; then
  echo -e "${GREEN}所有依赖已就绪。${NC}"
  exit 0
fi

# 安装
echo -e "${YELLOW}缺失 ${#NEED_INSTALL[@]} 项依赖，开始安装...${NC}\n"

if [ "$OS" = "Darwin" ]; then
  $NEED_XCODE && xcode-select --install 2>/dev/null || true
  for pkg in "${NEED_INSTALL[@]}"; do
    echo "  brew install $pkg"
    brew install "$pkg"
  done
else
  sudo apt update
  for pkg in "${NEED_INSTALL[@]}"; do
    echo "  sudo apt install -y $pkg"
    sudo apt install -y "$pkg"
  done
fi

echo -e "\n${GREEN}完成！可以启动 Neovim 了。${NC}"
