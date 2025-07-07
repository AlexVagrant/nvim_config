return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = {
      'nvim-lua/plenary.nvim',
      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      local status, telescope = pcall(require, "telescope")
      if not status then
        vim.notify("没有找到 telescope")
        return
      end

      local previewers = require("telescope.previewers")
      local Job = require("plenary.job")
      local new_maker = function(filepath, bufnr, opts)
        filepath = vim.fn.expand(filepath)
        Job:new({
          command = "file",
          args = { "--mime-type", "-b", filepath },
          on_exit = function(j)
            local mime_type = vim.split(j:result()[1], "/")[1]
            if mime_type == "text" then
              previewers.buffer_previewer_maker(filepath, bufnr, opts)
            else
              -- maybe we want to write something to the buffer here
              vim.schedule(function()
                vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
              end)
            end
          end
        }):sync()
      end

      local actions = require("telescope.actions")
      telescope.setup({
        defaults = {
          initial_mode = "insert",
          layout_config = {
            center = {
              width = 0.98,
              preview_cutoff = 1
            }
          },
          mappings = {
            i = {
              ['<C-j>'] = 'move_selection_next',
              ['<C-k>'] = 'move_selection_previous',
              ['<C-n>'] = 'move_selection_next',
              ['<C-p>'] = 'move_selection_previous',
              ['<Down>'] = 'cycle_history_next',
              ['<Up>'] = 'cycle_history_prev',
              ['<C-c>'] = 'close',
              ['<C-u>'] = 'preview_scrolling_up',
              ['<C-d>'] = 'preview_scrolling_down',
            },
          }
        },
        pickers = {
          find_files = {
            preview = true,
          },
          live_grep = {
            theme = "ivy",
            preview = true,
          }
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })

      pcall(telescope.load_extension, "live_grep_args")
      pcall(telescope.load_extension, "ui-select")

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = '查找文件'})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = '全局搜索'})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = '查找缓冲区'})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = '查找帮助'})
      vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '查找最近文件' })
      vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '查找缓冲区' })
      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '在当前文件搜索' })

      local function telescope_live_grep_open_files()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end
      vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '在打开的文件中搜索' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = 'Telescope 内置功能' })
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '搜索帮助' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '搜索光标下单词' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '搜索诊断信息' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '恢复上次搜索' })
    end
  },
  { "nvim-telescope/telescope-live-grep-raw.nvim" },
  { "LinArcX/telescope-env.nvim" },
  { "nvim-telescope/telescope-rg.nvim" },
  { "nvim-telescope/telescope-dap.nvim" },
}