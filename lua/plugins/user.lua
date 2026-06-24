-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  -- LSP signature hint as you type
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
  },

  -- == Examples of Overriding Plugins ==

  -- customize dashboard options
  {
    "folke/snacks.nvim",
    opts = {
      styles = {
        notification = {
          wo = { wrap = true }, -- Wrap notifications
        },
        notification_history = {
          wo = {
            wrap = true,
            linebreak = true,
          },
        },
      },
      picker = {
        win = {
          input = {
            keys = {
              ["<C-a>"] = {
                function() vim.api.nvim_feedkeys(vim.keycode "<Home>", "n", false) end,
                mode = { "i", "n" },
                desc = "Input beginning",
              },
              ["<C-e>"] = {
                function() vim.api.nvim_feedkeys(vim.keycode "<End>", "n", false) end,
                mode = { "i", "n" },
                desc = "Input end",
              },
              ["<C-j>"] = { "focus_list", mode = { "i", "n" } },
              ["<C-k>"] = { "focus_input", mode = { "i", "n" } },
              ["<C-l>"] = { "focus_preview", mode = { "i", "n" } },
            },
          },
          list = {
            keys = {
              ["<C-k>"] = "focus_input",
              ["<C-l>"] = "focus_preview",
            },
          },
          preview = {
            keys = {
              ["<C-h>"] = "focus_list",
              ["<C-k>"] = "focus_input",
            },
          },
        },
        sources = {
          notifications = {
            win = {
              preview = {
                wo = {
                  wrap = true,
                  linebreak = true,
                },
              },
            },
          },
        },
      },
      dashboard = {
        preset = {
          -- Original dashboard header art.
          header = table.concat({
            "⠀⠀⠀⠀⠀⠀⣀⡠⠄⠒⠠⢄⠀⣀⠤⠒⠂⠤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠤⠐⠒⠤⡀⢀⡠⠔⠂⠠⢄⣀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⣠⠞⠂⢀⣀⣀⠀⠀⠉⠁⠀⣀⣀⣀⠀⠑⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⠋⠀⣀⣀⣀⠀⠈⠉⠀⢀⣀⣀⠀⠈⠲⡀⠀⠀⠀⠀",
            "⠀⠀⠀⣸⡏⠀⣴⢋⠤⢌⠙⠆⠀⢠⠎⢁⠤⠍⢧⠀⠀⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡿⠁⢠⡞⡡⠤⡉⠳⠀⠀⡴⠉⡠⠬⡹⡄⠀⢸⡄⠀⠀⠀",
            "⠀⠀⢀⣽⡁⠀⣿⡀⢀⡘⡄⡇⠀⢸⢢⠇⢀⢢⣺⠀⠀⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣨⣇⠀⢸⣏⠀⡐⢣⢸⠀⠀⡗⡜⢀⠐⣄⣧⠀⢸⣇⠀⠀⠀",
            "⠀⣰⠉⠙⠷⠀⢛⣟⣦⣄⣣⡇⠀⠘⣎⣰⣤⣾⡿⠁⠴⠋⠈⠱⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡎⠉⠻⠆⠈⣿⣳⣤⣙⣼⠂⠀⢻⣁⣦⣼⣿⠇⠠⠞⠁⠙⣆⠀",
            "⣺⠁⠀⣠⠒⠶⣄⠉⠓⢚⣣⡠⠤⢤⣈⡓⠛⠋⢠⠖⠲⢤⡀⠀⢷⠀⠀⠀⠀⠀⠀⠀⢐⡟⠀⢀⠔⠲⢦⡈⠑⠛⣋⣡⠤⠤⣄⣙⠚⠛⢁⡴⠒⠦⣄⠀⠨⡆",
            "⣽⠀⢸⠄⠣⡐⢹⠀⡤⠏⢁⢀⢀⠠⢀⠉⢦⡀⢹⡁⠔⡁⣗⠀⢸⡅⠀⠀⠀⠀⠀⠀⢸⡇⠀⡗⠘⢄⢈⡇⢠⠖⠉⡀⣀⠠⠄⡈⠳⣄⠈⣟⠠⢈⢸⠀⠀⣿",
            "⠹⣄⠸⣷⣤⣧⠞⣾⢁⠐⢀⠀⠠⠄⣀⠑⠄⢱⡸⣧⣴⣶⡟⢠⡟⠁⠀⠀⠀⠀⠀⠀⠈⢷⡀⢿⣦⣾⡼⢳⡏⡠⠁⡀⠠⠠⢄⠈⠢⠈⣆⢿⣤⢶⣾⠃⣼⠃",
            "⠀⡸⢷⠈⠉⠉⢸⡟⣆⠀⢂⠌⣁⠒⡈⠢⢈⣾⣧⠈⠉⠉⢴⢏⡀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠿⡆⠉⠉⠁⣾⣳⠀⡀⠆⡑⠄⢂⠙⠄⣱⣿⠀⠉⠉⠡⡾⡅⠀",
            "⠐⡇⠀⠀⠀⠀⠘⣿⡞⣦⣅⣂⣄⣂⣰⣵⣻⣽⠏⠀⠀⠀⠀⢰⡆⠀⠀⠀⠀⠀⠀⠀⠀⢺⠀⠀⠀⠀⠀⢻⣷⢳⣴⣈⣐⣈⣄⣮⣞⣯⡿⠂⠀⠀⠀⠀⣸⠀",
            "⠀⠘⢄⠀⠀⠀⠀⠈⠻⠶⣝⣮⣳⣭⣳⣧⠟⠋⠀⠀⠀⠀⣠⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠣⡀⠀⠀⠀⠀⠙⠷⢮⣽⣭⣻⣜⣷⠾⠛⠁⠀⠀⠀⠀⡼⠃⠀",
            "⠀⠀⠈⡗⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⡠⢾⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⢀⠴⣟⠁⠀⠀",
            "⠀⠀⠀⢸⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠨⡷⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⠇⠀⠀⠀",
            "⠀⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡅⠀⠀⠀",
            "⠀⠀⠀⢽⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢨⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡇⠀⠀⠀",
          }, "\n"),
        },
      },
    },
  },

  {
    "OXY2DEV/markview.nvim",
    lazy = false,
  },

  {
    "Owen-Dechow/videre.nvim",
    cmd = "Videre",
    opts = {
      round_units = false,
      simple_statusline = true,
    },
  },

  -- You can disable default plugins as follows:
  -- { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     local luasnip = require "luasnip"
  --     luasnip.filetype_extend("javascript", { "javascriptreact" })

  --     -- include the default astronvim config that calls the setup call
  --     require "astronvim.plugins.configs.luasnip"(plugin, opts)
  --   end,
  -- },

  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
}
