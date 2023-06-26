local map = require('utils').map

require('cscope_maps').setup {
    disable_maps = false,
    cscope = {
        picker = "telescope",
        skip_picker_for_single_result = true,
    }
}

map("n", "<c-\\>cg", [[<cmd>lua require('cscope_maps').cscope_prompt('g', vim.fn.expand("<cword>"))<cr>]])
map("n", "<c-\\>cs", [[<cmd>lua require('cscope_maps').cscope_prompt('c', vim.fn.expand("<cword>"))<cr>]])
map("n", "<c-\\>ct", [[<cmd>lua require('cscope_maps').cscope_prompt('t', vim.fn.expand("<cword>"))<cr>]])
map("n", "<c-\\>ce", [[<cmd>lua require('cscope_maps').cscope_prompt('e', vim.fn.expand("<cword>"))<cr>]])
map("n", "<c-\\>cf", [[<cmd>lua require('cscope_maps').cscope_prompt('f', vim.fn.expand("<cword>"))<cr>]])
map("n", "<c-\\>ci", [[<cmd>lua require('cscope_maps').cscope_prompt('i', vim.fn.expand("<cword>"))<cr>]])
map("n", "<c-\\>cd", [[<cmd>lua require('cscope_maps').cscope_prompt('d', vim.fn.expand("<cword>"))<cr>]])
map("n", "<c-\\>ca", [[<cmd>lua require('cscope_maps').cscope_prompt('a', vim.fn.expand("<cword>"))<cr>]])
map("n", "<c-\\>cb", "<cmd>Cscope build<cr>")
