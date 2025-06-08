-- [[ Options ]]
require('core.config.options')

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
require('core.config.keymaps')

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
require('core.config.autocmds')

-- [[ Install `lazy.nvim` plugin manager ]]
require("core.config.lazy")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
