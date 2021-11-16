local M = {}

function M.setup()
    local bufferline = require "bufferline"    

    bufferline.setup {
        options = {
            separator_style = {'', ''},
            tab_size = 22,
            enforce_regular_tabs = true,
            view = "multiwindow",
            show_buffer_close_icons = true,
        },
    }
end

return M
