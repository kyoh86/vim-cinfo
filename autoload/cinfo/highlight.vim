function! s:get_syn_id(transparent: bool): number
  const synid = synID(line('.'), col('.'), 1)
  return transparent ? synIDtrans(synid) : synid
endfunction
function! s:get_syn_name(synid: number): string
  return synIDattr(synid, 'name')
endfunction
function! s:get_highlight_info(transparent: bool): list<string>
  const syn_name = s:get_syn_name(s:get_syn_id(transparent))
  if syn_name ==# ''
    return []
  endif
  return split(execute("verbose highlight " .. syn_name), "\n")
endfunction

" Show highlight info in popup 
function! cinfo#highlight#show()
  # format output
  var output: list<string> = s:get_highlight_info(false) + s:get_highlight_info(true)
  if len(output) == 0
    output = ['<No highlight>']
  endif

  cinfo#popup#show(output)
endfunction
