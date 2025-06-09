-- git signs highlights text that has changed since the list
-- git commit, and also lets you interactively stage & unstage
-- hunks in a commit.

return {
    {
        "folke/which-key.nvim",
        opts = {
            spec = {
                { "<leader>g",   group = "git" },
                { "<leader>gh",  group = "hunks" },
                { "<leader>ghP", desc = "Preview inline" },
                { "<leader>ghR", desc = "Reset buffer" },
                { "<leader>ghS", desc = "Stage buffer" },
                { "<leader>ghp", desc = "Preview" },
                { "<leader>ghr", desc = "Reset" },
                { "<leader>ghs", desc = "Stage" },
                { "<leader>gi",  group = "diffs" },
                { "<leader>gid", desc = "Diff This" },
                { "<leader>giD", desc = "Diff This ~" },
                { "<leader>gic", desc = "Diff against last [c]ommit" },
                { "<leader>gt",  group = "toggle" },
                { "<leader>gtb", desc = "Line blame" },
                { "<leader>gtw", desc = "Word diff" },
            },
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
                untracked = { text = "▎" },
            },
            signs_staged = {
                add = { text = "▎" },
                change = { text = "▎" },
                delete = { text = "" },
                topdelete = { text = "" },
                changedelete = { text = "▎" },
            },
            current_line_blame = true,
            on_attach = function(buffer)
                local gitsigns = require('gitsigns')

                local function keymap(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
                end

                -- Navigation
                -- stylua: ignore start
                keymap("n", "]h", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "]c", bang = true })
                    else
                        gitsigns.nav_hunk("next")
                    end
                end, "Next Hunk")
                keymap("n", "[h", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "[c", bang = true })
                    else
                        gitsigns.nav_hunk("prev")
                    end
                end, "Prev Hunk")
                keymap("n", "]H", function() gitsigns.nav_hunk("last") end, "Last Hunk")
                keymap("n", "[H", function() gitsigns.nav_hunk("first") end, "First Hunk")

                -- Actions
                keymap({ "n", "v" }, "<leader>ghs", gitsigns.stage_hunk, "Stage Hunk")
                keymap({ "n", "v" }, "<leader>ghr", gitsigns.reset_hunk, "Reset Hunk")
                keymap("n", "<leader>ghu", gitsigns.undo_stage_hunk, "Undo Stage Hunk")

                keymap('v', '<leader>ghs', function()
                    gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                end)
                keymap("n", "<leader>ghS", gitsigns.stage_buffer, "Stage Buffer")

                keymap('v', '<leader>ghr', function()
                    gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                end)
                keymap("n", "<leader>ghR", gitsigns.reset_buffer, "Reset Buffer")

                keymap('n', '<leader>ghp', gitsigns.preview_hunk, "Preview Hunk")
                keymap("n", "<leader>ghP", gitsigns.preview_hunk_inline, "Preview Hunk Inline")

                keymap("n", "<leader>ghb", function() gitsigns.blame_line({ full = true }) end, "Blame Line")
                keymap("n", "<leader>ghB", function() gitsigns.blame_buffer() end, "Blame Buffer")

                keymap("n", "<leader>ghd", gitsigns.diffthis, "Diff This")
                keymap("n", "<leader>ghD", function() gitsigns.diffthis("~") end, "Diff This ~")
                keymap('n', '<leader>ghc', function()
                    gitsigns.diffthis '@'
                end, { desc = 'git [D]iff against last commit' })

                keymap('n', '<leader>ghQ', function() gitsigns.setqflist('all') end)
                keymap('n', '<leader>ghq', gitsigns.setqflist, "Set QF List")
                keymap('n', '<leader>ghl', gitsigns.setloclist, "Set Loc List")


                -- Toggles
                keymap('n', '<leader>gtb', gitsigns.toggle_current_line_blame, "Toggle Blame")
                keymap('n', '<leader>gtw', gitsigns.toggle_word_diff, "Toggle Word Diff")

                -- Text object
                keymap({ "o", "x" }, "gih", gitsigns.select_hunk, "Select Hunk")
            end,
        },

    }
}
