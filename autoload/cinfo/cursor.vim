" Show cursor info in popup
function! cinfo#cursor#show()
  " get cursor line text
  let l:text = getline('.')
  let l:text_before = strpart(l:text, 0, col('.') - 1)
  let l:text_after = strpart(l:text, col('.') - 1)
  let l:char = strcharpart(l:text_after, 0, 1)

  " get cursor position informations
  let l:cur_row_idx = line('.')
  let l:cur_row_len = strchars(l:text)
  let l:cur_col_char_idx = strchars(l:text_before) + 1

  " get charcode informations
  let l:charcode = char2nr(l:char)
  let l:charcode_utf8 = trim(execute('normal g8'))

  " get buffer size
  let l:buf_lines = line('$')
  let l:buf_counts = wordcount()

  " format output
  let l:output = [
    'Line: ' .. l:cur_row_idx .. ' of ' .. l:buf_lines .. '; Col: ' .. l:cur_col_char_idx .. ' of ' .. l:cur_row_len,
    'Word: ' .. l:buf_counts['cursor_words'] .. ' of ' .. l:buf_counts['words'] .. '; Char: ' .. l:buf_counts['cursor_chars'] .. ' of ' .. l:buf_counts['chars'] .. '; Byte: ' .. l:buf_counts['cursor_bytes'] .. ' of ' .. l:buf_counts['bytes'],
    'Code: ' .. printf('"%s" {(%d)10 (%X)16 (%s)utf8}', char, charcode, charcode, charcode_utf8),
  ]
  call cinfo#popup#show(l:output)
endfunction
