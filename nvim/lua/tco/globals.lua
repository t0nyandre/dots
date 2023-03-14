--- Returns whether or not neovim runs inside WSL.
---@return boolean
function _G.IsWSL()
  local output = vim.fn.systemlist("uname -r")
  return not not string.find(output[1] or "", "WSL") or string.find(output[1] or "", "Microsoft")
end

--- Exports the currently used colorscheme to kitty.
--- @see https://www.reddit.com/r/neovim/comments/10nphrj/lua_function_to_dump_current_neovim_colorscheme/
function _G.ExportColorschemeToKitty()
  local colorscheme = vim.g.colors_name
  local filename = os.getenv("HOME") .. "/.config/kitty/themes/" .. colorscheme .. ".conf"
  local file = io.open(filename, "w")
  ---@diagnostic disable-next-line: param-type-mismatch
  io.output(file)
  io.write("# vim:ft=kitty" .. "\n\n")
  io.write("# exported from " .. vim.g.colors_name .. "\n\n")
  local fg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "fg")
  local bg = vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg")
  io.write("foreground " .. fg .. "\n")
  io.write("background " .. bg .. "\n")
  io.write("selection_foreground " .. bg .. "\n")
  io.write("selection_background " .. fg .. "\n")
  for i = 0, 15 do
    local var = "g:terminal_color_" .. tostring(i)
    if vim.fn.exists(var) == 1 then
      local tc = vim.fn.eval(var)
      io.write("color" .. tostring(i) .. " " .. tc .. "\n")
      if i == 2 then
        io.write("cursor " .. tc .. "\n")
      end
    end
  end
  io.close(file)
  print(string.format("Colorscheme has been exported to '%s'", filename))
end

