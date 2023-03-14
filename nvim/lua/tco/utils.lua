local M = {}

function M.map(mode, lhs, rhs, opts)
    local options = { silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

function M.file_seperator()
    if jit and jit.os == "Windows" then
        return "\\"
    end
    return "/"
end

function M.join_paths(...)
    return table.concat({ ... }, M.file_seperator())
end

return M
