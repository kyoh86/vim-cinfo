" Show buffer info in popup 
function! cinfo#buffer#show()
  # format output
  const output = [
    'File type:   ' .. &filetype,
    'Encoding:    ' .. &encoding,
    'File format: ' .. &fileformat,
    'Syntax:      ' .. &syntax,
  ]
  cinfo#popup#show(output)
endfunction
