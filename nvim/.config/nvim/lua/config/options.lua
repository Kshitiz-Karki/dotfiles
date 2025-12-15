-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Automatically wrap text after 80 characters (https://chatgpt.com/c/68ecfa1b-7320-8323-9b00-3d60171dcf3c)
vim.opt.textwidth = 80 -- Auto-wrap at 80 chars when typing
vim.opt.wrap = true -- Enable wrapping of long lines
vim.opt.linebreak = true -- Wrap at word boundaries, not in the middle of a word
vim.opt.formatoptions:append({ "t" }) -- Auto-wrap text when typing in insert mode
