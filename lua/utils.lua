local M = {}

function M.map(mode, lhs, rhs)
    local opt = {
        noremap = true,
        silent = true
    }
    vim.api.nvim_set_keymap(mode, lhs, rhs, opt)
end

function M.loadall()
    local fn, uv, api = vim.fn, vim.loop, vim.api
    local config_dir = vim.fn.stdpath("config") .. "/lua/config"
    local tmp = vim.split(fn.globpath(config_dir, "*.lua"), "\n")
    for _, f in ipairs(tmp) do
        local ff = f:sub(#plugins_dir + 2, -1)
        ff = ff:sub(0, #ff - 4)
        if ff ~= "init" then
            require("config/" .. ff)
        end
    end
end

function M.config(name)
    return string.format("require('config/' .. '%s')", name)
end

return M
