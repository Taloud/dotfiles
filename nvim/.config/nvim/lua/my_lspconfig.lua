local vim = vim

--[[
local file = io.open(os.getenv("HOME") .. "lsp.dev", "a")

local function join(arr, sep)
    sep = sep or " "
    if arr == nil then
        return ""
    end

    local str = ""
    for idx = 1, #arr do
        if type(arr[idx]) == "string" then
            str = str .. sep .. arr[idx]
        end
    end

    return str
end

local log = true
local function printr(...)
    if log and file then
        file:write("\n")
        file:write(join({...}))
        file:flush()
    elseif not file then
        print("Look there is no file you tird", join({...}))
    end
end
--]]

local count = 0
local last_line = -1

local function virtual_text_override(separator, severity, line, bufnr)
    count = count + 1

    --[[
    local len = #vim.api.nvim_buf_get_lines(bufnr, line - 1, line, false)[1]
    local remaining = 0
    if min_separator_start > len then
        remaining = min_separator_start - len
    end

    table.insert(virt_texts, {
            (" "):rep(remaining)  .. "■",
        severity_highlights[line_diags[i].severity]})

    table.insert(virt_texts, {
      (" "):rep(remaining) .. text_separator, severity_highlights[line_diags[i].severity]
    })
    --]]
    if last_line == line then
        return separator, severity
    end

    last_line = line
    local text_line = vim.api.nvim_buf_get_lines(bufnr, line, line + 1, true)

    if not text_line or #text_line == 0 then
        return separator, severity
    end


    local len = #(text_line[1])
    if len <= 80 then
        local adjusted = 79 - len
        separator = (" "):rep(adjusted) .. separator
    end

    return separator, severity
end

vim_lsp_util_virtual_text_transform = virtual_text_override

--[[
textDocumentCallbacks = textDocumentCallbacks or vim.lsp.callbacks["textDocument/publishDiagnostics"]
vim.lsp.callbacks["textDocument/publishDiagnostics"] = function(err, method, params, client_id)
    if type(textDocumentCallbacks) ~= "function" then
        return
    end

    textDocumentCallbacks(err, method, params, client_id)
end
--]]

local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

require("telescope").load_extension("git_worktree")
require('telescope').load_extension('fzy_native')

local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "$HOME/dotfiles/awesome-streamerrc/ThePrimeagen/",
    })
end

            -- map(mode, key, lua function to call)
            --
            -- good place to look: telescope.actions (init.lua)
            -- lua function to call:  (gets bufnr, not necessarily needed)
            --   require('telescope.actions.state').get_selected_entry(bufnr)
            --   Actions just take the bufnr and give out information
            --   require('telescope.actions').close(bufnr)
            --
            --   check out telescope.actions for _all the available_ supported
            --   actions.
            --
            --   :h telescope.setup ->
            --   :h telescope.builtin ->
            --   :h telescope.layout ->
            --   :h telescope.actions
            --
function set_background(content)
    vim.fn.system(
        "dconf write /org/mate/desktop/background/picture-filename \"'" .. content .. "'\"")
end

local function select_background(prompt_bufnr, map)
    local function set_the_background(close)
        local content =
        require('telescope.actions.state').get_selected_entry(prompt_bufnr)
        set_background(content.cwd .. "/" .. content.value)
        if close then
            require('telescope.actions').close(prompt_bufnr)
        end
    end

    map('i', '<C-p>', function()
        set_the_background()
    end)

    map('i', '<CR>', function()
        set_the_background(true)
    end)
end

local function image_selector(prompt, cwd)
    return function()
        require("telescope.builtin").find_files({
            prompt_title = prompt,
            cwd = cwd,

            attach_mappings = function(prompt_bufnr, map)
                select_background(prompt_bufnr, map)

                -- Please continue mapping (attaching additional key maps):
                -- Ctrl+n/p to move up and down the list.
                return true
            end
        })
    end
end

M.anime_selector = image_selector("< Anime Bobs > ", "~/dotfiles/backgrounds")
M.chat_selector = image_selector("< Chat Sucks > ", "~/dotfiles/chat")

M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map('i', '<c-d>', actions.git_delete_branch)
            map('n', '<c-d>', actions.git_delete_branch)
            return true
        end
    })
end

return M

return {
    virtual_text_override = virtual_text_override
}