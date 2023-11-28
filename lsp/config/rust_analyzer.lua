return {
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy",
        allTargets = false,
      },
      -- diagnostics = {
      --   enable = true,
      --   experimental = {
      --     enable = true,
      --   }
      -- },
      inlayHints = {
        -- reborrowHints = {
        --   enable = "always",
        -- },
        lifetimeElisionHints = {
          enable = "always",
        },
        expressionAdjustmentHints = {
          enable = "always",
          hideOutsideUnsafe = false,
          mode = "prefix",
        }
      },
    },
  },
}
