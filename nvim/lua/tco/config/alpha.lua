local M = {}

function M.setup()
  local alpha_ok, alpha = pcall(require, "alpha")
  local icons_ok, icons = pcall(require, "tco.icons")
  if not (alpha_ok and icons_ok) then return end

  local dashboard = require("alpha.themes.dashboard")

  -- local function footer()
  --     local version = vim.version()
  --     local print_version = "v" .. version.major .. "." .. version.minor .. "." .. version.patch
  --     local datetime = os.date("%Y-%m-%d %H:%M:%S")
  --
  --     return print_version .. " " .. datetime
  -- end

  dashboard.section.header.val = {
    [[████████╗ ██████╗ ███╗   ██╗██╗   ██╗ █████╗ ███╗   ██╗██████╗ ██████╗ ███████╗]],
    [[╚══██╔══╝██╔═████╗████╗  ██║╚██╗ ██╔╝██╔══██╗████╗  ██║██╔══██╗██╔══██╗██╔════╝]],
    [[   ██║   ██║██╔██║██╔██╗ ██║ ╚████╔╝ ███████║██╔██╗ ██║██║  ██║██████╔╝█████╗  ]],
    [[   ██║   ████╔╝██║██║╚██╗██║  ╚██╔╝  ██╔══██║██║╚██╗██║██║  ██║██╔══██╗██╔══╝  ]],
    [[   ██║   ╚██████╔╝██║ ╚████║   ██║   ██║  ██║██║ ╚████║██████╔╝██║  ██║███████╗]],
    [[   ╚═╝    ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝╚══════╝]],
    [[   Tony André Haugen - post@tonyandre.co - https://tonyandre.co                ]],
  }

  dashboard.section.buttons.val = {
    dashboard.button("f", icons.ui.Files .. " " .. " Find file", ":Telescope find_files <CR>"),
    dashboard.button(
      "p",
      icons.ui.Project .. " " .. " Find projects",
      "<cmd>lua require('telescope').extensions.projects.projects{}<CR>"
    ),
    dashboard.button("r", icons.ui.FindFile .. " " .. " Recent files", ":Telescope oldfiles <CR>"),
    dashboard.button("g", icons.ui.FindText .. " " .. " Find text", ":Telescope live_grep <CR>"),
    dashboard.button("c", icons.ui.Gear .. " " .. " Config", ":e $MYVIMRC <CR>"),
    dashboard.button("u", icons.ui.Update .. " " .. " Update plugins", ":Lazy update<CR>"),
    dashboard.button("q", icons.ui.SignOut .. " " .. " Quit", ":qa<CR>"),
  }

  dashboard.section.footer.opts.hl = "Type"
  dashboard.section.header.opts.hl = "AlphaHeader"
  dashboard.section.buttons.opts.hl = "AlphaButtons"
  dashboard.opts.layout[1].val = 8

  -- close Lazy and re-open when the dashboard is ready
  if vim.o.filetype == "lazy" then
    vim.cmd.close()
    vim.api.nvim_create_autocmd("User", {
      pattern = "AlphaReady",
      callback = function()
        require("lazy").show()
      end,
    })
  end

  alpha.setup(dashboard.config)

  vim.api.nvim_create_autocmd("User", {
    pattern = "LazyVimStarted",
    callback = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
      pcall(vim.cmd.AlphaRedraw)
    end,
  })
end

return M
