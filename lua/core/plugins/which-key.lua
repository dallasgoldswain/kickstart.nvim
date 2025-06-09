-- Useful plugin to show you pending keybinds.
-- https://github.com/tpope/vim-fugitive

return {
  "folke/which-key.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts_extend = { "spec" },
  opts = {
    preset = "modern",
    defaults = {},
    filter = function(mapping)
      -- exclude mappings without a description
      return mapping.desc and mapping.desc ~= ""
    end,
    spec = {
      {
        mode = { "n", "v" },
        { "<leader><tab>", group = "tabs" },
        { "<leader>c", group = "code" },
        { "<leader>d", group = "debug" },
        { "<leader>dp", group = "profiler" },
        { "<leader>f", group = "file/find" },
        { "<leader>g", group = "git" },
        { "<leader>gh", group = "hunks" },
        { "<leader>q", group = "quit/session" },
        { "<leader>s", group = "search" },
        { "<leader>u", group = "ui", icon = { icon = "󰙵 ", color = "cyan" } },
        { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
        { "[", group = "prev" },
        { "]", group = "next" },
        { "g", group = "goto" },
        { "gs", group = "surround" },
        { "z", group = "fold" },
        {
          "<leader>b",
          group = "buffer",
          expand = function()
            return require("which-key.extras").expand.buf()
          end,
        },
        {
          "<leader>w",
          group = "windows",
          proxy = "<c-w>",
          expand = function()
            return require("which-key.extras").expand.win()
          end,
        },
        -- better descriptions
        { "gx", desc = "Open with system app", group = "file/find" },
      },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Keymaps (which-key)",
    },
    {
      "<c-w><space>",
      function()
        require("which-key").show({ keys = "<c-w>", loop = true })
      end,
      desc = "Window Hydra Mode (which-key)",
    },
    Up = " ",
    Down = " ",
    Left = " ",
    Right = " ",
    C = "󰘴 ",
    M = "󰘵 ",
    D = "󰘳 ",
    S = "󰘶 ",
    CR = "󰌑 ",
    Esc = "󱊷 ",
    ScrollWheelDown = "󱕐 ",
    ScrollWheelUp = "󱕑 ",
    NL = "󰌑 ",
    BS = "󰁮",
    Space = "󱁐 ",
    Tab = "󰌒 ",
    F1 = "󱊫",
    F2 = "󱊬",
    F3 = "󱊭",
    F4 = "󱊮",
    F5 = "󱊯",
    F6 = "󱊰",
    F7 = "󱊱",
    F8 = "󱊲",
    F9 = "󱊳",
    F10 = "󱊴",
    F11 = "󱊵",
    F12 = "󱊶",
  },
}
