return {
  "rose-pine/neovim",
  priority = 1000,
  as = "rose-pine",
  config = function()
    vim.cmd("colorscheme rose-pine")
    vim.api.nvim_set_hl(0, "Normal", { bg = "none"} )
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none"} )
  end
}
