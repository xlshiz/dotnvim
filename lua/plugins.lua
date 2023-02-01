local pconfig = require('utils').config
local map = require('utils').map

require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    --------------------------- basic ------------------------------------
    use 'nvim-lua/popup.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
        {'desdic/telescope-rooter.nvim'}},
        config = pconfig("telescope")
    }
    -- use 'dyng/ctrlsf.vim'
    use 'vim-scripts/DrawIt'
    use {
        'lilydjwg/fcitx.vim',
        branch = 'fcitx4'
    }
    use 'junegunn/vim-easy-align'
    use {
        'Lokaltog/vim-easymotion',
        config = pconfig("vim-easymotion")
    }
    use 'tpope/vim-fugitive'
    use 'tpope/vim-repeat'
    use 'bronson/vim-trailing-whitespace'
    use 'xlshiz/Mark'
    -- use 'andymass/vim-matchup'

    -------------------------- coding -------------------------------------------
    use {
        'neoclide/coc.nvim',
        branch = 'release',
        config = pconfig("coc")
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        config = pconfig("nvim-treesitter")
    }
    use {'windwp/nvim-autopairs', config = pconfig("nvim-autopairs")}
    use {
        'w0rp/ale',
        config = pconfig("ale")
    }
    use {'xlshiz/DoxygenToolkit.vim', cmd = {'Dox'}}
    use {'numToStr/Comment.nvim', config = pconfig("comment"), tag = 'v0.6'}
    use {'majutsushi/tagbar', config = pconfig("tagbar")}
    -- use 'vim-scripts/taglist.vim'
    -- use 'gcmt/wildfire.vim'

    --------------------------- language ------------------------------------
    use {'docunext/closetag.vim', ft = {'html', 'xml'}}
    use {'tpope/vim-surround', ft = {'html', 'xml'}}
    use {'plasticboy/vim-markdown', ft = {'md', 'markdown'}}
    use {'jceb/vim-orgmode', ft = {'org'}}
    use {'tpope/vim-speeddating', ft = {'org'}}
    use {'hdima/python-syntax', ft = {'python'}}
    use {'hynek/vim-python-pep8-indent', ft = {'python'}}
    use {'Glench/Vim-Jinja2-Syntax', ft = {'python'}}
    use {'posva/vim-vue', ft = {'vue'}}

    --------------------------- ui ------------------------------------
    use {'kyazdani42/nvim-tree.lua', config = pconfig("nvim-tree")}
    use {
        "ellisonleao/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"}
    }
    -- use 'glepnir/zephyr-nvim'
    use {'bling/vim-airline', config = pconfig("vim-airline")}

end)

-- vim:fen:fdm=marker:fmr={{{,}}}:fdl=0:fdc=1
