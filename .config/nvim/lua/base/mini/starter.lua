local function header()
  return [[
        ████████╗ ██████╗ ███╗   ██╗██╗   ██╗ █████╗ ███╗   ██╗██████╗ ██████╗ ███████╗
        ╚══██╔══╝██╔═████╗████╗  ██║╚██╗ ██╔╝██╔══██╗████╗  ██║██╔══██╗██╔══██╗██╔════╝
          ██║   ██║██╔██║██╔██╗ ██║ ╚████╔╝ ███████║██╔██╗ ██║██║  ██║██████╔╝█████╗
          ██║   ████╔╝██║██║╚██╗██║  ╚██╔╝  ██╔══██║██║╚██╗██║██║  ██║██╔══██╗██╔══╝
          ██║   ╚██████╔╝██║ ╚████║   ██║   ██║  ██║██║ ╚████║██████╔╝██║  ██║███████╗
          ╚═╝    ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝╚══════╝
          Tony André Haugen - post@tonyandre.co - https://tonyandre.co
      ]]
end

require("mini.sessions").setup()

local starter = require("mini.starter")
starter.setup({
  evaluate_single = true,
  header = header,
  items = {
    starter.sections.builtin_actions(),
    starter.sections.recent_files(5, false),
    starter.sections.recent_files(5, true),
    starter.sections.sessions(3, true),
  },
  content_hooks = {
    starter.gen_hook.adding_bullet(),
    starter.gen_hook.indexing("all", { "Builtin actions" }),
    starter.gen_hook.padding(3, 2),
  },
})
