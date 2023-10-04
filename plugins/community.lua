return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.cpp"},
  { import = "astrocommunity.pack.go"},
  { import = "astrocommunity.pack.java"},
  { import = "astrocommunity.pack.markdown"},
  { import = "astrocommunity.pack.kotlin"},
  { import = "astrocommunity.pack.bash"},
  -- { import = "astrocommunity.code-runner.sniprun" },
  -- { import = "astrocommunity.code-runner.overseer-nvim"},
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
}
