"=============================================================================
" AUTHOR:  beeender <chenmulong at gmail.com>
" License: GPLv3
"=============================================================================

function! comrade#events#Enable() abort
    augroup ComradeEvents
        autocmd!

        autocmd BufEnter * call comrade#buffer#Notify()
        autocmd BufUnload * call comrade#buffer#UnregisterCurrent()

        autocmd CursorMoved,CursorHold * call comrade#cursor#EchoCursorWarningWithDelay()
        " Look for a warning to echo as soon as we leave Insert mode.
        " The script's position variable used when moving the cursor will
        " not be changed here.
        autocmd InsertLeave * call comrade#cursor#EchoCursorWarning()
    augroup END
endfunction

function! comrade#events#RegisterAutoImportOnCompletionDone() abort
  augroup support_autoimport_when_completiondone
    autocmd!
    autocmd CompleteDone *.{java,kt,kts} call comrade#autoimport#CompletionDone()
  augroup END
endfunction
