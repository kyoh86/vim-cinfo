function! s:get_syn_id(transparent)
  let l:synid = synID(line('.'), col('.'), 1)
  if a:transparent
    return synIDtrans(l:synid)
  else
    return l:synid
  endif
endfunction

function! s:get_syn_name(synid)
  return synIDattr(a:synid, 'name')
endfunction

function! s:get_highlight_info(transparent)
  let l:syn_name = s:get_syn_name(s:get_syn_id(a:transparent))
  if l:syn_name ==# ''
    return []
  endif
  return split(execute("verbose highlight " .. l:syn_name), "\n")
endfunction

" Show highlight info in popup 
function! cinfo#highlight#show()
  " format output
  let l:output = s:get_highlight_info(v:false) + s:get_highlight_info(v:true)
  if len(l:output) == 0
    let l:output = ['<No highlight>']
  endif

  call cinfo#popup#show(l:output)
endfunction
