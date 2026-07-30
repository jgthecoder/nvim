-- monolith.lua
-- A minimal high-contrast dark theme for Neovim.
-- Philosophy: everything is stone. Only keywords, strings, and comments emerge.

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "monolith"
vim.o.background = "dark"

local hi = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ── Palette ───────────────────────────────────────────────────────────────────
-- All tones are desaturated. No hue is vivid — contrast comes from luminance.
local p = {
  bg         = "#181818", -- near-black canvas
  bg_subtle  = "#191919", -- slightly lifted surface (statusline, float bg)
  bg_select  = "#222222", -- visual selection, cursor line
  border     = "#2a2a2a", -- splits, borders, column rules
  fg_dim     = "#3d3d3d", -- line numbers, fold markers, non-text
  fg_mute    = "#666666", -- inactive / secondary UI chrome
  fg_base    = "#c0c0c0", -- plain code — identifiers, operators, punctuation
  fg_bright  = "#e8e8e8", -- brightest neutral — used sparingly

  -- The only three "colors" — all muted, contrasting via hue + luminance:
  keyword    = "#a8b8d0", -- desaturated steel-blue  → keywords, control flow
  string     = "#9db89a", -- desaturated sage-green  → string literals
  comment    = "#5a5a5a", -- mid-grey, clearly below fg_base → comments
}

-- ── Editor Chrome ─────────────────────────────────────────────────────────────
hi("Normal",         { fg = p.fg_base,   bg = "None" }) -- p.bg
hi("NormalNC",       { fg = p.fg_base,   bg = "None" }) -- p.bg
hi("NormalFloat",    { fg = p.fg_base,   bg = "None" }) -- p.bg_subtle
hi("FloatBorder",    { fg = p.border,    bg = "None"}) -- p.bg_subtle
hi("FloatTitle",     { fg = p.fg_mute,   bg = "None" }) -- p.bg_subtle

hi("Cursor",         { fg = p.bg,        bg = p.fg_bright })
hi("CursorIM",       { fg = p.bg,        bg = p.fg_bright })
hi("TermCursor",     { fg = p.bg,        bg = p.fg_bright })
hi("CursorLine",     { bg = p.bg_select })
hi("CursorColumn",   { bg = p.bg_select })
hi("CursorLineNr",   { fg = p.keyword,   bg = p.bg_select, bold = true })

-- Changed column backgrounds from "None" to explicit p.bg for solid framing
hi("LineNr",         { fg = p.fg_dim,    bg = "None" }) --- p.bg
hi("LineNrAbove",    { fg = p.fg_dim,    bg = "None" }) --- p.bg
hi("LineNrBelow",    { fg = p.fg_dim,    bg = "None" }) --- p.bg
hi("SignColumn",     { fg = p.fg_dim,    bg = "None" }) --- p.bg
hi("FoldColumn",     { fg = p.fg_dim,    bg = "None" }) --- p.bg
hi("Folded",         { fg = p.fg_mute,   bg = "None" }) --- p.bg_subtle

hi("StatusLine",     { fg = p.fg_mute,   bg = p.bg_subtle })
hi("StatusLineNC",   { fg = p.fg_dim,    bg = p.bg_subtle })
hi("WinBar",         { fg = p.fg_mute,   bg = p.bg })
hi("WinBarNC",       { fg = p.fg_dim,    bg = p.bg })
hi("WinSeparator",   { fg = p.border })
hi("VertSplit",      { fg = p.border })

hi("TabLine",        { fg = p.fg_mute,   bg = p.bg_subtle })
hi("TabLineSel",     { fg = p.fg_bright, bg = p.bg })
hi("TabLineFill",    { bg = p.bg_subtle })

hi("Pmenu",          { fg = p.fg_base,   bg = p.bg_subtle })
hi("PmenuSel",       { fg = p.fg_bright, bg = p.bg_select, bold = true })
hi("PmenuSbar",      { bg = p.bg_subtle })
hi("PmenuThumb",     { bg = p.border })
hi("PmenuKind",      { fg = p.fg_mute,   bg = p.bg_subtle })
hi("PmenuKindSel",   { fg = p.fg_mute,   bg = p.bg_select })
hi("PmenuExtra",     { fg = p.fg_dim,    bg = p.bg_subtle })
hi("PmenuExtraSel",  { fg = p.fg_dim,    bg = p.bg_select })

hi("Visual",         { bg = p.bg_select })
hi("VisualNOS",      { bg = p.bg_select })
hi("Search",         { fg = p.bg,        bg = p.fg_mute })
hi("IncSearch",      { fg = p.bg,        bg = p.fg_bright, bold = true })
hi("CurSearch",      { fg = p.bg,        bg = p.fg_bright, bold = true })
hi("Substitute",     { fg = p.bg,        bg = p.fg_mute })

