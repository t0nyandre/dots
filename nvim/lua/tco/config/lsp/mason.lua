local M = {}

function M.setup()
    require("mason.settings").set({
        ui = {
            border = "rounded",
        }
    })
end

return M
