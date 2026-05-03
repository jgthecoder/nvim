-- minimal.lua
-- A muted colorscheme that stays out of your way.
-- Place in ~/.config/nvim/colors/minimal.lua

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "minimal"
vim.opt.background = "dark"

local hi = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Palette
local bg        = "#1a1a1a"
local bg2       = "#222222"
local bg3       = "#2a2a2a"
-- local fg        = "#c8c0b8"        -- warm off-white
local fg        = "#F3F5F2"        -- warm off-white
local fg_dim    = "#7a7470"        -- dimmed foreground
local fg_muted  = "#4e4a47"        -- very dim, for punctuation
local green     = "#73c936"        -- muted green for strings
local teal      = "#95a99f"        -- grey-teal for types/imports
local yellow    = "#C4A882"        -- pale sandy ochre for builtins/keywords
local niagara   = "#96a6c8"
local yellow2   = "#ffdd33"
local red_dim   = "#8f5f5f"        -- muted red for errors
local brown     = "#cc8c3c"
local orange    = "#9e7a50"        -- muted orange for constants
local blue_dim  = "#5f7a8f"        -- muted blue for misc
local sel       = "#2e3a3a"        -- selection bg
local bg4 = "#52494e"
-- local line_nr   = "#3a3835"        -- line number color
local line_nr   = bg4
-- local comment   = "#4f5a52"        -- slightly green-tinted comment

-- ── Editor chrome ────────────────────────────────────────────────────────────
hi("Normal",        { fg = fg,       bg = "None" })
hi("NormalFloat",   { fg = fg,       bg = "None" })
hi("NormalNC",      { fg = fg_dim,   bg = bg })
hi("SignColumn",    { fg = fg_dim,   bg = "None" })
hi("ColorColumn",   {                bg = bg2 })
hi("CursorLine",    {                bg = bg2 })
hi("CursorLineNr",  { fg = yellow2,       bg = bg2, bold = true })
hi("LineNr",        { fg = line_nr })
hi("VertSplit",     { fg = bg3,      bg = bg })
hi("WinSeparator",  { fg = bg3,      bg = bg })
hi("StatusLine",    { fg = fg_dim,   bg = bg2 })
hi("StatusLineNC",  { fg = fg_muted, bg = bg })
hi("TabLine",       { fg = fg_dim,   bg = bg2 })
hi("TabLineFill",   { fg = fg_dim,   bg = bg2 })
hi("TabLineSel",    { fg = fg,       bg = bg3, bold = true })
hi("Pmenu",         { fg = fg,       bg = bg2 })
hi("PmenuSel",      { fg = fg,       bg = sel, bold = true })
hi("PmenuSbar",     {                bg = bg3 })
hi("PmenuThumb",    {                bg = fg_muted })
hi("Visual",        {                bg = sel })
hi("Search",        { fg = bg,       bg = yellow })
hi("IncSearch",     { fg = bg,       bg = yellow, bold = true })
hi("MatchParen",    { fg = yellow2,               bold = true, underline = true })
hi("NonText",       { fg = fg_muted })
hi("SpecialKey",    { fg = fg_muted })
hi("Folded",        { fg = fg_dim,   bg = bg2 })
hi("FoldColumn",    { fg = fg_muted, bg = bg })
hi("EndOfBuffer",   { fg = bg })
hi("Whitespace",    { fg = fg_muted })
hi("WildMenu",      { fg = fg,       bg = sel })
hi("QuickFixLine",  {                bg = bg3 })

-- ── Diagnostics ──────────────────────────────────────────────────────────────
hi("DiagnosticError",          { fg = red_dim })
hi("DiagnosticWarn",           { fg = orange })
hi("DiagnosticInfo",           { fg = blue_dim })
hi("DiagnosticHint",           { fg = teal })
hi("DiagnosticUnderlineError", { sp = red_dim,  underline = true })
hi("DiagnosticUnderlineWarn",  { sp = orange,   underline = true })
hi("DiagnosticUnderlineInfo",  { sp = blue_dim, underline = true })
hi("DiagnosticUnderlineHint",  { sp = teal,     underline = true })

-- ── Diff ─────────────────────────────────────────────────────────────────────
hi("DiffAdd",    { fg = green,   bg = "#1e2b1e" })
hi("DiffChange", { fg = orange,  bg = "#2a2318" })
hi("DiffDelete", { fg = red_dim, bg = "#2b1e1e" })
hi("DiffText",   { fg = orange,  bg = "#332c18", bold = true })

-- ── Classic syntax groups (fallback) ─────────────────────────────────────────
hi("Comment",        { fg = brown, italic = true })
hi("Constant",       { fg = yellow2 })
hi("String",         { fg = green })
hi("Character",      { fg = green })
hi("Number",         { fg = yellow2 })
hi("Boolean",        { fg = yellow2, bold = true })
hi("Float",          { fg = orange })
hi("Identifier",     { fg = fg })
hi("Function",       { fg = fg })
hi("Statement",      { fg = yellow2, bold = true })
hi("Conditional",    { fg = yellow2, bold = true })
hi("Repeat",         { fg = yellow2, bold = true })
hi("Label",          { fg = yellow2, bold = true })
hi("Operator",       { fg = fg_dim })
hi("Keyword",        { fg = yellow2, bold = true })
hi("Exception",      { fg = yellow2, bold = true })
hi("PreProc",        { fg = teal })
hi("Include",        { fg = teal })
hi("Define",         { fg = teal })
hi("Macro",          { fg = yellow2, bold = true })
hi("PreCondit",      { fg = teal })
hi("Type",           { fg = teal })
hi("StorageClass",   { fg = teal })
hi("Structure",      { fg = teal })
hi("Typedef",        { fg = teal })
hi("Special",        { fg = fg_dim })
hi("SpecialChar",    { fg = orange })
hi("Tag",            { fg = teal })
hi("Delimiter",      { fg = fg_muted })
hi("SpecialComment", { fg = brown, bold = true })
hi("Debug",          { fg = red_dim })
hi("Underlined",     { underline = true })
hi("Error",          { fg = red_dim, bold = true })
hi("Todo",           { fg = yellow2, bold = true })

