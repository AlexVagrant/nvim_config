# Neovim 配置

此仓库包含我的个人 Neovim 配置，旨在提供现代化且高效的开发工作流程。

## 功能特性

- **插件管理**: 使用 `lazy.nvim` 进行快速简便的插件管理。
- **LSP 支持**: 配置了语言服务器协议 (LSP)，提供智能代码补全、诊断等功能。
- **Treesitter**: 增强的语法高亮和结构化文本编辑。
- **Lualine**: 快速且高度可定制的状态栏。
- **NvimTree**: Neovim 的文件浏览器。
- **Git 集成**: 使用 `gitsigns.nvim` 进行 Git 集成。
- **Colorizer**: 在代码中高亮显示颜色。
- **Comment.nvim**: 轻松注释和取消注释代码。
- **Telescope**: 高度可扩展的模糊查找器。
- **主题**: 包含多种主题，如 Catppuccin、TokyoNight、Monokai 等。

## 用 Neovim 阅读源码

使用 LSP 导航、Telescope 搜索和数据流追踪等方法高效阅读大型代码库，详见 [docs/code-reading.md](docs/code-reading.md)。

## 前置条件

在安装此配置之前，请确保您已安装以下软件：

- **Neovim**: 推荐使用 0.9.0 或更高版本。您可以通过 macOS 上的 Homebrew 进行安装：
  ```bash
  brew install neovim
  ```
  对于其他操作系统，请参考 [Neovim 官方安装指南](https://github.com/neovim/neovim/wiki/Installing-Neovim)。
- **Git**: 克隆仓库和管理插件所需。

## 安装

要安装此 Neovim 配置，请按照以下步骤操作：

1.  **备份您现有的 Neovim 配置（可选但强烈建议）**：
    如果您有现有的 Neovim 配置，最好对其进行备份。安装脚本将尝试自动执行此操作，但您也可以手动备份：
    ```bash
    mv ~/.config/nvim ~/.config/nvim_backup
    ```

2.  **克隆此仓库**：
    导航到您的 `.config` 目录并克隆此仓库：
    ```bash
    cd ~/.config
    git clone https://github.com/your_username/your_nvim_config_repo.git nvim
    ```
    **注意**：请将 `https://github.com/your_username/your_nvim_config_repo.git` 替换为您 Neovim 配置仓库的实际 URL。

3.  **运行安装脚本**：
    此仓库包含一个安装脚本，它将处理 `lazy.nvim` 和所有插件的安装。
    ```bash
    cd ~/.config/nvim
    chmod +x setup_nvim_config.sh
    ./setup_nvim_config.sh
    ```

    该脚本将：
    -   备份您当前的 `~/.config/nvim` 目录（如果存在）。
    -   如果 `lazy.nvim` 尚未安装，则会安装它。
    -   以无头模式启动 Neovim，以安装和同步所有插件。

4.  **启动 Neovim**：
    脚本完成后，您可以启动 Neovim：
    ```bash
    nvim
    ```
    首次打开 Neovim 时，`lazy.nvim` 将自动安装任何缺失的插件。

## 更新插件

要更新所有已安装的插件，请打开 Neovim 并运行以下命令：

```vim
:Lazy sync
```

## 自定义

-   **键绑定**: 在 `lua/keybinding.lua` 中自定义键绑定。
-   **插件**: 在 `lua/lazy_conf.lua` 和 `lua/plugins/` 中添加或删除插件。
-   **主题**: 通过修改 `init.lua` 中的 `colorscheme` 设置或在 `lua/plugins/` 中配置您的主题插件来更改配色方案。

## 故障排除

-   如果您遇到插件无法加载或错误，请尝试在 Neovim 中运行 `:checkhealth` 以获取设置报告。
-   确保您拥有最新版本的 Neovim 和 Git。
-   如果您已备份旧配置，可以通过删除新的 `nvim` 目录并将其备份重命名回 `nvim` 来恢复它。

欢迎探索配置文件，了解所有设置方式并根据您的喜好进行自定义。
