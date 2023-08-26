-- git status indicators in the gutter

local M = {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
}

M.config = function()
  local ok, gitsigns = pcall(require, "gitsigns")
  if not ok then
    return
  end

  gitsigns.setup()
end

return M