hi("MatchParen",     { fg = p.fg_bright, bg = p.bg_select, bold = true })
hi("NonText",        { fg = p.fg_dim })
hi("SpecialKey",     { fg = p.fg_dim })
hi("Whitespace",     { fg = p.fg_dim })
hi("EndOfBuffer",    { fg = p.fg_dim })
hi("Conceal",        { fg = p.fg_dim })

hi("Directory",      { fg = p.fg_base })
hi("Title",          { fg = p.fg_bright, bold = true })
hi("Question",       { fg = p.fg_base })
hi("MoreMsg",        { fg = p.fg_mute })
hi("ModeMsg",        { fg = p.fg_mute })
hi("MsgArea",        { fg = p.fg_base })
hi("MsgSeparator",   { fg = p.border })
hi("ErrorMsg",       { fg = p.fg_bright, bold = true })
hi("WarningMsg",     { fg = p.fg_bright })

hi("DiffAdd",        { bg = "#1a2218" })
hi("DiffChange",     { bg = "#1a1f28" })
hi("DiffDelete",     { fg = p.fg_dim,    bg = "#221818" })
hi("DiffText",       { bg = "#222d3a", bold = true })
hi("Added",          { fg = "#6a8c66" })
hi("Changed",        { fg = "#6a7d96" })
hi("Removed",        { fg = "#8c6666" })

hi("SpellBad",       { undercurl = true, sp = p.fg_mute })
hi("SpellCap",       { undercurl = true, sp = p.fg_dim })
hi("SpellRare",      { undercurl = true, sp = p.fg_dim })
hi("SpellLocal",     { undercurl = true, sp = p.fg_dim })

hi("QuickFixLine",   { bg = p.bg_select })
hi("qfLineNr",       { fg = p.fg_mute })

-- ── Syntax — the three highlighted groups ────────────────────────────────────
hi("Keyword",        { fg = p.keyword, bold = true })
hi("Statement",      { fg = p.keyword, bold = true })
hi("Conditional",    { fg = p.keyword, bold = true })
hi("Repeat",         { fg = p.keyword, bold = true })
hi("Label",          { fg = p.keyword, bold = true })
hi("Operator",       { fg = p.fg_base })
hi("Exception",      { fg = p.keyword, bold = true })
hi("Include",        { fg = p.keyword, bold = true })
hi("Define",         { fg = p.keyword, bold = true })
hi("Macro",          { fg = p.keyword, bold = true })
hi("PreProc",        { fg = p.keyword, bold = true })
hi("PreCondit",      { fg = p.keyword, bold = true })
hi("StorageClass",   { fg = p.keyword, bold = true })
hi("Structure",      { fg = p.keyword, bold = true })
hi("Typedef",        { fg = p.keyword, bold = true })
hi("Type",           { fg = p.keyword, bold = true })
hi("Boolean",        { fg = p.keyword, bold = true })

hi("String",         { fg = p.string })
hi("Character",      { fg = p.string })
hi("Number",         { fg = p.fg_base })
hi("Float",          { fg = p.fg_base })
hi("SpecialChar",    { fg = p.string })

hi("Comment",        { fg = p.comment, italic = true })
hi("SpecialComment", { fg = p.comment, italic = true })
hi("Todo",           { fg = p.fg_mute,  bg = p.bg_subtle, bold = true })

hi("Identifier",     { fg = p.fg_base })
hi("Function",       { fg = p.fg_base })
hi("Constant",       { fg = p.fg_base })
hi("Special",        { fg = p.fg_base })
hi("Delimiter",      { fg = p.fg_base })
hi("Tag",            { fg = p.fg_base })
hi("Debug",          { fg = p.fg_base })
hi("Underlined",     { underline = true })
hi("Ignore",         { fg = p.fg_dim })
hi("Error",          { fg = p.fg_bright, bold = true, underline = true })

