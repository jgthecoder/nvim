-- gruber-darker.lua
-- Neovim colorscheme translated from gruber-darker-theme.el
-- Original by Jason R. Blevins, adapted by Alexey Kutepov (rexim)
-- Neovim port with Treesitter highlight groups

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "gruber-darker"
vim.o.background = "dark"
vim.o.termguicolors = true

local c = {
  fg        = "#e4e4ef",
  fg1       = "#f4f4ff",
  fg2       = "#f5f5f5",
  white     = "#ffffff",
  black     = "#000000",
  bg_1      = "#101010",
  bg        = "#181818",
  bg1       = "#282828",
  bg2       = "#453d41",
  bg3       = "#484848",
  bg4       = "#52494e",
  red_1     = "#c73c3f",
  red       = "#f43841",
  red1      = "#ff4f58",
  green     = "#73c936",
  yellow    = "#ffdd33",
  brown     = "#cc8c3c",
  quartz    = "#95a99f",
  niagara2  = "#303540",
  niagara1  = "#565f73",
  niagara   = "#96a6c8",
  wisteria  = "#9e95c7",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ── Editor UI ────────────────────────────────────────────────────────────────

hi("Normal",          { fg = c.fg,      bg = c.bg })
hi("NormalNC",        { fg = c.fg,      bg = c.bg })
hi("NormalFloat",     { fg = c.fg,      bg = c.bg1 })
hi("FloatBorder",     { fg = c.bg2,     bg = c.bg1 })

hi("Cursor",          { bg = c.yellow })
hi("CursorLine",      { bg = c.bg1 })
hi("CursorColumn",    { bg = c.bg1 })
hi("ColorColumn",     { bg = c.bg1 })

hi("LineNr",          { fg = c.bg4,     bg = c.bg })
hi("CursorLineNr",    { fg = c.yellow,  bg = c.bg })
hi("SignColumn",      { fg = c.bg4,     bg = c.bg })
hi("Folded",          { fg = c.quartz,  bg = c.bg1 })
hi("FoldColumn",      { fg = c.bg4,     bg = c.bg })

hi("StatusLine",      { fg = c.white,   bg = c.bg1 })
hi("StatusLineNC",    { fg = c.quartz,  bg = c.bg1 })
hi("WinBar",          { fg = c.white,   bg = c.bg1 })
hi("WinBarNC",        { fg = c.quartz,  bg = c.bg1 })
hi("WinSeparator",    { fg = c.bg2 })

hi("TabLine",         { fg = c.bg4,     bg = c.bg1 })
hi("TabLineSel",      { fg = c.yellow,  bg = c.bg,  bold = true })
hi("TabLineFill",     { bg = c.bg1 })

hi("Pmenu",           { fg = c.fg,      bg = c.bg1 })
hi("PmenuSel",        { fg = c.fg,      bg = c.bg_1 })
hi("PmenuSbar",       { bg = c.bg2 })
hi("PmenuThumb",      { bg = c.bg_1 })

hi("Visual",          { bg = c.bg3 })
hi("VisualNOS",       { bg = c.bg3 })
hi("Search",          { fg = c.black,   bg = c.fg2 })
hi("CurSearch",       { fg = c.black,   bg = c.fg2 })
hi("IncSearch",       { fg = c.black,   bg = c.fg2 })
hi("Substitute",      { fg = c.black,   bg = c.fg2 })

hi("MatchParen",      { bg = c.bg4 })

hi("Directory",       { fg = c.niagara, bold = true })
hi("Title",           { fg = c.niagara, bold = true })

hi("ModeMsg",         { fg = c.yellow })
hi("MoreMsg",         { fg = c.green })
hi("WarningMsg",      { fg = c.brown,   bold = true })
hi("ErrorMsg",        { fg = c.red1 })
hi("Question",        { fg = c.green })

hi("NonText",         { fg = c.bg2 })
hi("SpecialKey",      { fg = c.bg2 })
hi("Whitespace",      { fg = c.bg1 })
hi("EndOfBuffer",     { fg = c.bg1 })

hi("SpellBad",        { undercurl = true, sp = c.red })
hi("SpellCap",        { undercurl = true, sp = c.yellow })
hi("SpellLocal",      { undercurl = true, sp = c.green })
hi("SpellRare",       { undercurl = true, sp = c.quartz })

hi("Underlined",      { fg = c.niagara, underline = true })
hi("Bold",            { bold = true })
hi("Italic",          { italic = true })

hi("QuickFixLine",    { bg = c.bg1 })
hi("DiffAdd",         { fg = c.green })
hi("DiffDelete",      { fg = c.red1 })
hi("DiffChange",      { bg = c.bg2 })
hi("DiffText",        { bg = c.bg4 })

hi("WildMenu",        { fg = c.yellow,  bg = c.bg })

-- ── Diagnostics ──────────────────────────────────────────────────────────────

hi("DiagnosticError",            { fg = c.red1 })
hi("DiagnosticWarn",             { fg = c.brown })
hi("DiagnosticInfo",             { fg = c.niagara })
hi("DiagnosticHint",             { fg = c.quartz })
hi("DiagnosticOk",               { fg = c.green })

hi("DiagnosticUnderlineError",   { undercurl = true, sp = c.red })
hi("DiagnosticUnderlineWarn",    { undercurl = true, sp = c.yellow })
hi("DiagnosticUnderlineInfo",    { undercurl = true, sp = c.niagara })
hi("DiagnosticUnderlineHint",    { undercurl = true, sp = c.quartz })

hi("DiagnosticVirtualTextError", { fg = c.red1 })
hi("DiagnosticVirtualTextWarn",  { fg = c.brown })
hi("DiagnosticVirtualTextInfo",  { fg = c.niagara })
hi("DiagnosticVirtualTextHint",  { fg = c.quartz })

-- ── Traditional Syntax (`:syntax enable` fallback) ───────────────────────────

hi("Comment",        { fg = c.brown })
hi("Constant",       { fg = c.quartz })
hi("String",         { fg = c.green })
hi("Character",      { fg = c.green })
hi("Number",         { fg = c.wisteria })
hi("Boolean",        { fg = c.quartz })
hi("Float",          { fg = c.wisteria })

hi("Identifier",     { fg = c.fg1 })
hi("Function",       { fg = c.niagara })

hi("Statement",      { fg = c.yellow,   bold = true })
hi("Conditional",    { fg = c.yellow,   bold = true })
hi("Repeat",         { fg = c.yellow,   bold = true })
hi("Label",          { fg = c.yellow,   bold = true })
hi("Operator",       { fg = c.fg })
hi("Keyword",        { fg = c.yellow,   bold = true })
hi("Exception",      { fg = c.yellow,   bold = true })

hi("PreProc",        { fg = c.quartz })
hi("Include",        { fg = c.quartz })
hi("Define",         { fg = c.quartz })
hi("Macro",          { fg = c.quartz })
hi("PreCondit",      { fg = c.quartz })

hi("Type",           { fg = c.quartz })
hi("StorageClass",   { fg = c.yellow,   bold = true })
hi("Structure",      { fg = c.quartz })
hi("Typedef",        { fg = c.quartz })

hi("Special",        { fg = c.yellow })
hi("SpecialChar",    { fg = c.yellow })
hi("Tag",            { fg = c.yellow })
hi("Delimiter",      { fg = c.fg })
hi("SpecialComment", { fg = c.brown })
hi("Debug",          { fg = c.red1 })

hi("Error",          { fg = c.red1 })
hi("Todo",           { fg = c.yellow,   bold = true })

-- ── Treesitter highlight groups ───────────────────────────────────────────────
-- Follows the standard @xxx.yyy namespace introduced in nvim-treesitter 0.9+

-- Comments & Documentation
hi("@comment",                    { fg = c.brown })
hi("@comment.documentation",      { fg = c.green })
hi("@comment.error",              { fg = c.red })
hi("@comment.warning",            { fg = c.brown,   bold = true })
hi("@comment.todo",               { fg = c.yellow,  bold = true })
hi("@comment.note",               { fg = c.niagara, bold = true })

-- Literals
hi("@string",                     { fg = c.green })
hi("@string.documentation",       { fg = c.green })
hi("@string.escape",              { fg = c.yellow })
hi("@string.special",             { fg = c.yellow })
hi("@string.special.url",         { fg = c.niagara, underline = true })
hi("@string.regexp",              { fg = c.green })

hi("@character",                  { fg = c.green })
hi("@character.special",          { fg = c.yellow })

hi("@number",                     { fg = c.wisteria })
hi("@number.float",               { fg = c.wisteria })
hi("@boolean",                    { fg = c.quartz })

-- Types
hi("@type",                       { fg = c.quartz })
hi("@type.builtin",               { fg = c.quartz })
hi("@type.definition",            { fg = c.quartz })
hi("@type.qualifier",             { fg = c.yellow,  bold = true })

hi("@attribute",                  { fg = c.quartz })
hi("@attribute.builtin",          { fg = c.quartz })
hi("@property",                   { fg = c.fg1 })

-- Functions
hi("@function",                   { fg = c.niagara })
hi("@function.builtin",           { fg = c.yellow })
hi("@function.call",              { fg = c.niagara })
hi("@function.macro",             { fg = c.quartz })
hi("@function.method",            { fg = c.niagara })
hi("@function.method.call",       { fg = c.niagara })

hi("@constructor",                { fg = c.niagara })

-- Keywords
hi("@keyword",                    { fg = c.yellow,  bold = true })
hi("@keyword.coroutine",          { fg = c.yellow,  bold = true })
hi("@keyword.function",           { fg = c.yellow,  bold = true })
hi("@keyword.operator",           { fg = c.yellow,  bold = true })
hi("@keyword.import",             { fg = c.quartz })
hi("@keyword.type",               { fg = c.quartz })
hi("@keyword.modifier",           { fg = c.yellow,  bold = true })
hi("@keyword.repeat",             { fg = c.yellow,  bold = true })
hi("@keyword.return",             { fg = c.yellow,  bold = true })
hi("@keyword.debug",              { fg = c.red1 })
hi("@keyword.exception",          { fg = c.yellow,  bold = true })
hi("@keyword.conditional",        { fg = c.yellow,  bold = true })
hi("@keyword.conditional.ternary",{ fg = c.yellow })
hi("@keyword.directive",          { fg = c.quartz })
hi("@keyword.directive.define",   { fg = c.quartz })

-- Identifiers
hi("@variable",                   { fg = c.fg1 })
hi("@variable.builtin",           { fg = c.yellow })
hi("@variable.parameter",         { fg = c.fg1 })
hi("@variable.parameter.builtin", { fg = c.yellow })
hi("@variable.member",            { fg = c.fg1 })

hi("@constant",                   { fg = c.quartz })
hi("@constant.builtin",           { fg = c.quartz })
hi("@constant.macro",             { fg = c.quartz })

hi("@module",                     { fg = c.niagara })
hi("@module.builtin",             { fg = c.yellow })
hi("@label",                      { fg = c.yellow,  bold = true })

-- Punctuation & Operators
hi("@operator",                   { fg = c.fg })
hi("@punctuation.bracket",        { fg = c.fg })
hi("@punctuation.delimiter",      { fg = c.fg })
hi("@punctuation.special",        { fg = c.yellow })

-- Markup (Markdown, RST, etc.)
hi("@markup.strong",              { bold = true })
hi("@markup.italic",              { italic = true })
hi("@markup.strikethrough",       { strikethrough = true })
hi("@markup.underline",           { underline = true })
hi("@markup.heading",             { fg = c.niagara, bold = true })
hi("@markup.heading.1",           { fg = c.niagara, bold = true })
hi("@markup.heading.2",           { fg = c.niagara, bold = true })
hi("@markup.heading.3",           { fg = c.niagara, bold = true })
hi("@markup.heading.4",           { fg = c.niagara })
hi("@markup.heading.5",           { fg = c.niagara })
hi("@markup.heading.6",           { fg = c.quartz })
hi("@markup.quote",               { fg = c.quartz,  italic = true })
hi("@markup.math",                { fg = c.green })
hi("@markup.link",                { fg = c.niagara, underline = true })
hi("@markup.link.label",          { fg = c.niagara })
hi("@markup.link.url",            { fg = c.niagara, underline = true })
hi("@markup.raw",                 { fg = c.green })
hi("@markup.raw.block",           { fg = c.green })
hi("@markup.list",                { fg = c.yellow })
hi("@markup.list.checked",        { fg = c.green })
hi("@markup.list.unchecked",      { fg = c.quartz })

-- Tags (HTML/JSX/XML)
hi("@tag",                        { fg = c.niagara })
hi("@tag.builtin",                { fg = c.yellow })
hi("@tag.attribute",              { fg = c.fg1 })
hi("@tag.delimiter",              { fg = c.fg })

-- Diffs
hi("@diff.plus",                  { fg = c.green })
hi("@diff.minus",                 { fg = c.red1 })
hi("@diff.delta",                 { fg = c.yellow })

-- ── LSP semantic tokens ───────────────────────────────────────────────────────

hi("@lsp.type.class",             { fg = c.quartz })
hi("@lsp.type.comment",           { fg = c.brown })
hi("@lsp.type.decorator",         { fg = c.quartz })
hi("@lsp.type.enum",              { fg = c.quartz })
hi("@lsp.type.enumMember",        { fg = c.quartz })
hi("@lsp.type.event",             { fg = c.yellow })
hi("@lsp.type.function",          { fg = c.niagara })
hi("@lsp.type.interface",         { fg = c.quartz })
hi("@lsp.type.keyword",           { fg = c.yellow,  bold = true })
hi("@lsp.type.macro",             { fg = c.quartz })
hi("@lsp.type.method",            { fg = c.niagara })
hi("@lsp.type.modifier",          { fg = c.yellow,  bold = true })
hi("@lsp.type.namespace",         { fg = c.niagara })
hi("@lsp.type.number",            { fg = c.wisteria })
hi("@lsp.type.operator",          { fg = c.fg })
hi("@lsp.type.parameter",         { fg = c.fg1 })
hi("@lsp.type.property",          { fg = c.fg1 })
hi("@lsp.type.regexp",            { fg = c.green })
hi("@lsp.type.string",            { fg = c.green })
hi("@lsp.type.struct",            { fg = c.quartz })
hi("@lsp.type.type",              { fg = c.quartz })
hi("@lsp.type.typeParameter",     { fg = c.quartz })
hi("@lsp.type.variable",          { fg = c.fg1 })

hi("@lsp.mod.deprecated",         { strikethrough = true })
hi("@lsp.mod.readonly",           { fg = c.quartz })
hi("@lsp.mod.static",             { fg = c.quartz })

-- ── Plugin integrations ───────────────────────────────────────────────────────

-- nvim-cmp / completion
hi("CmpItemAbbr",           { fg = c.fg })
hi("CmpItemAbbrDeprecated", { fg = c.quartz,   strikethrough = true })
hi("CmpItemAbbrMatch",      { fg = c.green })
hi("CmpItemAbbrMatchFuzzy", { fg = c.green })
hi("CmpItemKind",           { fg = c.niagara })
hi("CmpItemMenu",           { fg = c.brown })

-- Telescope
hi("TelescopeNormal",         { fg = c.fg,      bg = c.bg })
hi("TelescopeBorder",         { fg = c.bg2,     bg = c.bg })
hi("TelescopePromptBorder",   { fg = c.bg2 })
hi("TelescopeSelection",      { bg = c.bg1 })
hi("TelescopeSelectionCaret", { fg = c.yellow })
hi("TelescopeMatching",       { fg = c.green })
hi("TelescopeResultsTitle",   { fg = c.niagara })
hi("TelescopePreviewTitle",   { fg = c.niagara })
hi("TelescopePromptTitle",    { fg = c.yellow })

-- Gitsigns / git
hi("GitSignsAdd",          { fg = c.green })
hi("GitSignsChange",       { fg = c.brown })
hi("GitSignsDelete",       { fg = c.red1 })
hi("GitSignsAddNr",        { fg = c.green })
hi("GitSignsChangeNr",     { fg = c.brown })
hi("GitSignsDeleteNr",     { fg = c.red1 })

-- Neotree / nvim-tree
hi("NeoTreeDirectoryName", { fg = c.niagara, bold = true })
hi("NeoTreeFileName",      { fg = c.fg })
hi("NeoTreeGitAdded",      { fg = c.green })
hi("NeoTreeGitModified",   { fg = c.brown })
hi("NeoTreeGitDeleted",    { fg = c.red1 })

-- Which-key
hi("WhichKey",             { fg = c.wisteria })
hi("WhichKeyGroup",        { fg = c.niagara })
hi("WhichKeyDesc",         { fg = c.fg })
hi("WhichKeySeparator",    { fg = c.bg4 })
hi("WhichKeyFloat",        { bg = c.bg1 })

-- Indent-blankline
hi("IblIndent",            { fg = c.bg1 })
hi("IblScope",             { fg = c.bg4 })

-- Mini.nvim statusline / indentscope (if used)
hi("MiniIndentscopeSymbol",{ fg = c.bg4 })
hi("MiniStatuslineModeNormal",  { fg = c.black,  bg = c.yellow,  bold = true })
hi("MiniStatuslineModeInsert",  { fg = c.black,  bg = c.green,   bold = true })
hi("MiniStatuslineModeVisual",  { fg = c.black,  bg = c.niagara, bold = true })
hi("MiniStatuslineModeCommand", { fg = c.black,  bg = c.brown,   bold = true })
hi("MiniStatuslineModeOther",   { fg = c.black,  bg = c.quartz,  bold = true })
hi("MiniStatuslineFilename",    { fg = c.white,  bg = c.bg1 })
hi("MiniStatuslineFileinfo",    { fg = c.quartz, bg = c.bg1 })
hi("MiniStatuslineInactive",    { fg = c.quartz, bg = c.bg1 })

-- Notify
hi("NotifyERRORBorder", { fg = c.red1 })
hi("NotifyWARNBorder",  { fg = c.brown })
hi("NotifyINFOBorder",  { fg = c.niagara })
hi("NotifyDEBUGBorder", { fg = c.quartz })
hi("NotifyTRACEBorder", { fg = c.wisteria })
hi("NotifyERRORIcon",   { fg = c.red1 })
hi("NotifyWARNIcon",    { fg = c.brown })
hi("NotifyINFOIcon",    { fg = c.niagara })
hi("NotifyDEBUGIcon",   { fg = c.quartz })
hi("NotifyTRACEIcon",   { fg = c.wisteria })
hi("NotifyERRORTitle",  { fg = c.red1 })
hi("NotifyWARNTitle",   { fg = c.brown })
hi("NotifyINFOTitle",   { fg = c.niagara })
hi("NotifyDEBUGTitle",  { fg = c.quartz })
hi("NotifyTRACETitle",  { fg = c.wisteria })
