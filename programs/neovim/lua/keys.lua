function Map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local g = vim.g --  global variables


--nnoremap <silent> <C-k> :FloatermToggle<CR>
--tnoremap <silent> <C-k>   <C-\><C-n>:FloatermToggle<CR>
