-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

if vim.g.neovide == true then
  vim.o.guifont = "Maple Mono NF CN:h13"

  -- Zoom in/out should work in Neovide
  vim.keymap.set(
    "n",
    "<D-=>",
    ":lua vim.g.neovide_scale_factor = math.min(vim.g.neovide_scale_factor + 0.1, 2.5)<CR>",
    { silent = true }
  )
  vim.keymap.set(
    "n",
    "<D-->",
    ":lua vim.g.neovide_scale_factor = math.max(vim.g.neovide_scale_factor - 0.1, 0.5)<CR>",
    { silent = true }
  )
  vim.keymap.set("n", "<D-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end
