command! CursorInfo call cinfo#cursor#show()
nnoremap <silent> <Plug>(cinfo-show-cursor) :<C-u>CursorInfo<CR>

command! BufferInfo call cinfo#buffer#show()
nnoremap <silent> <Plug>(cinfo-show-buffer) :<C-u>BufferInfo<CR>

command! HighlightInfo call cinfo#highlight#show()
nnoremap <silent> <Plug>(cinfo-show-highlight) :<C-u>HighlightInfo<CR>
