-- Options are automatically loaded before startup
-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- [[ Setting global variables ]]
-- customizes Neovim's window title when using ghostty
if vim.env.TERM_PROGRAM == "ghostty" then
    vim.opt.title = true
    vim.opt.titlestring = "%{fnamemodify(getcwd(), ':t')}"
end

-- Prepend mise shims to PATH
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

-- LazyVim auto format
vim.g.autoformat = true

-- Root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

-- Set LSP servers to be ignored when used with `util.root.detectors.lsp`
-- for detecting the LSP root
vim.g.root_lsp_ignore = { "copilot" }

-- Hide deprecation warnings
vim.g.deprecation_warnings = false

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Set the python env
vim.g.python3_host_prog = '/Users/dallas.goldswain/.local/share/mise/shims/python'

-- Disable Perl
vim.g.loaded_perl_provider = 0

-- gets rid of line with white spaces
vim.g.editorconfig = true

-- [[ Setting options ]]
local opt = vim.opt
-- Make line numbers default
opt.number = true

-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
opt.relativenumber = true

-- Enable auto write
opt.autowrite = true

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
    opt.clipboard = vim.env.SSH_TTY and "" or 'unnamedplus'
end)

opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.expandtab = true -- Use spaces instead of tabs
opt.fillchars = {
    foldopen = "",
    foldclose = "",
    fold = " ",
    foldsep = " ",
    diff = "╱",
    eob = " ",
}
opt.foldlevel = 99
opt.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true                         -- Ignore case
opt.inccommand = "nosplit"                    -- preview incremental substitute
opt.jumpoptions = "view"
opt.laststatus = 3                            -- global statusline
opt.linebreak = true                          -- Wrap lines at convenient points
opt.pumblend = 10                             -- Popup blend
opt.pumheight = 10                            -- Maximum number of entries in a popup
opt.ruler = false                             -- Disable the default ruler
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true                         -- Round indent
opt.shiftwidth = 2                            -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.smartindent = true                        -- Insert indents automatically
opt.spelllang = { "en" }
opt.tabstop = 2                               -- Number of spaces tabs count for
opt.termguicolors = true                      -- True color support
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
opt.virtualedit = "block"                     -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full"            -- Command-line completion mode
opt.winminwidth = 5                           -- Minimum window width
opt.wrap = false                              -- Disable line wrap
opt.smoothscroll = true
opt.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
opt.foldmethod = "expr"
opt.foldtext = ""
opt.isfname:append("@-@")
opt.hlsearch = true
-- Redrawing and cursor enhancements
opt.lazyredraw = false
opt.cursorline = true
opt.cursorcolumn = true
opt.cursorlineopt = "number,line"

-- Show line under cursor
opt.cursorline = true

-- backspace
opt.backspace = { "start", "eol", "indent" }

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true
opt.undolevels = 10000

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
opt.signcolumn = 'yes'

-- Decrease update time
opt.updatetime = 50

-- Decrease mapped sequence wait time
opt.timeoutlen = 300

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true
opt.splitkeep = "screen"

-- Sets how neovim will display certain whitespace characters in the editor.
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
opt.inccommand = 'split'

-- Show which line your cursor is on
opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10
opt.sidescrolloff = 8 -- Columns of context

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
opt.confirm = true

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
