local function get_attached_clients()
    local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
    if #buf_clients == 0 then
        return "LSP Inactive "
    else
        return "LSP Active "
    end

    local buf_ft = vim.bo.filetype
    local buf_client_names = {}

    -- add client
    for _, client in pairs(buf_clients) do
        if client.name ~= "copilot" and client.name ~= "null-ls" then
            table.insert(buf_client_names, client.name)
        end
    end

    -- Add sources (from null-ls)
    -- null-ls registers each source as a separate attached client, so we need to filter for unique names down below.
    local null_ls_s, null_ls = pcall(require, "null-ls")
    if null_ls_s then
        local sources = null_ls.get_sources()
        for _, source in ipairs(sources) do
            if source._validated then
                for ft_name, ft_active in pairs(source.filetypes) do
                    if ft_name == buf_ft and ft_active then
                        table.insert(buf_client_names, source.name)
                    end
                end
            end
        end
    end

    -- This needs to be a string only table so we can use concat below
    local unique_client_names = {}
    for _, client_name_target in ipairs(buf_client_names) do
        local is_duplicate = false
        for _, client_name_compare in ipairs(unique_client_names) do
            if client_name_target == client_name_compare then
                is_duplicate = true
            end
        end
        if not is_duplicate then
            table.insert(unique_client_names, client_name_target)
        end
    end

    local client_names_str = table.concat(unique_client_names, ", ")
    local language_servers = string.format("%s", client_names_str)

    return language_servers
end

require("lualine").setup({
    sections = {
        lualine_a = {
            {
                "mode",
                icon = { " " },
                fmt = function(mode, _)
                    return mode
                end,
            },
        },
        lualine_b = {
            {
                "branch",
                icon = {
                    " ",
                },
            },
        },
        lualine_c = {
            {
                "filetype",
                icon_only = true,
            },
            {
                "filename",
                path = 0,
                symbols = {
                    modified = "[+]",
                    readonly = "[-]",
                    unnamed = "[no name]",
                    newfile = "[new]",
                },
            },
            {
                "diff",
                colored = true,
                symbols = {
                    -- added = "  ",
                    -- modified = "  ",
                    -- removed = "  ",
                    -- added = "  ",
                    -- modified = " 󰝤",
                    -- removed = "  ",
                },
            },
            {
                "filename",
                path = 1,
                file_status = false,
                color = { fg = '#6c7086', gui = 'italic' },
                fmt = function(str)
                    return vim.fn.fnamemodify(str, ":h")
                end,
            },
        },
        lualine_x = {
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                symbols = {
                    error = "  ",
                    warn = "  ",
                    info = "  ",
                    hint = "  ",
                },
            },
        },
        lualine_y = {
            {
                get_attached_clients,
                icon = {
                    "",
                },
            },
        },
        lualine_z = {
            {
                "progress",
            },
            {
                "location",
                fmt = function(location)
                    return location .. " "
                end,
            },
        },
    },
    options = {
        disabled_filetypes = { "" },
        globalstatus = true,
        -- section_separators = { left = "", right = "" },
        section_separators = { left = "█", right = "█" },
        -- section_separators = { left = " ", right = " " },
        -- section_separators = { left = " ", right = " " },
        component_separators = { left = "", right = "" },
        theme = "catppuccin",
    },
})
