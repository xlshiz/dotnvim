local map = require('utils').map

require('telescope').setup {
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
        },
        live_grep_args = {
            auto_quoting = true, -- enable/disable auto-quoting
            mappings = {
                i = {
                    ["<C-i>"] =  require("telescope-live-grep-args.actions").quote_prompt()
                }
            }
        }
    }
}

require('telescope').load_extension('fzf')
-- require('telescope').load_extension('rooter')
require('telescope').load_extension('live_grep_args')

function _G.telescope_is_project_root()
    local opts = {}
    local project_path = vim.fs.find({".project", ".projectile", ".git"}, {upward = true})[1]
    project_path = vim.fn.fnamemodify(project_path, ":h")
    if project_path ~= nil then
        opts = {
            cwd = project_path,
        }
    end
    return opts
end

function _G.telescope_find_files_p()
    local opts = {}
    local project_path = telescope_is_project_root()
    if project_path ~= nil then
        opts = {
            cwd = project_path,
        }
    end
    require("telescope.builtin").find_files(opts)
end

function _G.telescope_find_files_p()
    local opts = {}
    local project_path = telescope_is_project_root()
    if project_path ~= nil then
        opts = {
            cwd = project_path,
        }
    end
    require("telescope.builtin").find_files(opts)
end

map("n", "<leader>a", ':lua require("telescope.builtin").find_files(telescope_is_project_root())<CR>')
map("n", "<leader>bb", ":Telescope buffers<CR>")
map("n", "<leader>*", ':lua require("telescope.builtin").grep_string(telescope_is_project_root())<CR>')
map("n", "<leader>/*", ":Telescope grep_string search_dirs=", {silent = false, noremap = true})
map("n", "<leader>//", ':lua require("telescope").extensions.live_grep_args.live_grep_args(telescope_is_project_root())<CR>')
-- map("n", "<leader>//", ":Telescope live_grep_args<CR>")
