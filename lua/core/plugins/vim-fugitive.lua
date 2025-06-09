-- A Git wrapper so awesome, it should be illegal
-- https://github.com/tpope/vim-fugitive

return {
    {
        "tpope/vim-fugitive",
        dependencies = {
            "tpope/vim-rhubarb",
        },
        keys = {
            { "<leader>gs", "<cmd>Git<cr>",        desc = "Git Status" },
            { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git Commit" },
            { "<leader>gp", "<cmd>Git push<cr>",   desc = "Git Push" },
            { "<leader>gl", "<cmd>Git pull<cr>",   desc = "Git Pull" },
            { "<leader>gf", "<cmd>Git fetch<cr>",  desc = "Git Fetch" },
            { "<leader>gd", "<cmd>Git diff<cr>",   desc = "Git Diff" },
        },
        config = function()
            vim.keymap.set("n", "<leader>gg", vim.cmd.Git)

            local myFugitive = vim.api.nvim_create_augroup("myFugitive", {})

            local autocmd = vim.api.nvim_create_autocmd
            autocmd("BufWinEnter", {
                group = myFugitive,
                pattern = "*",
                callback = function()
                    if vim.bo.ft ~= "fugitive" then
                        return
                    end

                    local bufnr = vim.api.nvim_get_current_buf()
                    local opts = { buffer = bufnr, remap = false }

                    vim.keymap.set("n", "<leader>P", function()
                        vim.cmd.Git('push')
                    end, opts)

                    -- NOTE: rebase always
                    vim.keymap.set("n", "<leader>p", function()
                        vim.cmd.Git({ 'pull', '--rebase' })
                    end, opts)

                    -- NOTE: easy set up branch that wasn't setup properly
                    vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
                end,
            })
        end,
    } }
