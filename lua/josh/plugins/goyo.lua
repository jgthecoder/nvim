return {
    "junegunn/goyo.vim",
    config = function()
        vim.cmd [[
        function! s:goyo_enter()
        if executable('tmux') && strlen($TMUX)
            silent !tmux set status off
            silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
            endif
            set noshowmode
            set noshowcmd
            set scrolloff=999
            set linebreak
            set wrap
            set spell spelllang=en_us
            endfunction

            function! s:goyo_leave()
            if executable('tmux') && strlen($TMUX)
                silent !tmux set status on
                silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
                endif
                set showmode
                set nowrap
                set nolinebreak
                set nospell
                set showcmd
                set scrolloff=5
                endfunction

                autocmd! User GoyoEnter nested call <SID>goyo_enter()
                autocmd! User GoyoLeave nested call <SID>goyo_leave()

            ]]
            end
}