-- ── Treesitter ────────────────────────────────────────────────────────────────
hi("@keyword",                    { fg = p.keyword, bold = true })
hi("@keyword.import",             { fg = p.keyword, bold = true })
hi("@keyword.operator",           { fg = p.fg_base })
hi("@keyword.return",             { fg = p.keyword, bold = true })
hi("@keyword.conditional",        { fg = p.keyword, bold = true })
hi("@keyword.repeat",             { fg = p.keyword, bold = true })
hi("@keyword.exception",          { fg = p.keyword, bold = true })
hi("@keyword.type",               { fg = p.keyword, bold = true })
hi("@keyword.modifier",           { fg = p.keyword, bold = true })
hi("@keyword.coroutine",          { fg = p.keyword, bold = true })
hi("@keyword.function",           { fg = p.keyword, bold = true })
hi("@keyword.debug",              { fg = p.keyword, bold = true })
hi("@conditional",                { fg = p.keyword, bold = true })
hi("@repeat",                     { fg = p.keyword, bold = true })
hi("@include",                    { fg = p.keyword, bold = true })
hi("@exception",                  { fg = p.keyword, bold = true })
hi("@type.builtin",               { fg = p.keyword, bold = true })
hi("@type",                       { fg = p.keyword, bold = true })
hi("@storageclass",               { fg = p.keyword, bold = true })
hi("@attribute",                  { fg = p.keyword, bold = true })
hi("@attribute.builtin",          { fg = p.keyword, bold = true })

hi("@string",                     { link = "String" })
hi("@string.documentation",       { link = "String" })
hi("@string.regexp",              { link = "String" })
hi("@string.escape",              { fg = p.fg_mute })
hi("@string.special",             { link = "String" })
hi("@string.special.url",         { fg = p.fg_mute, underline = true })
hi("@string.special.path",        { link = "String" })
hi("@character",                  { link = "String" })
hi("@character.special",          { link = "String" })

hi("@comment",                    { link = "Comment" })
hi("@comment.documentation",      { link = "Comment" })
hi("@comment.error",              { fg = p.comment, italic = true })
hi("@comment.warning",            { fg = p.comment, italic = true })
hi("@comment.todo",               { link = "Todo" })
hi("@comment.note",               { link = "Comment" })

hi("@variable",                   { fg = p.fg_base })
hi("@variable.builtin",           { fg = p.fg_base })
hi("@variable.parameter",         { fg = p.fg_base })
hi("@variable.member",            { fg = p.fg_base })
hi("@constant",                   { fg = p.fg_base })
hi("@constant.builtin",           { fg = p.fg_base })
hi("@constant.macro",             { fg = p.fg_base })
hi("@function",                   { fg = p.fg_base })
hi("@function.builtin",           { fg = p.fg_base })
hi("@function.macro",             { fg = p.fg_base })
hi("@function.call",              { fg = p.fg_base })
hi("@function.method",            { fg = p.fg_base })
hi("@function.method.call",       { fg = p.fg_base })
hi("@constructor",                { fg = p.fg_base })
hi("@type.qualifier",             { fg = p.keyword, bold = true })
hi("@number",                     { fg = p.fg_base })
hi("@number.float",               { fg = p.fg_base })
hi("@boolean",                    { fg = p.keyword, bold = true })
hi("@operator",                   { fg = p.fg_base })
hi("@punctuation.bracket",        { fg = p.fg_base })
hi("@punctuation.delimiter",      { fg = p.fg_base })
hi("@punctuation.special",        { fg = p.fg_base })
hi("@label",                      { fg = p.keyword, bold = true })
hi("@namespace",                  { fg = p.fg_base })
hi("@module",                     { fg = p.fg_base })
hi("@module.builtin",             { fg = p.fg_base })
hi("@tag",                        { fg = p.fg_base })
hi("@tag.builtin",                { fg = p.fg_base })
hi("@tag.attribute",              { fg = p.fg_base })
hi("@tag.delimiter",              { fg = p.fg_base })
hi("@property",                   { fg = p.fg_base })
hi("@field",                      { fg = p.fg_base })
hi("@parameter",                  { fg = p.fg_base })
hi("@preproc",                    { fg = p.keyword, bold = true })
hi("@define",                     { fg = p.keyword, bold = true })
hi("@text",                       { fg = p.fg_base })
hi("@text.title",                 { fg = p.fg_bright, bold = true })
hi("@text.emphasis",              { italic = true })
hi("@text.strong",                { bold = true })
hi("@text.underline",             { underline = true })
hi("@text.strike",                { strikethrough = true })
hi("@text.uri",                   { fg = p.fg_mute, underline = true })
hi("@text.reference",             { fg = p.fg_base })
hi("@text.literal",               { link = "String" })

