-- Fuzzy Finder (files, lsp, etc)
-- https://github.com/nvim-telescope/telescope.nvim

return {
    {
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope",
        version = false,
        event = 'VimEnter',
        dependencies = {
            -- The `telescope-fzf-native.nvim` plugin is an extension for Telescope that
            -- provides a more powerful fuzzy finding algorithm. It improves the speed
            -- and accuracy of searching through files, buffers, and other items in Telescope.
            { -- If encountering errors, see telescope-fzf-native README for installation instructions
                'nvim-telescope/telescope-fzf-native.nvim',

                -- `build` is used to run some command when the plugin is installed/updated.
                -- This is only run then, not every time Neovim starts up.
                build = 'make',

                -- `cond` is a condition used to determine whether this plugin should be
                -- installed and loaded.
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
            -- The `telescope-ui-select.nvim` plugin is an extension for Telescope that
            -- provides a better UI for selecting items in Telescope. It replaces the
            -- default selection UI with a more user-friendly dropdown menu.
            { 'nvim-telescope/telescope-ui-select.nvim' },
            -- The `telescope-file-browser.nvim` plugin is an extension for Telescope that
            -- allows you to browse files and directories within Telescope. It provides a
            -- file explorer-like interface.
            { 'nvim-telescope/telescope-file-browser.nvim' },
            -- Useful for getting pretty icons, but requires a Nerd Font.
            { 'nvim-tree/nvim-web-devicons' },
        },
        config = function()
            -- Telescope is a fuzzy finder that comes with a lot of different things that
            -- it can fuzzy find! It's more than just a "file finder", it can search
            -- many different aspects of Neovim, your workspace, LSP, and more!
            --
            -- The easiest way to use Telescope, is to start by doing something like:
            --  :Telescope help_tags
            --
            -- After running this command, a window will open up and you're able to
            -- type in the prompt window. You'll see a list of `help_tags` options and
            -- a corresponding preview of the help.
            --
            -- Two important keymaps to use while in Telescope are:
            --  - Insert mode: <c-/>
            --  - Normal mode: ?
            --
            -- This opens a window that shows you all of the keymaps for the current
            -- Telescope picker. This is really useful to discover what Telescope can
            -- do as well as how to actually do it!

            -- [[ Configure Telescope ]]
            -- See `:help telescope` and `:help telescope.setup()`
            require('telescope').setup {
                -- You can put your default mappings / updates / etc. in here
                --  All the info you're looking for is in `:help telescope.setup()`
                --
                defaults = {
                    mappings = {
                        i = { ['<c-enter>'] = 'to_fuzzy_refine' },
                    },
                },
                pickers = {},
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown(),
                    },
                },
            }

            -- Enable Telescope extensions if they are installed
            -- The `fzf` extension is used to provide a more powerful fuzzy finding
            -- algorithm. It improves the speed and accuracy of searching through files,
            -- buffers, and other items in Telescope.
            -- It requires the `telescope-fzf-native.nvim` plugin to be installed.
            local ok, _ = pcall(require('telescope').load_extension, 'fzf')
            if not ok then
                vim.notify("Failed to load telescope fzf extension", vim.log.levels.WARN)
            end
            -- The `ui-select` extension is used to provide a better UI for selecting items
            -- in Telescope. It replaces the default selection UI with a more user-friendly
            -- dropdown menu.
            local ok, _ = pcall(require('telescope').load_extension, 'ui-select')
            if not ok then
                vim.notify("Failed to load telescope ui-select extension", vim.log.levels.WARN)
            end
            -- The `file_browser` extension allows you to browse files and directories
            -- within Telescope. It provides a file explorer-like interface.
            local ok, _ = pcall(require('telescope').load_extension, 'file_browser')
            if not ok then
                vim.notify("Failed to load telescope file_browser extension", vim.log.levels.WARN)
            end

            -- See `:help telescope.builtin`
            local builtin = require 'telescope.builtin'
            vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
            vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
            vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
            vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
            vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
            vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
            vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
            vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
            vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
            vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

            -- Slightly advanced example of overriding default behavior and theme
            vim.keymap.set('n', '<leader>/', function()
                -- You can pass additional configuration to Telescope to change the theme, layout, etc.
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end, { desc = '[/] Fuzzily search in current buffer' })

            -- It's also possible to pass additional configuration options.
            --  See `:help telescope.builtin.live_grep()` for information about particular keys
            vim.keymap.set('n', '<leader>s/', function()
                builtin.live_grep {
                    grep_open_files = true,
                    prompt_title = 'Live Grep in Open Files',
                }
            end, { desc = '[S]earch [/] in Open Files' })

            -- Shortcut for searching your Neovim configuration files
            vim.keymap.set('n', '<leader>sn', function()
                builtin.find_files { cwd = vim.fn.stdpath 'config' }
            end, { desc = '[S]earch [N]eovim files' })
        end,
    },
    {
        'nvim-telescope/telescope-file-browser.nvim',
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require('telescope').load_extension 'file_browser'
            vim.keymap.set('n', '<leader>fb', '<cmd>Telescope file_browser<cr>', { desc = '[F]ile [B]rowser' })
        end,
    },
}
