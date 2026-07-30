return {
  'vimwiki/vimwiki',
  enabled = false,
  init = function()
    vim.g.vimwiki_path = '$XDG_SHARE_HOME/vimwiki'
    vim.g.vimwiki_syntax = 'markdown'
    vim.g.vimwiki_ext = 'md'
  end,
}