-- ── LSP Semantic Tokens ───────────────────────────────────────────────────────
hi("@lsp.type.keyword",           { fg = p.keyword, bold = true })
hi("@lsp.type.string",            { link = "String" })
hi("@lsp.type.comment",           { link = "Comment" })
hi("@lsp.type.number",            { fg = p.fg_base })
hi("@lsp.type.variable",          { fg = p.fg_base })
hi("@lsp.type.parameter",         { fg = p.fg_base })
hi("@lsp.type.property",          { fg = p.fg_base })
hi("@lsp.type.function",          { fg = p.fg_base })
hi("@lsp.type.method",            { fg = p.fg_base })
hi("@lsp.type.macro",             { fg = p.keyword, bold = true })
hi("@lsp.type.namespace",         { fg = p.keyword, bold = true })
hi("@lsp.type.type",              { fg = p.keyword, bold = true })
hi("@lsp.type.typeParameter",     { fg = p.keyword, bold = true })
hi("@lsp.type.struct",            { fg = p.keyword, bold = true })
hi("@lsp.type.enum",              { fg = p.keyword, bold = true })
hi("@lsp.type.enumMember",        { fg = p.keyword, bold = true })
hi("@lsp.type.interface",         { fg = p.keyword, bold = true })
hi("@lsp.type.class",             { fg = p.keyword, bold = true })
hi("@lsp.type.decorator",         { fg = p.keyword, bold = true })
hi("@lsp.type.operator",          { fg = p.fg_base })
hi("@lsp.type.modifier",          { fg = p.keyword, bold = true })
hi("@lsp.mod.deprecated",         { strikethrough = true })

-- ── LSP Diagnostics ───────────────────────────────────────────────────────────
hi("DiagnosticError",             { fg = "#7a5555" })
hi("DiagnosticWarn",              { fg = "#6a6450" })
hi("DiagnosticInfo",              { fg = p.fg_mute })
hi("DiagnosticHint",              { fg = p.fg_dim })
hi("DiagnosticOk",                { fg = "#4a6a46" })

hi("DiagnosticUnderlineError",    { undercurl = true, sp = "#7a5555" })
hi("DiagnosticUnderlineWarn",     { undercurl = true, sp = "#6a6450" })
hi("DiagnosticUnderlineInfo",     { undercurl = true, sp = p.fg_mute })
hi("DiagnosticUnderlineHint",     { undercurl = true, sp = p.fg_dim })

hi("DiagnosticVirtualTextError",  { fg = "#5a3d3d", italic = true })
hi("DiagnosticVirtualTextWarn",   { fg = "#4d4a38", italic = true })
hi("DiagnosticVirtualTextInfo",   { fg = p.fg_dim,  italic = true })
hi("DiagnosticVirtualTextHint",   { fg = p.fg_dim,  italic = true })

hi("DiagnosticSignError",         { fg = "#7a5555", bg = p.bg })
hi("DiagnosticSignWarn",          { fg = "#6a6450", bg = p.bg })
hi("DiagnosticSignInfo",          { fg = p.fg_mute, bg = p.bg })
hi("DiagnosticSignHint",          { fg = p.fg_dim,  bg = p.bg })

-- ── LSP UI ────────────────────────────────────────────────────────────────────
hi("LspReferenceText",            { bg = p.bg_select })
hi("LspReferenceRead",            { bg = p.bg_select })
hi("LspReferenceWrite",           { bg = p.bg_select, bold = true })
hi("LspInlayHint",                { fg = p.fg_dim,    bg = p.bg_subtle, italic = true })
hi("LspCodeLens",                 { fg = p.fg_dim,    italic = true })
hi("LspSignatureActiveParameter", { fg = p.fg_base,   bold = true, underline = true })

-- ── Telescope ─────────────────────────────────────────────────────────────────
hi("TelescopeNormal",         { fg = p.fg_base,   bg = p.bg_subtle })
hi("TelescopeBorder",         { fg = p.border,    bg = p.bg_subtle })
hi("TelescopeTitle",          { fg = p.fg_mute,   bg = p.bg_subtle })
hi("TelescopePromptNormal",   { fg = p.fg_bright, bg = p.bg_select })
hi("TelescopePromptBorder",   { fg = p.border,    bg = p.bg_select })
hi("TelescopePromptTitle",    { fg = p.fg_mute,   bg = p.bg_select })
hi("TelescopePromptPrefix",   { fg = p.fg_mute,   bg = p.bg_select })
hi("TelescopePromptCounter",  { fg = p.fg_dim,    bg = p.bg_select })
hi("TelescopeResultsNormal",  { fg = p.fg_base,   bg = p.bg_subtle })
hi("TelescopeSelectionCaret", { fg = p.fg_bright, bg = p.bg_select })
hi("TelescopeSelection",      { fg = p.fg_bright, bg = p.bg_select })
hi("TelescopeMatching",       { fg = p.fg_bright, bold = true })
hi("TelescopePreviewNormal",  { fg = p.fg_base,   bg = p.bg })
hi("TelescopePreviewBorder",  { fg = p.border,    bg = p.bg })
hi("TelescopePreviewTitle",   { fg = p.fg_mute,   bg = p.bg })

