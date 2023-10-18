return {
  settings = {
    ["rust-analyzer"] = {
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
