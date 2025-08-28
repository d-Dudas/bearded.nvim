local M = {}

local function hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

local function link(to, from)
    vim.api.nvim_set_hl(0, to, { link = from })
end


function M.apply(p, style)
    local bg = style.transparent and p.none or p.bg


    -- Terminal ANSI colors
    vim.g.terminal_color_0 = p.black
    vim.g.terminal_color_1 = p.red
    vim.g.terminal_color_2 = p.green
    vim.g.terminal_color_3 = p.yellow
    vim.g.terminal_color_4 = p.blue
    vim.g.terminal_color_5 = p.magenta
    vim.g.terminal_color_6 = p.cyan
    vim.g.terminal_color_7 = p.gray9
    vim.g.terminal_color_8 = p.gray5
    vim.g.terminal_color_9 = p.red
    vim.g.terminal_color_10 = p.green
    vim.g.terminal_color_11 = p.yellow
    vim.g.terminal_color_12 = p.blue
    vim.g.terminal_color_13 = p.magenta
    vim.g.terminal_color_14 = p.cyan
    vim.g.terminal_color_15 = p.fg

    -- Editor UI
    hl('Normal', { fg = p.fg, bg = bg })
    hl('NormalNC', { fg = p.fg, bg = bg })
    hl('NormalFloat', { fg = p.fg, bg = style.transparent and p.none or p.gray0, blend = style.float_blend })
    hl('FloatBorder', { fg = p.border, bg = style.transparent and p.none or p.gray0 })
    hl('FloatTitle', { fg = p.link, bg = style.transparent and p.none or p.gray0, bold = true })


    hl('LineNr', { fg = p.gray6, bg = bg })
    hl('CursorLineNr', { fg = p.fg, bg = bg, bold = true })
    hl('CursorLine', { bg = p.line })
    hl('CursorColumn', { bg = p.line })
    hl('ColorColumn', { bg = p.gray2 })
    hl('SignColumn', { fg = p.gray6, bg = bg })
    hl('FoldColumn', { fg = p.gray6, bg = bg })
    hl('Folded', { fg = p.gray8, bg = p.gray1 })


    hl('Pmenu', { fg = p.fg, bg = p.gray1 })
    hl('PmenuSel', { fg = p.black, bg = p.link, bold = true })
    hl('PmenuSbar', { bg = p.gray2 })
    hl('PmenuThumb', { bg = p.gray4 })


    hl('StatusLine', { fg = p.fg, bg = p.gray2 })
    hl('StatusLineNC', { fg = p.gray7, bg = p.gray1 })
    hl('WinSeparator', { fg = p.border, bg = bg })
    hl('TabLine', { fg = p.gray7, bg = p.gray1 })
    hl('TabLineSel', { fg = p.fg, bg = p.gray3, bold = true })
    hl('TabLineFill', { fg = p.gray6, bg = p.gray1 })


    hl('Search', { fg = p.black, bg = p.yellow, bold = true })
    hl('IncSearch', { fg = p.black, bg = p.orange, bold = true })
    hl('Visual', { bg = p.selection })
    hl('MatchParen', { fg = p.link, bold = true })


    hl('Title', { fg = p.link, bold = true })
    hl('Directory', { fg = p.link, bold = true })


    -- Diagnostics
    hl('DiagnosticError', { fg = p.error })
    hl('DiagnosticWarn', { fg = p.warn })
    hl('DiagnosticInfo', { fg = p.info })
    hl('DiagnosticHint', { fg = p.hint })
    hl('DiagnosticUnnecessary', { fg = p.warn, underline = true })


    hl('DiagnosticVirtualTextError', { fg = p.error, bg = p.gray1 })
    hl('DiagnosticVirtualTextWarn', { fg = p.warn, bg = p.gray1 })
    hl('DiagnosticVirtualTextInfo', { fg = p.info, bg = p.gray1 })
    hl('DiagnosticVirtualTextHint', { fg = p.hint, bg = p.gray1 })


    hl('DiagnosticUnderlineError', { sp = p.error, undercurl = true })
    hl('DiagnosticUnderlineWarn', { sp = p.warn, undercurl = true })
    hl('DiagnosticUnderlineInfo', { sp = p.info, undercurl = true })
    hl('DiagnosticUnderlineHint', { sp = p.hint, undercurl = true })


    -- Diff / VCS
    hl('DiffAdd', { fg = p.none, bg = "#10331a" })
    hl('DiffChange', { fg = p.none, bg = "#102b40" })
    hl('DiffDelete', { fg = p.none, bg = "#3a1015" })
    hl('DiffText', { fg = p.none, bg = "#174f7a" })


    hl('GitSignsAdd', { fg = p.green })
    hl('GitSignsChange', { fg = p.blue })
    hl('GitSignsDelete', { fg = p.red })


    -- Syntax (Vim default groups)
    hl('Comment', { fg = p.comment, italic = style.italic_comments })
    hl('Constant', { fg = p.cyan })
    hl('String', { fg = p.green })
    hl('Character', { fg = p.green })
    hl('Function', { fg = p.blue, bold = style.bold_functions })

    hl('Statement', { fg = p.magenta })
    hl('Conditional', { fg = p.magenta, italic = style.italic_keywords })
    hl('Repeat', { fg = p.magenta, italic = style.italic_keywords })
    hl('Label', { fg = p.yellow })
    hl('Operator', { fg = p.operator })
    hl('Keyword', { fg = p.keyword, italic = style.italic_keywords })
    hl('Exception', { fg = p.magenta })


    hl('PreProc', { fg = p.yellow })
    hl('Include', { fg = p.yellow })
    hl('Define', { fg = p.yellow })
    hl('Macro', { fg = p.yellow })
    hl('PreCondit', { fg = p.yellow })


    hl('Type', { fg = p.cyan })
    hl('StorageClass', { fg = p.cyan })
    hl('Structure', { fg = p.cyan })
    hl('Typedef', { fg = p.cyan })


    hl('Special', { fg = p.orange })
    hl('SpecialComment', { fg = p.orange })
    hl('Todo', { fg = p.blue, bg = p.gray1, bold = true })
    hl('Error', { fg = p.error, bold = true })
    hl('WarningMsg', { fg = p.warn })


    -- Treesitter
    hl('@comment', { fg = p.comment })
    hl('@string', { fg = p.string })
    hl('@character', { fg = p.character })
    hl('@number', { fg = p.number })
    hl('@boolean', { fg = p.boolean })
    hl('@float', { fg = p.float })


    hl('@constant', { fg = p.constant })
    hl('@constant.builtin', { fg = p.constant_builtin })
    hl('@constant.macro', { fg = p.constant_macro })


    hl('@variable', { fg = p.variable })
    hl('@variable.builtin', { fg = p.variable_builtin })
    hl('@variable.parameter', { fg = p.variable_parameter })
    hl('@field', { fg = p.field })
    hl('@property', { fg = p.property })


    hl('@function', { fg = p.function_ })
    hl('@function.builtin', { fg = p.function_builtin })
    hl('@method', { fg = p.method })
    hl('@constructor', { fg = p.constructor })


    hl('@keyword', { fg = p.keyword })
    hl('@keyword.function', { fg = p.keyword_function })
    hl('@keyword.operator', { fg = p.keyword_operator })
    hl('@conditional', { fg = p.conditional })
    hl('@repeat', { fg = p.repeat_ })
    hl('@label', { fg = p.label })


    hl('@type', { fg = p.type })
    hl('@type.builtin', { fg = p.type_builtin })
    hl('@storageclass', { fg = p.storageclass })

    hl('@namespace', { fg = p.namespace })
    hl('@module', { fg = p.module })

    hl('@operator', { fg = p.operator })
    hl('@punctuation', { fg = p.punctuation })
    hl('@punctuation.delimiter', { fg = p.punctuation_delimiter })
    hl('@punctuation.bracket', { fg = p.punctuation_bracket })


    -- LSP helpers
    hl('LspReferenceText', { bg = p.gray2 })
    hl('LspReferenceRead', { bg = p.gray2 })
    hl('LspReferenceWrite', { bg = p.gray2 })
    hl('LspSignatureActiveParameter', { fg = p.yellow, bold = true })
    hl('LspInlayHint', { fg = p.gray7, bg = p.gray1, italic = true })


    if style.dim_inactive then
        hl('NormalNC', { fg = p.gray7, bg = bg })
    end
end

return M
