" Show buffer info in popup 
function! cinfo#buffer#show()
  " format output
  let l:output = [
    'File type:   ' .. &filetype,
    'Encoding:    ' .. &encoding,
    'File format: ' .. &fileformat,
    'Syntax:      ' .. &syntax,
  ]
  return cinfo#popup#show(l:output)
endfunction
