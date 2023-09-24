-- hydrate notifications

local M = {
  "stefanlogue/hydrate.nvim",
  event = "VeryLazy",
}

M.config = function()
  local ok, hydrate = pcall(require, "hydrate")
  if not ok then
    return
  end

  hydrate.setup({
    minute_interval = 20, -- min

    -- The render style for notifications
    -- Accepted values are "default", "minimal", "simple" or "compact"
    render_style = "compact",

    -- Loads time of last drink on startup
    -- Useful if you don't have long-running neovim instances
    -- or if you tend to have multiple instances running at a time
    persist_timer = true,
  })
end

return M
