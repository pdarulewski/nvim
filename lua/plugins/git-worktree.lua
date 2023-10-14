-- git worktree support

local M = {
  "ThePrimeagen/git-worktree.nvim",
  event = "VeryLazy",
}

M.config = function()
  local ok, worktree = pcall(require, "worktree")
  if not ok then
    return
  end

  worktree.setup({})
  -- require("telescope").load_extension("git_worktree")
end

return M
