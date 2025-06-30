
return {
  'rcarriga/nvim-notify',
  config = function ()
    local notify = require("notify")
    notify.setup({
        stages = "static",
        on_open = nil,
        on_close = nil,
        timeout = 3000,
        fps = 1,
        render = "default",
        background_colour = "Normal",
        max_width = math.floor(vim.api.nvim_win_get_width(0) / 2),
        max_height = math.floor(vim.api.nvim_win_get_height(0) / 4),
        level = "TRACE",
    })
    vim.notify = notify
  end
}
