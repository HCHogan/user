return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  plugins = {
    {
      "goolord/alpha-nvim",
      opts = function(_, opts) -- override the options using lazy.nvim
        opts.section.header.val = { -- change the header section value
          " Hank Hogan",
          " Dashboard Header",
        }
      end,
    },
    {
      "xbase-lab/xbase",
      config = function()
        require("xbase").setup {
          -- your xbase config here
        }
      end,
    },
  },

  -- Set colorscheme to use
  -- colorscheme = "astrodark",
  colorscheme = "catppuccin-mocha",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = false, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin", "copilot.lua" },
      },
    },
  },

  highlights = {
    -- set highlights for all themes
    -- use a function override to let us use lua to retrieve colors from highlight group
    -- there is no default table so we don't need to put a parameter for this function
    init = function()
      local get_hlgroup = require("astronvim.utils").get_hlgroup
      -- get highlights from highlight groups
      local normal = get_hlgroup "Normal"
      local fg, bg = normal.fg, normal.bg
      local bg_alt = get_hlgroup("Visual").bg
      local green = get_hlgroup("String").fg
      local red = get_hlgroup("Error").fg
      -- return a table of highlights for telescope based on colors gotten from highlight groups
      return {
        TelescopeBorder = { fg = bg_alt, bg = bg },
        TelescopeNormal = { bg = bg },
        TelescopePreviewBorder = { fg = bg, bg = bg },
        TelescopePreviewNormal = { bg = bg },
        TelescopePreviewTitle = { fg = bg, bg = green },
        TelescopePromptBorder = { fg = bg_alt, bg = bg_alt },
        TelescopePromptNormal = { fg = fg, bg = bg_alt },
        TelescopePromptPrefix = { fg = red, bg = bg_alt },
        TelescopePromptTitle = { fg = bg, bg = red },
        TelescopeResultsBorder = { fg = bg, bg = bg },
        TelescopeResultsNormal = { bg = bg },
        TelescopeResultsTitle = { fg = bg, bg = bg },
      }
    end,
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- utf8
    -- vim.g.encoding = "UTF-8"
    -- vim.o.fileencoding = "utf-8"
    -- -- jk移动时光标下上方保留8行
    vim.o.scrolloff = 5
    vim.o.sidescrolloff = 5
    -- 使用相对行号
    vim.wo.number = true
    vim.wo.relativenumber = true
    require("notify").setup {
      max_width = 30,
      timeout = 500,
      fps = 120,
      level = "warn",
      render = "default",
    }

    local ls = require "luasnip"
    local s = ls.snippet
    local sn = ls.snippet_node
    local isn = ls.indent_snippet_node
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local c = ls.choice_node
    local d = ls.dynamic_node
    local r = ls.restore_node
    local events = require "luasnip.util.events"
    local ai = require "luasnip.nodes.absolute_indexer"
    local extras = require "luasnip.extras"
    local fmt = extras.fmt
    local m = extras.m
    local l = extras.l
    local postfix = require("luasnip.extras.postfix").postfix

    ls.add_snippets("all", {
      s("ternary", {
        -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
        i(1, "cond"),
        t " ? ",
        i(2, "then"),
        t " : ",
        i(3, "else"),
      }),
    })

    ls.add_snippets("all", {
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

    -- ls.add_snippets("all", {
    --   s("racm", {
    --     t {
    --       "#![allow(unused_variables)]",
    --       "#![allow(unused_must_use)]",
    --       "use std::io::{self, prelude::*};",
    --       "",
    --       "// Example of usage:",
    --       "// let n: usize = input.token();",
    --       "// let mut a = vec![0usize; n];",
    --       "// let mut b = vec![0usize; n];",
    --       "// for (x, y) in a.iter_mut().zip(b.iter_mut()) {",
    --       "//     *x = input.token();",
    --       "//     *y = input.token();",
    --       "// }",
    --       "// let mut order: Vec<_> = (0..n).collect();",
    --       "// order.sort_by(|&i, &j| {",
    --       "//     let z1 = a[i] + b[j];",
    --       "//     let z2 = a[j] + b[i];",
    --       "//     return z2.cmp(&z1);",
    --       "// });",
    --       "// let mut ans = 0u64;",
    --       "// for (i, &x) in order.iter().enumerate() {",
    --       "//     ans += a[x] as u64 * i as u64 + b[x] as u64 * (n - 1 - i) as u64;",
    --       "// }",
    --       '// write!(w, "{}\\n", ans);',
    --       "fn solve<R: BufRead, W: Write>(mut input: FastInput<R>, mut w: W) {",
    --       "    ",
    --     },
    --     i(1),
    --     t {
    --       "",
    --       "}",
    --       "",
    --       "fn main() {",
    --       "    let stdin = io::stdin();",
    --       "    let stdout = io::stdout();",
    --       "    let input = FastInput::from(stdin.lock());",
    --       "    let writer = io::BufWriter::new(stdout.lock());",
    --       "    solve(input, writer);",
    --       "}",
    --       "",
    --       "trait TokenStream<T> {",
    --       "    fn token(&mut self) -> T;",
    --       "}",
    --       "",
    --       "struct FastInput<R> {",
    --       "    stdin: R,",
    --       "    pos: usize,",
    --       "}",
    --       "",
    --       "impl<R: BufRead> From<R> for FastInput<R> {",
    --       "    fn from(r: R) -> Self {",
    --       "        FastInput { stdin: r, pos: 0 }",
    --       "    }",
    --       "}",
    --       "",
    --       "impl<R: BufRead> TokenStream<u8> for FastInput<R> {",
    --       "    fn token(&mut self) -> u8 {",
    --       "        loop {",
    --       "            if let Ok(buf) = self.stdin.fill_buf() {",
    --       "                while self.pos < buf.len() {",
    --       "                    self.pos += 1;",
    --       "                    if buf[self.pos - 1] > 32 {",
    --       "                        return buf[self.pos - 1];",
    --       "                    }",
    --       "                }",
    --       "                if self.pos == 0 {",
    --       "                    return 0;",
    --       "                }",
    --       "            } else {",
    --       "                return 0;",
    --       "            }",
    --       "            self.stdin.consume(self.pos);",
    --       "            self.pos = 0;",
    --       "        }",
    --       "    }",
    --       "}",
    --       "",
    --       "impl<R: BufRead> TokenStream<Vec<u8>> for FastInput<R> {",
    --       "    fn token(&mut self) -> Vec<u8> {",
    --       "        let mut ans = Vec::new();",
    --       "        let mut parse_token = false;",
    --       "        loop {",
    --       "            if let Ok(buf) = self.stdin.fill_buf() {",
    --       "                if !parse_token {",
    --       "                    while self.pos < buf.len() && buf[self.pos] <= 32 {",
    --       "                        self.pos += 1;",
    --       "                    }",
    --       "                }",
    --       "                while self.pos < buf.len() && buf[self.pos] > 32 {",
    --       "                    parse_token = true;",
    --       "                    ans.push(buf[self.pos]);",
    --       "                    self.pos += 1;",
    --       "                }",
    --       "                if self.pos != buf.len() || self.pos == 0 {",
    --       "                    return ans;",
    --       "                }",
    --       "            }",
    --       "            self.stdin.consume(self.pos);",
    --       "            self.pos = 0;",
    --       "        }",
    --       "    }",
    --       "}",
    --       "",
    --       "macro_rules! impl_token_stream {",
    --       "    ($($t:ident),+) => {$(",
    --       "        impl<R: BufRead> TokenStream<$t> for FastInput<R> {",
    --       "           fn token(&mut self) -> $t {",
    --       "                let mut ans = 0;",
    --       "                let mut parse_token = false;",
    --       "                loop {",
    --       "                    if let Ok(buf) = self.stdin.fill_buf() {",
    --       "                        if !parse_token {",
    --       "                            while self.pos < buf.len() && buf[self.pos] <= 32 {",
    --       "                                self.pos += 1;",
    --       "                            }",
    --       "                        }",
    --       "                        while self.pos < buf.len() && buf[self.pos] > 32 {",
    --       "                            parse_token = true;",
    --       "                            ans = ans * 10 + (buf[self.pos] - b'0') as $t",
    --       "                            self.pos += 1;",
    --       "                        }",
    --       "                        if self.pos != buf.len() || self.pos == 0 {",
    --       "                            return ans;",
    --       "                        }",
    --       "                    }",
    --       "                    self.stdin.consume(self.pos);",
    --       "                    self.pos = 0;",
    --       "                }",
    --       "           }",
    --       "        }",
    --       "    )+}",
    --       "}",
    --       "",
    --       "impl_token_stream!(usize);",
    --     },
    --   }),
    -- })

    -- local cmp_nvim_lsp = require "cmp_nvim_lsp"
    --
    -- require("lspconfig").clangd.setup {
    --   on_attach = on_attach,
    --   capabilities = cmp_nvim_lsp.default_capabilities(),
    --   cmd = {
    --     "clangd",
    --     "--offset-encoding=utf-16",
    --   },
    -- }
    --
    -- -- FIXME: no Run | Debug; can't go to definition
    -- local rust_tools_opts = {
    --   server = {
    --     -- standalone file support
    --     -- setting it to false may improve startup time
    --     standalone = true,
    --   }, -- rust-analyzer options
    -- }
    --
    -- require("rust-tools").setup(rust_tools_opts)

    -- vim.o.tabstop = 4
    -- vim.bo.tabstop = 4
    -- vim.o.softtabstop = 4
    -- vim.o.shiftround = true
    -- -- >> << 时移动长度
    -- vim.o.shiftwidth = 4
    -- vim.bo.shiftwidth = 4
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}
