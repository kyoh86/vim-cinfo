function! cinfo#popup#show(output)
  " open temporary popup
  call popup_atcursor(a:output, {
    'pos': 'topleft',
    'moved': 'any',
    'padding': [0, 1, 0, 1],
    'wrap': v:false,
    'posinvert': v:true,
    'time': 3000,
  })
endfunction
