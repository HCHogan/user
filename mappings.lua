-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    ["<leader>a"] = { name = " Copilot" },
    ["<leader>ae"] = { ":Copilot enable<CR>" },
    ["<leader>ad"] = { ":Copilot disable<CR>" },
    ["<leader>ap"] = { ":Copilot panel<CR>" },
    ["<leader>as"] = { ":Copilot suggestion<CR>" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    -- CompetiTest bindings
    ["<leader>r"] = { name = " CompetiTest" },
    ["<leader>rr"] = { ":CompetiTest run<CR>" },
    ["<leader>rR"] = { ":CompetiTest run_no_compile<CR>" },
    ["<leader>ra"] = { ":CompetiTest add_testcase<CR>" },
    ["<leader>re"] = { ":CompetiTest edit_testcase<CR>" },
    -- barbar
    ["]b"] = { ":BufferNext<CR>" },
    ["[b"] = { ":BufferPrevious<CR>" },
    ["<leader>bp"] = { ":BufferPick<CR>" },
    -- luasnip
    ["<M-j>"] = { ":lua require('luasnip').jump(1)<CR>" },
    ["<M-k>"] = { ":lua require('luasnip').jump(-1)<CR>" },
    -- my quirks
    ["J"] = { "5j" },
    -- ["K"] = { "5k" },
    ["H"] = { "5h" },
    ["L"] = { "5l" },
    [";"] = { ":" },
    ["<F5>"] = { ":let b:caret=winsaveview() <CR> | :%SnipRun <CR>| :call winrestview(b:caret) <CR>" },
    -- inlay_hints
    ["<leader>i"] = { name = "󱠁 Inlay Hints" },
    ["<leader>ie"] = { "<cmd>lua vim.lsp.inlay_hint(0, true)<CR>" },
    ["<leader>id"] = { "<cmd>lua vim.lsp.inlay_hint(0, false)<CR>" },
    ["<C-N>"] = { ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
  i = {},
  v = {

    ["J"] = { "5j" },
    ["K"] = { "5k" },
    ["H"] = { "5h" },
    ["L"] = { "5l" },
  },
}
