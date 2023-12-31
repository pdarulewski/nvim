local M = {
  "windwp/nvim-autopairs",
  event = "VeryLazy",
}

M.config = function()
  local ok, autopairs = pcall(require, "nvim-autopairs")
  if not ok then
    return
  end

  autopairs.setup()
end

return M
