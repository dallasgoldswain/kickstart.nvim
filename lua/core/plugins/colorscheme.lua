-- This module defines the configuration for the Catppuccin color scheme plugin in Neovim.
-- https://github.com/catppuccin/nvim
return {
    {
        -- Plugin for the Catppuccin color scheme
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,                       -- Load this plugin immediately
        priority = 1000,                    -- Set high priority to load this color scheme first
        opts = {
            transparent_background = false, -- Enable transparent background
            flavour = "mocha",              -- Set the flavor of the color scheme
        },
        integrations = {
            cmp = true,                 -- Enable integration with nvim-cmp
            gitsigns = true,            -- Enable integration with gitsigns
            nvimtree = true,            -- Enable integration with nvim-tree
            treesitter = true,          -- Enable integration with treesitter
            notify = false,             -- Disable integration with nvim-notify
            mini = {
                enabled = true,         -- Enable mini plugin integration
                indentscope_color = "", -- Set indentscope color (empty means default)
            },
            -- Additional plugin integrations can be found in the documentation
            flash = true,
            fzf = true,
            grug_far = true,
            headlines = true,
            illuminate = true,
            leap = true,
            lsp_trouble = true,
            mason = true,
            markdown = true,
            native_lsp = {
                enabled = true,
                underlines = {
                    errors = { "undercurl" },
                    hints = { "undercurl" },
                    warnings = { "undercurl" },
                    information = { "undercurl" },
                },
            },
            navic = { enabled = true, custom_bg = "lualine" },
            neotest = true,
            neotree = true,
            noice = true,
            semantic_tokens = true,
            snacks = true,
            telescope = true,
            treesitter_context = true,
            which_key = true,
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin")
        end,
    },
    { "nvim-tree/nvim-web-devicons" },
}
