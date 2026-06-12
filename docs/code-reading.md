# 用 Neovim 阅读大型源码仓库

## 核心原则

阅读大型代码库（如 3000+ 行的单文件）时，不要从头到尾线性阅读。遵循"外向里"的方法：

1. **先理解架构，再读代码** — 读文档、配置文件、入口点
2. **追踪单条数据流** — 从一个输入到输出的完整路径
3. **用动态验证代替静态猜测** — 跑测试、加断点比硬读快得多
4. **用 LSP 导航代替 grep 翻找** — 结构化跳转 vs 文本搜索

## Neovim 快捷键

| 操作 | 按键 | 说明 |
|------|------|------|
| 跳转到定义 | `gd` | 光标放到符号上，跳到定义处 |
| 跳转到声明 | `gD` | 同符号的声明位置（TS 中通常与 gd 一致） |
| 查找所有引用 | `grr` | 显示所有引用位置（0.11+ 内置） |
| 跳转到类型定义 | `grt` | 跳转到 type/interface 定义（0.11+ 内置） |
| 跳转到实现 | `gri` | 跳转到接口的具体实现（0.11+ 内置） |
| 悬浮查看签名/文档 | `K` | 无需跳转，悬浮窗查看 |
| 重命名符号 | `grn` | 项目范围重命名（0.11+ 内置） |
| 代码操作 | `gra` | 快速修复、import 排序等（0.11+ 内置） |
| 文档符号 | `gO` | 当前文件大纲（0.11+ 内置） |
| Telescope 文件查找 | `,ff` | 按文件名查找项目文件 |
| Telescope 全局搜索 | `,fg` | 全文搜索（类似 `rg`） |
| Telescope 搜索光标下单词 | `,sw` | 全项目搜索光标所在词 |
| Telescope 在当前文件搜索 | `,/` | 在当前缓冲区模糊查找 |
| Telescope 诊断搜索 | `,sd` | 全项目诊断信息搜索 |

## 实操流程：追踪一条数据流

以追踪 pi 中"用户发消息后发生了什么"为例：

### 步骤 1：找到入口

用 `,ff` 打开 `packages/coding-agent/src/core/sdk.ts`。

搜索 `sendMessage`（`/` 然后输入），找到函数定义。

### 步骤 2：逐层下钻

`sdk.ts` 中 `sendMessage` 调用了 `session.prompt(...)`，光标放到 `prompt` 上按 `gd`。

进入 `agent-session.ts`，按 `gO` 看文件大纲，找到 `prompt` 方法。

### 步骤 3：跟数据流，不是跟控制流

在 `prompt` 方法中，看它调用了哪些方法——按 `gd` 跳过去，读完后再 `Ctrl-O` 跳回。不要读方法内部的所有分支逻辑，只读与当前数据流相关的路径。

关键调用链：
```
prompt()
  → _runAgentLoop()
    → agent.run()
    → streamFn() [gd 跳到 streamSimple]
    → 事件 emit (搜索 type: "stream_end" 找消费方)
```

### 步骤 4：用测试验证假设

读源码形成的理解可能是错的。找到对应的测试文件并运行：

```bash
cd packages/coding-agent
node ../../node_modules/vitest/dist/cli.js --run test/agent-session-compaction.test.ts
```

### 步骤 5：读小文件，破大文件

不要上来就读 `agent-session.ts`（3120 行）。建议阅读顺序：

1. `packages/coding-agent/docs/sdk.md` — 10 分钟理解概念
2. `packages/coding-agent/examples/sdk/01-minimal.ts` — 5 分钟看最小示例
3. `packages/coding-agent/src/core/sdk.ts` — 432 行薄层
4. `packages/coding-agent/src/core/auth-storage.ts` — 531 行
5. `packages/coding-agent/src/core/model-registry.ts` — 1033 行
6. 最后读 `packages/coding-agent/src/core/agent-session.ts`

每读一个文件，用 `gO` 先看结构，用 `gd` 在文件间跳转。

## 进阶技巧

### 用 `<C-O>` 和 `<C-I>` 跳跃

- `Ctrl-O` — 回到上一个位置（相当于浏览器的"后退"）
- `Ctrl-I` — 前进到下一个位置（"前进"）
- `:jumps` — 查看完整跳转历史

读源码时你经常需要"跳过去看一眼，再跳回来"——`gd` 跳过去，读完后 `Ctrl-O` 回来继续。

### 用 `,sw` 快速查符号引用

光标放到一个函数名或类型上，按 `,sw`，Telescope 显示全项目所有出现位置。比 `grr` 快的地方是它是纯文本匹配，不需要 LSP 解析——适合快速浏览。

### marks 记住关键位置

```vim
ma   " 在当前行设 mark a（小写字母 = 文件内，大写 = 跨文件）
'a   " 跳到 mark a 的行
``   " 跳到上一个跳转前的位置（和 Ctrl-O 类似但更精确）
```

## 相关工具

- [ripgrep](https://github.com/BurntSushi/ripgrep) — Telescope live_grep 的底层引擎
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) — 语法高亮和结构化文本对象
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) — 模糊查找器
