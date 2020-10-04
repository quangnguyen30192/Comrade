"=============================================================================
" AUTHOR:  beeender <chenmulong at gmail.com>
" License: GPLv3
"=============================================================================

" Command definitions

let s:comrade_major_version = 0
let s:comrade_minor_version = 1
let s:comrade_patch_version = 1
let g:comrade_version = s:comrade_major_version .
      \ '.' . s:comrade_minor_version .
      \ '.' . s:comrade_patch_version
let g:comrade_enabled = get(g:, 'comrade_enabled', v:false)

let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let s:init_path = s:path . '/init.py'

function! s:comrade_init() abort
  if exists('s:comrade_loaded')
    return
  endif
  let s:comrade_loaded = v:true

  command! -nargs=0 ComradeFix call comrade#fixer#FixAtCursor()
  let g:comrade_enabled = v:true
  exe 'py3file' s:init_path

  call comrade#events#Init()
endfunction

" Start at will
command! -nargs=0 ComradeInit call <SID>comrade_init()

" Start on vim startup if g:comrade_enabled was set
if g:comrade_enabled
  call <SID>comrade_init()
endif
