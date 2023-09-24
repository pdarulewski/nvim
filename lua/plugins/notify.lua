-- notifications

local M = {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
}

M.config = function()
  local ok, notify = pcall(require, "notify")
  if not ok then
    return
  end

  notify.setup()
end

return M
