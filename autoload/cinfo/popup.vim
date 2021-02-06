function! cinfo#popup#show(output: list<string>)
  # open temporary popup
  popup_atcursor(output, {
    'pos': 'topleft',
    'moved': 'any',
    'padding': [0, 1, 0, 1],
    'wrap': v:false,
    'posinvert': true,
    'time': 3000,
  })
endfunction
