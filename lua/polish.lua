-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- CodeLLDB's bundled LLDB needs Xcode's debugserver on macOS.
if vim.fn.has "mac" == 1 then
  local lldb_resources = "/Applications/Xcode.app/Contents/SharedFrameworks/LLDB.framework/Versions/A/Resources"
  local debugserver = lldb_resources .. "/debugserver"
  if vim.fn.executable(debugserver) == 1 then
    vim.env.LLDB_DEBUGSERVER_PATH = debugserver
    if vim.fn.executable "debugserver" == 0 then vim.env.PATH = lldb_resources .. ":" .. vim.env.PATH end
  end
end

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
