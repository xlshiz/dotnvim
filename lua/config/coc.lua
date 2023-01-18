local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
local map = require('utils').map

-- Use <c-j> to trigger snippets
map("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)")
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
map("n", "[e", "<Plug>(coc-diagnostic-prev)")
map("n", "]e", "<Plug>(coc-diagnostic-next)")

-- GoTo code navigation.
map("n", "gd", "<Plug>(coc-definition)")
map("n", "gD", "<Plug>(coc-references)")
map("n", "gy", "<Plug>(coc-type-definition)")
map("n", "gi", "<Plug>(coc-implementation)")
map("n", "<leader>rn", "<Plug>(coc-rename)")


-- Use K to show documentation in preview window.
function _G.show_docs()
	local cw = vim.fn.expand('<cword>')
	if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
		vim.api.nvim_command('h ' .. cw)
	elseif vim.api.nvim_eval('coc#rpc#ready()') then
		vim.fn.CocActionAsync('doHover')
	else
		vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
	end
end
map("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server.
map("x", "if", "<Plug>(coc-funcobj-i)", opts)
map("o", "if", "<Plug>(coc-funcobj-i)", opts)
map("x", "af", "<Plug>(coc-funcobj-a)", opts)
map("o", "af", "<Plug>(coc-funcobj-a)", opts)
map("x", "ic", "<Plug>(coc-classobj-i)", opts)
map("o", "ic", "<Plug>(coc-classobj-i)", opts)
map("x", "ac", "<Plug>(coc-classobj-a)", opts)
map("o", "ac", "<Plug>(coc-classobj-a)", opts)

-- Add `:Format` command to format current buffer.
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- Add (Neo)Vim's native statusline support.
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline.
vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

-- vim.cmd(string.format(':set tagfunc=CocTagFunc'))
