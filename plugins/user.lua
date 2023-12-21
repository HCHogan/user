local leet_arg = "lc"

return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    event = { "User AstroFile" },
    cmd = { "TodoQuickFix" },
    keys = {
      { "<leader>T", "<cmd>TodoTelescope<cr>", desc = "Open TODOs in Telescope" },
    },
  },
  {
    "goolord/alpha-nvim",
    opts = function(_, opts) -- override the options using lazy.nvim
      opts.section.header.val = {
        "    ██╗  ██╗ █████╗ ███╗   ██╗██╗  ██╗     ",
        "    ██║  ██║██╔══██╗████╗  ██║██║ ██╔╝     ",
        "    ███████║███████║██╔██╗ ██║█████╔╝      ",
        "    ██╔══██║██╔══██║██║╚██╗██║██╔═██╗      ",
        "    ██║  ██║██║  ██║██║ ╚████║██║  ██╗     ",
        "    ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝     ",
        "                                           ",
        "██╗  ██╗ ██████╗  ██████╗  █████╗ ███╗   ██╗",
        "██║  ██║██╔═══██╗██╔════╝ ██╔══██╗████╗  ██║",
        "███████║██║   ██║██║  ███╗███████║██╔██╗ ██║",
        "██╔══██║██║   ██║██║   ██║██╔══██║██║╚██╗██║",
        "██║  ██║╚██████╔╝╚██████╔╝██║  ██║██║ ╚████║",
        "╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝",
      }
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    event = "BufRead",
    config = function()
      local ls = require "luasnip"
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      -- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/lua/user/snippets" } })

      ls.add_snippets("cpp", {
        s("acm", {
          t {
            "// Created by Hank Hogan",
            "",
            "#include <iostream>",
            "#include <vector>",
            "",
            "using namespace std;",
            "",
            "int main(int argc, char *argv[]) {",
            "  ios::sync_with_stdio(false);",
            "  cin.tie(nullptr);",
            "  cout.tie(nullptr);",
            "",
            "  ",
          },
          i(1),
          t {
            "",
            "",
            "  return 0;",
            "}",
          },
        }),
      })
    end,
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      require("notify").setup {
        timeout = 100,
        fps = 120,
        level = "info",
        max_width = 40,
        render = "wrapped-compact",
      }
    end,
  },
  {
    "gcmt/wildfire.vim",
    event = "VeryLazy",
  },
  {
    "tpope/vim-surround",
    event = "VeryLazy",
  },
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
      "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      animation = true,
      insert_at_start = false,
      -- …etc.
    },
    version = "^1.0.0", -- optional: only update when a new 1.x version is released
    event = "BufReadPost",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      local colors = require("catppuccin.palettes").get_palette "mocha"
      colors.none = "NONE"
      require("catppuccin").setup {
        transparent_background = false,
        styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" }, -- Change the style of comments
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = { "bold" },
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        integrations = {
          flash = true,
          noice = true,
          neotree = true,
          treesitter = true,
          notify = true,
          mason = true,
          which_key = true,
          telescope = {
            enabled = true,
            style = "nvchad",
          },
          dropbar = {
            enabled = true,
            color_mode = false,
          },
          indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
          },
          dap = {
            enabled = true,
            enable_ui = true,
          },
          barbar = true,
          aerial = true,
          headlines = true,
        },
      }
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash" },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc =
        "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc =
        "Toggle Flash Search"
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    event = "VeryLazy",
    config = function()
      require("copilot").setup {
        panel = {
          enabled = true, -- TODO: copilot-cmp
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4,
          },
        },
        suggestion = {
          enabled = true, -- TODO: copilot-cmp
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        -- filetypes = {
        --   yaml = true,
        --   markdown = true,
        --   help = false,
        --   gitcommit = true,
        --   gitrebase = false,
        --   hgcommit = false,
        --   svn = false,
        --   cvs = false,
        --   ["."] = false,
        -- },
        copilot_node_command = "node", -- Node.js version must be > 16.x
        server_opts_overrides = {},
      }
    end,
  },
  {
    "xeluxee/competitest.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    ft = {
      "cpp",
      "c",
      "rust",
    },
    event = "VeryLazy",
    config = function()
      require("competitest").setup {
        runner_ui = {
          interface = "split",
        },
        compile_command = {
          cpp = { exec = "clang++", args = { "-std=c++2b", "$(FNAME)", "-o", "$(FNOEXT)" } },
        },
        run_command = {
          cpp = { exec = "./$(FNOEXT)" },
        },
      }
    end,
  },
  {
    "wojciech-kulik/xcodebuild.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    -- ft = {
    --   "swift",
    --   -- "objcpp",
    --   -- "objc",
    -- },
    event = "BufEnter *.swift",
    config = function()
      require("astronvim.utils.lsp").setup "sourcekit"
      require("xcodebuild").setup()
      vim.keymap.set("n", "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>", { desc = "Toggle Xcodebuild Logs" })
      vim.keymap.set("n", "<leader>xb", "<cmd>XcodebuildBuild<cr>", { desc = "Build Project" })
      vim.keymap.set("n", "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "Build & Run Project" })
      vim.keymap.set("n", "<leader>xt", "<cmd>XcodebuildTest<cr>", { desc = "Run Tests" })
      vim.keymap.set("n", "<leader>xT", "<cmd>XcodebuildTestClass<cr>", { desc = "Run This Test Class" })
      vim.keymap.set("n", "<leader>X", "<cmd>XcodebuildPicker<cr>", { desc = "Show All Xcodebuild Actions" })
      vim.keymap.set("n", "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device" })
      vim.keymap.set("n", "<leader>xp", "<cmd>XcodebuildSelectTestPlan<cr>", { desc = "Select Test Plan" })
      vim.keymap.set("n", "<leader>xq", "<cmd>Telescope quickfix<cr>", { desc = "Show QuickFix List" })
    end,
  },
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    lazy = leet_arg ~= vim.fn.argv()[1],
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim", -- required by telescope
        "MunifTanjim/nui.nvim",

        -- optional
        "nvim-treesitter/nvim-treesitter",
        "rcarriga/nvim-notify",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
      arg = "lc",
      lang = "rust",
      logging = true,
      cn = {
        enabled = true,
        translate = true,
        translate_problems = true,
      },
    },
  },
  -- {
  --   "nvimdev/dyninput.nvim",
  --   config = function()
  --     local rs = require "dyninput.lang.rust"
  --     local ms = require "dyninput.lang.misc"
  --     require("dyninput").setup {
  --       c = {
  --         ["-"] = {
  --           { "->", ms.c_struct_pointer },
  --           { "_", ms.snake_case },
  --         },
  --       },
  --       rust = {
  --         [";"] = {
  --           { "::", rs.double_colon },
  --           { ": ", rs.single_colon },
  --         },
  --         ["="] = { " => ", rs.fat_arrow },
  --         ["-"] = {
  --           { " -> ", rs.thin_arrow },
  --           { "_", ms.snake_case },
  --         },
  --         ["\\"] = { "|!| {}", rs.closure_fn },
  --       },
  --     }
  --   end,
  --   dependencies = { "nvim-treesitter/nvim-treesitter" },
  --   event = "BufRead",
  -- },
  -- {
  -- "zbirenbaum/copilot-cmp",
  -- event = "InsertEnter",
  -- config = function ()
  --   require("copilot_cmp").setup()
  -- end
  -- },
}
