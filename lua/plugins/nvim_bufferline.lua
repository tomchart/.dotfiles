local bufferline = require'bufferline'

bufferline.setup{
        highlights = {
                buffer_selected = {
                        gui = 'bold',
                },
                duplicate_selected = {
                        gui = 'bold',
                },
                duplicate = {
                        gui = '',
                },
        },
        options = {
                middle_mouse_command = "bdelete! %d",
                indicator_icon = '▎',
                buffer_close_icon = '',
                modified_icon = '●',
                close_icon = '',
                left_trunc_marker = '',
                right_trunc_marker = '',        
                max_name_length = 30,
                max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
                tab_size = 18,
                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                        local s = " "
                        for e, n in pairs(diagnostics_dict) do
                                local sym = e == "error" and " "
                                or (e == "warning" and " " or " " )
                                s = s .. n .. sym
                        end
                        return s
                end,
                show_close_icon = true,
                separator_style = "slant",
                offsets = {{filetype = "NvimTree", text = "File Explorer"}} 

        },
}
