return {
  "zbirenbaum/copilot-cmp",
  dependencies = {
    "zbirenbaum/copilot.lua",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("copilot_cmp").setup()

    -- Prioritize on cmp
    local cmp = require "cmp"
    cmp.setup {
      sorting = {
        priority_weight = 2,
        comparators = {
          require("copilot_cmp.comparators").prioritize,
          -- Below is the default comparitor list and order for nvim-cmp
          cmp.config.compare.offset,
          -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.locality,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
    }
  end,
}
