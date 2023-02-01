local map = require('utils').map

require('telescope').setup{
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-j>"] = require('telescope.actions').move_selection_next,
                ["<C-k>"] = require('telescope.actions').move_selection_previous,
                ["<C-g>"] = require('telescope.actions').close,
                ["<esc>"] = require('telescope.actions').close,
                [",."] = {"<esc>", type = "command"},
            }
        }
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- 
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        rooter = {
            enable = true,
            patterns = { ".git", ".project",  ".projectile" },
            debug = false
        }
    }
}

require('telescope').load_extension('fzf')
require('telescope').load_extension('rooter')

map("n", "<leader>a", ":Telescope find_files<CR>")
map("n", "<leader>bb", ":Telescope buffers<CR>")
map("n", "<leader>*", ":Telescope grep_string<CR>")
map("n", "<leader>/", ":Telescope live_grep<CR>")
