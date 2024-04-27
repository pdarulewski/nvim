-- xcode support

local M = {
  "wojciech-kulik/xcodebuild.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("xcodebuild").setup({
    })
  end,
}

return M
