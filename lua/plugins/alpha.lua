
return {
  'goolord/alpha-nvim',
  config = function ()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ",
      }

    dashboard.section.buttons.val = {
        dashboard.button( "f", "  > Find File", ":Telescope find_files<CR>"),
        dashboard.button( "n", "  > New File" , ":ene!<CR>"),
        dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
        dashboard.button( "t", "  > Find Text", ":Telescope live_grep<CR>"),
        dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
        dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
    }

    alpha.setup(dashboard.opts)

    vim.cmd([[
        autocmd FileType alpha setlocal nofoldenable
    ]])
  end
}
