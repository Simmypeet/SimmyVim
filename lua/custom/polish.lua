vim.opt.guifont = "Iosevka Nerd Font:h12"

-- setup must be called before loading
vim.cmd("colorscheme catppuccin")

if vim.g.neovide then
    vim.g.neovide_fullscreen = true
end
