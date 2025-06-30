
return {
  'xeluxee/competitest.nvim',
  dependencies = 'MunifTanjim/nui.nvim',
  config = function ()
    require('competitest').setup({
      compile_command = {
        cpp       = { exec = 'g++',           args = {'-std=c++20', '$(FNAME)', '-o', '$(FNOEXT)'} },
        some_lang = { exec = 'some_compiler', args = {'$(FNAME)'} },
      },
      run_command = {
        cpp       = { exec = './$(FNOEXT)' },
        some_lang = { exec = 'some_interpreter', args = {'$(FNAME)'} },
      },
    })

    local keymap = vim.keymap
    local opts = { noremap=true, silent=true }
    local api = vim.api

    function Delete()
        api.nvim_command(':! rm -f ./%< && rm -f ./%<_*.txt')
        require("notify")("󰆴 Test Samples Delete completed")
    end

    api.nvim_create_autocmd(
      "FileType",
      {
        pattern = "cpp",
        callback = function()
          keymap.set('n', 'rr', ':CompetiTestRun<CR>', opts)
          keymap.set('n', 'ra', ':CompetiTestAdd<CR>', opts)
          keymap.set('n', 're', ':CompetiTestEdit<CR>', opts)
          keymap.set('n', 'ri', ':CompetiTestReceive testcases<CR>', opts)
          keymap.set('n', 'rd', ':CompetiTestDelete<CR>', opts)
          keymap.set('n', 'rm', Delete, opts)
        end
      }
    )
  end
}
