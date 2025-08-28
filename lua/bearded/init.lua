local default_palette = require('bearded.palette')
local config = require('bearded.config')
local highlights = require('bearded.highlights')

local M = {}

M.palette = default_palette
M.style = config.defaults()

---@param opts { palette?: table, style?: table }
function M.setup(opts)
    opts = opts or {}
    if opts.palette then
        M.palette = vim.tbl_deep_extend('force', M.palette, opts.palette)
    end
    if opts.style then
        M.style = vim.tbl_deep_extend('force', M.style, opts.style)
    end
end


function M.load()
    if vim.g.colors_name then
        vim.cmd('highlight clear')
    end

    if vim.fn.exists('syntax_on') == 1 then
        vim.cmd('syntax reset')
    end

    vim.o.termguicolors = true
    vim.g.colors_name = 'bearded'

    highlights.apply(M.palette, M.style)
end

return M
