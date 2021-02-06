function! cinfo#popup#show(output)
  if exists('*popup_atcursor')
    " open temporary popup
    let l:winid = popup_atcursor(a:output, {
          \   'pos': 'topleft',
          \   'moved': 'any',
          \   'padding': [0, 1, 0, 1],
          \   'wrap': v:false,
          \   'posinvert': v:true,
          \   'time': 3000,
          \ })
  elseif exists('*nvim_create_buf') && exists('*nvim_open_win')
    let l:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(l:buf, 0, -1, v:true, a:output)
    let l:opts = s:nvim_get_winopts(a:output)
    let l:opts['relative'] = 'cursor'
    let l:opts['col'] = 1
    let l:opts['row'] = 1
    let l:opts['anchor'] = 'NW'
    let l:opts['style'] = 'minimal'
    let s:winid = nvim_open_win(l:buf, 0, l:opts)
    " optional: change highlight, otherwise Pmenu is used
    call nvim_win_set_option(s:winid, 'winhl', 'Normal:Cinfo')
    augroup cinfo-close
      au!
      autocmd CursorMoved * ++once call cinfo#popup#close()
    augroup END
  endif
endfunction

let s:winid = -1
function! cinfo#popup#close()
  if s:winid < 0
    return
  endif
  call nvim_win_close(s:winid, v:true)
  let s:winid = -1
endfunction

function! s:nvim_get_winopts(output)
  let l:height = len(a:output)
  let l:width = 1
  for l:line in a:output
    if len(l:line) > l:width
      let l:width = len(l:line)
    endif
  endfor
  return {
    \ 'height': l:height,
    \ 'width': l:width,
    \ }
endfunction
