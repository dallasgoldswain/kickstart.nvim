-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
-- used for completion, annotations and signatures of Neovim apis
-- https://github.com/folke/lazydev.nvim
return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        cmd = "LazyDev",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                { path = "snacks.nvim",        words = { "Snacks" } },
                { path = "lazy.nvim",          words = { "LazyVim" } },
            },
        },
    },
    -- { -- optional blink completion source for require statements and module annotations
    --     "saghen/blink.cmp",
    --     opts = {
    --         sources = {
    --             -- add lazydev to your completion providers
    --             default = { "lazydev", "lsp", "path", "snippets", "buffer" },
    --             providers = {
    --                 lazydev = {
    --                     name = "LazyDev",
    --                     module = "lazydev.integrations.blink",
    --                     -- make lazydev completions top priority (see `:h blink.cmp`)
    --                     score_offset = 100,
    --                 },
    --             },
    --         },
    --     },
    -- }
}
