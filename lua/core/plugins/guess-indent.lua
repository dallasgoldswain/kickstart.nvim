-- Detect tabstop and shiftwidth automatically
-- https://github.com/NMAC427/guess-indent.nvim
return {
    'NMAC427/guess-indent.nvim',
    event = 'BufReadPre',
    config = function()
        require('guess-indent').setup({
            auto_cmd = true,                                                                -- whether to run the setup automatically
            filetype_exclude = { 'netrw', 'TelescopePrompt', 'TelescopeResults', 'tutor' }, -- filetypes to exclude
            buftype_exclude = { 'terminal', 'nofile', 'quickfix', 'prompt' },               -- buftypes to exclude
        })
    end,
}
