return {
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        extraEnv = { CARGO_PROFILE_RUST_ANALYZER_INHERITS = "dev" },
        extraArgs = { "--profile", "rust-analyzer" },
      },
      checkOnSave = {
        command = "clippy",
        allTargets = false,
        extraArgs = { "--no-deps" },
        allFeatures = true,
      },
      inlayHints = {
        -- reborrowHints = {
        --   enable = "always",
        -- },
        lifetimeElisionHints = {
          enable = "always",
        },
        closureReturnTypeHints = {
          enable = true,
        },
        implicitDrops = {
          enable = "always",
        },
        discriminantHints = {
          enable = "always",
        },
        expressionAdjustmentHints = {
          enable = "always",
          hideOutsideUnsafe = false,
          mode = "prefix",
        },
      },
    },
  },
}
