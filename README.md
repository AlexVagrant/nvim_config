# Neovim 配置

适用于 Neovim 0.12+ 的个人配置文件。

## 环境依赖

| 依赖 | 用途 | 安装 |
|------|------|------|
| **Neovim ≥ 0.10** | 编辑器 | `brew install neovim` |
| **Node.js + yarn** | coc.nvim / markdown-preview | `brew install node yarn` |
| **universal-ctags** | tagbar / vista 符号跳转 | `brew install universal-ctags` |
| **fzf** | 模糊搜索 | `brew install fzf` |
| **ripgrep (rg)** | Telescope 全文搜索 | `brew install ripgrep` |

## 快速开始

```bash
# 1. 克隆配置
git clone https://github.com/AlexVagrant/dotfile.git ~/.config/nvim

# 2. 安装 vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 3. 安装所有插件
nvim +PlugInstall +qall

# 4. 安装 coc.nvim 扩展
nvim +'CocInstall -sync coc-tsserver coc-json coc-html coc-css' +qall
```

## 插件管理

```bash
nvim +PlugInstall +qall   # 安装新插件
nvim +PlugUpdate  +qall   # 更新所有插件
nvim +PlugClean   +qall   # 清理已删除的插件
```

## 插件列表

### 语言支持
- [coc.nvim](https://github.com/neoclide/coc.nvim) — LSP 补全框架
- [coc-tsserver](https://github.com/neoclide/coc-tsserver) — TypeScript/JavaScript 语言服务
- [rust.vim](https://github.com/rust-lang/rust.vim) — Rust 语法支持
- [vim-polyglot](https://github.com/sheerun/vim-polyglot) — 多语言语法高亮
- [typescript-vim](https://github.com/leafgarland/typescript-vim) / [yats.vim](https://github.com/HerringtonDarkholme/yats.vim) — TypeScript 高亮
- [vim-graphql](https://github.com/jparise/vim-graphql) — GraphQL 语法
- [wxapp.vim](https://github.com/chemzqm/wxapp.vim) — 微信小程序语法

### 文件 / 搜索
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) — 模糊查找器
- [fzf.vim](https://github.com/junegunn/fzf.vim) — fzf 集成
- [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim) — 文件搜索
- [ferret](https://github.com/wincent/ferret) — 全局搜索 (Ack)

### Git
- [vim-fugitive](https://github.com/tpope/vim-fugitive) — Git 集成
- [vim-gitgutter](https://github.com/airblade/vim-gitgutter) — 行内 diff 标记
- [gv.vim](https://github.com/junegunn/gv.vim) — Git 提交浏览器

### 导航 / UI
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) — 状态栏
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) — 文件图标
- [tagbar](https://github.com/preservim/tagbar) / [vista.vim](https://github.com/liuchengxu/vista.vim) — 代码结构导航
- [vim-easymotion](https://github.com/easymotion/vim-easymotion) — 快速跳转

### 编辑 / 工具
- [nerdcommenter](https://github.com/preservim/nerdcommenter) — 注释
- [vim-surround](https://github.com/tpope/vim-surround) — 包围符号操作
- [vim-bookmarks](https://github.com/MattesGroeger/vim-bookmarks) — 书签
- [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) — Markdown 预览
- [vimwiki](https://github.com/vimwiki/vimwiki) — 个人 Wiki
- [calendar.vim](https://github.com/itchyny/calendar.vim) — 日历
- [vim-startify](https://github.com/mhinz/vim-startify) — 启动页

### 主题
- [onedark.nvim](https://github.com/navarasu/onedark.nvim)
- [vscode.nvim](https://github.com/Mofiqul/vscode.nvim)
- [vim-monokai-pro](https://github.com/phanviet/vim-monokai-pro)
- [vim-colorschemes](https://github.com/flazz/vim-colorschemes)

## 常用快捷键

| 按键 | 功能 |
|------|------|
| `,` | Leader 键 |
| `<C-p>` | 搜索文件 (CtrlP) |
| `,ff` | Telescope 查找文件 |
| `,fg` | Telescope 全文搜索 |
| `,fb` | Telescope 缓冲区列表 |
| `<C-j/k/h/l>` | 窗口切换 |
| `<S-H/L>` | 标签页切换 |
| `gd` | 跳转到定义 (coc) |
| `gr` | 查找引用 (coc) |
| `,rn` | 重命名符号 (coc) |
| `,tt` | 代码结构 (vista) |
| `,e` | 文件浏览器 (coc-explorer) |
| `,ca` | 日历 |
| `jj` | 退出插入模式 |
| `<C-s>` | Markdown 预览 |
