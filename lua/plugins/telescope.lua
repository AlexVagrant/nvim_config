
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
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      local function telescope_live_grep_open_files()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end
      vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
    end
  },
  { "nvim-telescope/telescope-live-grep-raw.nvim" },
  { "LinArcX/telescope-env.nvim" },
  { "nvim-telescope/telescope-rg.nvim" },
  { "nvim-telescope/telescope-dap.nvim" },
}
