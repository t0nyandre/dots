--- Returns whether or not neovim runs inside WSL.
---@return boolean
function _G.IsWSL()
  local output = vim.fn.systemlist("uname -r")
  return not not string.find(output[1] or "", "WSL") or string.find(output[1] or "", "Microsoft")
end
