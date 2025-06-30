
return {
  "iamcco/markdown-preview.nvim",
  config = function()
    vim.fn["mkdp#util#install"]()
    local map = vim.api.nvim_set_keymap
    local opt = { noremap = true, silent = true }
    map("n", '<Leader>mp', '<Plug>MarkdownPreview', opt)
    map("n", '<Leader>ms', '<Plug>MarkdownPreviewStop', opt)
    map("n", '<Leader>mt', '<Plug>MarkdownPreviewToggle', opt)
  end,
}
