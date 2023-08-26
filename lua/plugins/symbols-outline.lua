-- symbols tree

local M = {
  "simrat39/symbols-outline.nvim",
  event = "VeryLazy",
}

M.config = function()
  local ok, symbols = pcall(require, "symbols-outline")
  if not ok then
    return
  end

  symbols.setup({
    width = 15,
  })
end

return M
