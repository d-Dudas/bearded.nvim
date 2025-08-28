
for _, m in ipairs({
  'bearded', 'bearded.init', 'bearded.highlights', 'bearded.palette', 'bearded.config'
}) do
  package.loaded[m] = nil
end

local function safe_require(name)
  local ok, mod = pcall(require, name)
  if not ok then
    vim.api.nvim_err_writeln('[bearded] require("' .. name .. '") failed: ' .. tostring(mod))
    return nil
  end
  return mod
end

-- try core module, then explicit init
local core = safe_require('bearded') or safe_require('bearded.init')
if not core or type(core.load) ~= 'function' then
  vim.api.nvim_err_writeln('[bearded] core module missing load()')
  return
end

-- apply scheme (core handles :hi clear / syntax reset / colors_name)
local ok, err = pcall(core.load)
if not ok then
  vim.api.nvim_err_writeln('[bearded] load() error: ' .. tostring(err))
end
