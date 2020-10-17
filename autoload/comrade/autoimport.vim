function! comrade#autoimport#CompletionDone() abort
  if !has_key(v:completed_item, 'abbr')
    return
  endif

  let importLine = s:ParseImportLine()
  if !empty(l:importLine) && !search(l:importLine, 'n')
    call appendbufline(bufnr(), 2, l:importLine)
  endif
endfunction

function! s:ParseImportLine() abort
  let importInfo = v:completed_item['abbr']

  let indexOfStartParentheses = stridx(l:importInfo, '(')
  if indexOfStartParentheses == -1
    return ''
  endif
  let indexOfEndParentheses = stridx(l:importInfo, ')')
  if indexOfEndParentheses == -1
    return ''
  endif

  let packageOfImport = strpart(l:importInfo, l:indexOfStartParentheses + 1, indexOfEndParentheses - indexOfStartParentheses - 1)
  return printf('import %s.%s', l:packageOfImport, v:completed_item['word'])
endfunction
