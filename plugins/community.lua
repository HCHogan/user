-- fasfasd
-- This file is for importing community plugins
-- sees specifications at
return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.python-ruff" },
  -- { import = "astrocommunity.pack.typescript-all-in-one" },
  -- { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.typescript" },
  -- { import = "astrocommunity.pack.docker" },
  -- { import = "astrocommunity.pack.dart" },
  { import = "astrocommunity.pack.cpp" },
  -- { import = "astrocommunity.pack.cs" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.markdown" },
  -- { import = "astrocommunity.pack.haskell" },
  -- { import = "astrocommunity.pack.kotlin" },
  -- { import = "astrocommunity.pack.swift" },
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
  -- { import = "astrocommunity.diagnostics.trouble-nvim" },
  -- { import = "astrocommunity.diagnostics.lsp_lines-nvim" },
  { import = "astrocommunity.register.nvim-neoclip-lua" },
  -- { import = "astrocommunity.media.drop-nvim" },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.editing-support.zen-mode-nvim" },
  { import = "astrocommunity.bars-and-lines.dropbar-nvim" },
  { import = "astrocommunity.editing-support.comment-box-nvim" },
  -- { import = "astrocommunity.note-taking.obsidian-nvim" },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  -- { import = "astrocommunity.markdown-and-latex.markmap-nvim" },
  { import = "astrocommunity.editing-support.chatgpt-nvim" },
  -- { import = "astrocommunity.editing-support.ultimate-autopair-nvim" },
  -- { import = "astrocommunity.workflow.bad-practices-nvim"},
  -- { import = "astrocommunity.code-runner.sniprun" },
  -- { import = "astrocommunity.code-runner.overseer-nvim"},
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
}