-- ── Treesitter ────────────────────────────────────────────────────────────────

-- Variables & identifiers — plain foreground, no noise
hi("@variable",                  { fg = fg })
hi("@variable.builtin",          { fg = yellow2, bold = true })  -- self, this, etc.
hi("@variable.parameter",        { fg = fg })
hi("@variable.member",           { fg = fg })

-- Constants
hi("@constant",                  { fg = orange })
hi("@constant.builtin",          { fg = yellow2, bold = true })
hi("@constant.macro",            { fg = orange })

-- Strings
hi("@string",                    { fg = green })
hi("@string.documentation",      { fg = green, italic = true })
hi("@string.regexp",             { fg = green })
hi("@string.escape",             { fg = orange })
hi("@string.special",            { fg = orange })
hi("@string.special.symbol",     { fg = orange })
hi("@string.special.url",        { fg = blue_dim, underline = true })

-- Numbers & booleans
hi("@number",                    { fg = fg })
hi("@number.float",              { fg = fg })
hi("@boolean",                   { fg = yellow2, bold = true })

hi("@type",                      { fg = teal })
hi("@type.builtin",              { fg = teal })
hi("@type.definition",           { fg = teal })
hi("@type.qualifier",            { fg = teal })

-- Functions
hi("@function",                  { fg = niagara })
hi("@function.builtin",          { fg = yellow2, bold = true })
hi("@function.macro",            { fg = yellow2, bold = true })
hi("@function.method",           { fg = fg })
hi("@function.method.call",      { fg = fg })
hi("@function.call",             { fg = fg })
hi("@constructor",               { fg = teal })

-- Keywords & control flow — bold yellow to stand out just enough
hi("@keyword",                   { fg = yellow2, bold = true })
hi("@keyword.function",          { fg = yellow2, bold = true })
hi("@keyword.operator",          { fg = yellow2, bold = true })
hi("@keyword.import",            { fg = teal })
hi("@keyword.storage",           { fg = teal })
hi("@keyword.repeat",            { fg = yellow2, bold = true })
hi("@keyword.return",            { fg = yellow2, bold = true })
hi("@keyword.exception",         { fg = yellow2, bold = true })
hi("@keyword.conditional",       { fg = yellow2, bold = true })
hi("@keyword.conditional.ternary", { fg = yellow2, bold = true })
hi("@keyword.directive",         { fg = teal })
hi("@keyword.coroutine",         { fg = yellow2, bold = true })

-- Operators & punctuation — recede into background
hi("@operator",                  { fg = fg_dim })
hi("@punctuation.delimiter",     { fg = fg_muted })
hi("@punctuation.bracket",       { fg = fg_muted })
hi("@punctuation.special",       { fg = fg_dim })

-- Modules / namespaces / imports
hi("@module",                    { fg = teal })
hi("@module.builtin",            { fg = yellow, bold = true })
hi("@label",                     { fg = fg_dim })

-- Comments
hi("@comment",                   { fg = brown, italic = true })
hi("@comment.documentation",     { fg = brown, italic = true })
hi("@comment.todo",              { fg = yellow2, bold = true })
hi("@comment.warning",           { fg = orange, bold = true })
hi("@comment.error",             { fg = red_dim, bold = true })
hi("@comment.note",              { fg = teal, bold = true })

-- Attributes / decorators
hi("@attribute",                 { fg = teal })
hi("@attribute.builtin",         { fg = yellow2, bold = true })

-- Tags (HTML/JSX)
hi("@tag",                       { fg = teal })
hi("@tag.attribute",             { fg = fg })
hi("@tag.delimiter",             { fg = fg_muted })

-- Markup (Markdown, etc.)
hi("@markup.raw",                { fg = green })
hi("@markup.link",               { fg = blue_dim, underline = true })
hi("@markup.link.label",         { fg = fg })
hi("@markup.heading",            { fg = fg, bold = true })
hi("@markup.strong",             { bold = true })
hi("@markup.italic",             { italic = true })
hi("@markup.strikethrough",      { strikethrough = true })
hi("@markup.list",               { fg = fg_dim })

-- Misc
hi("@none",                      {})
hi("@conceal",                   { fg = fg_muted })
hi("@spell",                     {})
hi("@nospell",                   {})

-- ── LSP semantic tokens ───────────────────────────────────────────────────────
hi("@lsp.type.class",            { fg = teal })
hi("@lsp.type.enum",             { fg = teal })
hi("@lsp.type.enumMember",       { fg = orange })
hi("@lsp.type.interface",        { fg = teal })
hi("@lsp.type.namespace",        { fg = teal })
hi("@lsp.type.struct",           { fg = teal })
hi("@lsp.type.type",             { fg = teal })
hi("@lsp.type.typeAlias",        { fg = teal })
hi("@lsp.type.typeParameter",    { fg = teal })
hi("@lsp.type.macro",            { fg = yellow2, bold = true })
hi("@lsp.type.keyword",          { fg = yellow2, bold = true })
hi("@lsp.type.builtinType",      { fg = teal })
hi("@lsp.type.selfKeyword",      { fg = yellow2, bold = true })
hi("@lsp.type.comment",          { fg = comment, italic = true })
hi("@lsp.mod.deprecated",        { strikethrough = true })
hi("@lsp.mod.readonly",          { fg = orange })
