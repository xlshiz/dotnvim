--  Functions {{{1
function _G.RemoveOverTimeFiles(time, dir)
    os.execute(string.format("find %s -mtime +%d -type f -exec rm -f {} \\;", dir, time))
end

function _G.WantPasteMode()
    if vim.wo.relativenumber == vim.wo.number then
        vim.wo.relativenumber = not vim.wo.relativenumber
        vim.wo.number = not vim.wo.number
    elseif vim.wo.number then
        vim.wo.number = not vim.wo.number
    else
        vim.wo.relativenumber = not vim.wo.relativenumber
    end
    vim.o.paste = not vim.o.paste
    if vim.o.paste then
        vim.cmd('set mouse-=a')
        vim.wo.signcolumn = "no"
        vim.o.list = false
    else
        vim.cmd('set mouse+=a')
        vim.wo.signcolumn = "yes"
        vim.o.list = true
    end
end

function _G.Tab2SpaceMode(i)
    vim.bo.tabstop = i
    vim.bo.shiftwidth = i
    vim.bo.expandtab = true
    vim.bo.autoindent = true
end

function _G.KernelMode()
    vim.bo.cindent = true
    vim.bo.cinoptions = ":0t0(0"
    vim.bo.tw = 78
    vim.o.wrap = true
    vim.wo.wrap = true
end
--  }}}
--  Settings {{{1
-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'
vim.o.fileencodings = 'ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,default'
-- jk移动时光标下上方保留8行
vim.o.scrolloff = 3
vim.o.sidescrolloff = 3
-- 使用相对行号
vim.wo.number = true
vim.wo.relativenumber = true
-- 高亮所在行
vim.wo.cursorline = true
-- 显示左侧图标指示列
vim.wo.signcolumn = "yes"
-- 新行对齐当前行，空格替代tab
-- vim.o.expandtab = true
-- vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
--- 搜索不要高亮
vim.o.hlsearch = true
-- 边输入边搜索
vim.o.incsearch = true
-- 使用增强状态栏后不再需要 vim 的模式提示
vim.o.showmode = false
-- 命令行高为1，提供足够的显示空间
vim.o.cmdheight = 1
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true
-- 折行
vim.o.wrap = true
vim.wo.wrap = true
-- 行结尾可以跳到下一行
vim.o.whichwrap = 'b,s,<,>,[,]'
-- 允许隐藏被修改过的buffer
vim.o.hidden = true
-- 鼠标支持
vim.o.mouse = "a"
-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- smaller updatetime
vim.o.updatetime = 300
-- 设置 timeoutlen 为等待键盘快捷键连击时间300毫秒，可根据需要设置
-- 遇到问题详见：https://github.com/nshen/learn-neovim-lua/issues/1
vim.o.timeoutlen = 1000
-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true
-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- 样式
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- 不可见字符的显示，这里只把空格显示为一个点
vim.o.list = true
vim.o.listchars = "tab:> ,nbsp:+,lead:·"
-- 补全增强
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.pumheight = 10
-- don't show tabline
vim.o.showtabline = 0
--Ctags
vim.o.tags="tags,./tags,../tags"
-- persistent undo
local undo_cache_dir = vim.fn.stdpath("cache") .. "/undo"
if vim.fn.isdirectory(undo_cache_dir) then
    os.execute(string.format("mkdir -p %s", undo_cache_dir))
end
vim.o.undofile = true
vim.o.undodir = undo_cache_dir
vim.o.undolevels = 1000
--}}}1
--  Autocmd {{{1
vim.cmd(string.format('autocmd VimLeave * call v:lua.RemoveOverTimeFiles(7, "%s")', undo_cache_dir))
vim.cmd(string.format('autocmd BufWritePre COMMIT_EDITMSG setlocal noundofile'))
vim.cmd(string.format('autocmd BufWritePre MERGE_MSG setlocal noundofile'))
vim.cmd(string.format('autocmd BufWritePre *.tmp setlocal noundofile'))
vim.cmd(string.format('autocmd BufWritePre *.bak setlocal noundofile'))
vim.cmd(string.format('autocmd FileType javascript,vue,css,scss,lisp call v:lua.Tab2SpaceMode(2)'))
vim.cmd(string.format('autocmd FileType lua call v:lua.Tab2SpaceMode(4)'))
vim.cmd(string.format('autocmd FileType c call v:lua.KernelMode()'))
--}}}1
--  Keybinding {{{1
-- leader key 为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 本地变量
local map = require('utils').map

map("n", "<C-h>", "<c-w>h")
map("n", "<C-j>", "<c-w>j")
map("n", "<C-k>", "<c-w>k")
map("n", "<C-l>", "<c-w>l")
map("n", "<leader>wd", "<c-w>c")

map("n", "<leader>bd", ":bd!<CR>")
map("n", "<leader>fs", ":up!<CR>")
map("n", "<leader>qq", ":qa!<CR>")
map("n", "<leader>x",  ":xa<CR>")
map("n", "<leader>2",  ":TagbarToggle<CR>")

-- visual模式下缩进代码
map("v", "<", "<gv")
map("v", ">", ">gv")

-- 鼠标复制
map("n", "<F2>",  ":call v:lua.WantPasteMode()<CR>")
--}}}1

-- vim:fen:fdm=marker:fmr={{{,}}}:fdl=0:fdc=1
