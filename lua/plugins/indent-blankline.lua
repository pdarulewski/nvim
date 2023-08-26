-- visual guides for indentation

local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
}

M.config = function()
  local ok, indent_blankline = pcall(require, "indent_blankline")
  if not ok then
    return
  end

  indent_blankline.setup({
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
  })
end

return M
