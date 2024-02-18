return {
  capabilities = {
    offsetEncoding = "utf-8",
  },
  cmd = {
    "/opt/llvm/bin/clangd",
    "--background-index",
    "-j=10",
    "--query-driver=/opt/llvm/bin/clang++",
    -- "--clang-tidy",
    -- "--clang-tidy-checks=performance-*,bugprone-*,modernize-*,readability-*,portability-*,misc-*",
    -- "--all-scopes-completion",
    -- "--completion-style=detailed",
    -- "--header-insertion=iwyu",
    -- "--pch-storage=disk",
  },
}
