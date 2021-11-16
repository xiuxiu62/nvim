local M = {}

function M.setup()
    local telescope = require "telescope"
    local actions = require "telescope.actions"
    local maps = require "util.maps"

    telescope.setup {
        defaults = {
            mappings = {
                i = {
                    ["<C-j>"] = actions.move_selection_better,
                    ["<C-k>"] = actions.move_selection_worse,
                    ["<C-q>"] = actions.send_to_qflist,
                    ["<Esc>"] = actions.close
                },
            },
        }
    }

    telescope.load_extension('fzy_native')

    maps.nnoremap("<C-f>", ':lua require("util/telescope").search_files()<CR>')
    maps.inoremap("<C-f>", '<Esc> :lua require("util/telescope").search_in_buffer()<CR>')
    maps.nnoremap("/", ':lua require("util/telescope").search_in_buffer()<CR>')
    maps.nnoremap("<Leader>fg", '<Esc> :lua require("telescope.builtin").live_grep()<CR>')
    maps.nnoremap("<Leader>fd", '<Esc> :lua require("util/telescope").search_dotfiles()<CR>')
end

return M