-- ── nvim-tree / neo-tree ──────────────────────────────────────────────────────
hi("NvimTreeNormal",          { fg = p.fg_base,   bg = p.bg_subtle })
hi("NvimTreeRootFolder",      { fg = p.fg_mute,   bold = true })
hi("NvimTreeFolderName",      { fg = p.fg_base })
hi("NvimTreeOpenedFolderName",{ fg = p.fg_bright })
hi("NvimTreeFolderIcon",      { fg = p.fg_mute })
hi("NvimTreeEmptyFolderName", { fg = p.fg_dim })
hi("NvimTreeFileName",        { fg = p.fg_base })
hi("NvimTreeOpenedFile",      { fg = p.fg_bright })
hi("NvimTreeIndentMarker",    { fg = p.fg_dim })
hi("NvimTreeGitDirty",        { fg = "#6a7d96" })
hi("NvimTreeGitNew",          { fg = "#6a8c66" })
hi("NvimTreeGitDeleted",      { fg = "#8c6666" })

-- ── gitsigns ──────────────────────────────────────────────────────────────────
hi("GitSignsAdd",             { fg = "#4a6a46", bg = p.bg })
hi("GitSignsChange",          { fg = "#4a5f78", bg = p.bg })
hi("GitSignsDelete",          { fg = "#6a4646", bg = p.bg })
hi("GitSignsAddNr",           { fg = "#4a6a46", bg = p.bg })
hi("GitSignsChangeNr",        { fg = "#4a5f78", bg = p.bg })
hi("GitSignsDeleteNr",        { fg = "#6a4646", bg = p.bg })
hi("GitSignsAddLn",           { bg = "#1a2218" })
hi("GitSignsChangeLn",        { bg = "#1a1f28" })
hi("GitSignsDeleteLn",        { bg = "#221818" })

-- ── which-key ─────────────────────────────────────────────────────────────────
hi("WhichKey",          { fg = p.fg_base })
hi("WhichKeyDesc",      { fg = p.fg_mute })
hi("WhichKeyGroup",     { fg = p.keyword })
hi("WhichKeySeparator", { fg = p.fg_dim })
hi("WhichKeyBorder",    { fg = p.border })
hi("WhichKeyNormal",    { bg = p.bg_subtle })

-- ── indent-blankline ──────────────────────────────────────────────────────────
hi("IblIndent",   { fg = p.fg_dim })
hi("IblScope",    { fg = p.border })
hi("IndentBlanklineChar",       { fg = p.fg_dim })
hi("IndentBlanklineContextChar",{ fg = p.border })

-- ── nvim-cmp ──────────────────────────────────────────────────────────────────
hi("CmpItemAbbr",           { fg = p.fg_base })
hi("CmpItemAbbrMatch",      { fg = p.fg_bright, bold = true })
hi("CmpItemAbbrMatchFuzzy", { fg = p.fg_bright, bold = true })
hi("CmpItemAbbrDeprecated", { fg = p.fg_dim,    strikethrough = true })
hi("CmpItemMenu",           { fg = p.fg_dim,    italic = true })
hi("CmpItemKind",           { fg = p.fg_mute })

-- ── Lualine Integration ───────────────────────────────────────────────────────
-- Muted stone palette: blends completely into the editor frame to preserve focus.
package.loaded["lualine.themes.monolith"] = {
  normal = {
    a = { fg = p.fg_base, bg = p.bg_select, bold = true },
    b = { fg = p.fg_mute, bg = p.bg_subtle },
    c = { fg = p.fg_dim,  bg = p.bg_subtle },
  },
  insert = {
    a = { fg = p.fg_bright, bg = p.bg_select, bold = true },
    b = { fg = p.fg_mute,   bg = p.bg_subtle },
  },
  visual = {
    a = { fg = p.comment, bg = p.bg_select, bold = true },
    b = { fg = p.fg_mute, bg = p.bg_subtle },
  },
  replace = {
    a = { fg = p.fg_bright, bg = p.bg_select, bold = true },
    b = { fg = p.fg_mute,   bg = p.bg_subtle },
  },
  inactive = {
    a = { fg = p.fg_dim, bg = p.bg_subtle },
    b = { fg = p.fg_dim, bg = p.bg_subtle },
    c = { fg = p.fg_dim, bg = p.bg_subtle },
  },
}
