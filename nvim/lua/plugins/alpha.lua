---@return table
local function layout()
    ---@param sc string
    ---@param txt string
    ---@param keybind string?
    ---@param keybind_opts table?
    ---@param opts table?
    ---@return table
    local function button(sc, txt, keybind, keybind_opts, opts)
        local def_opts = {
            cursor = 3,
            align_shortcut = "right",
            hl_shortcut = "AlphaButtonShortcut",
            hl = "AlphaButton",
            width = 60,
            position = "center",
        }
        opts = opts and vim.tbl_extend("force", def_opts, opts) or def_opts
        opts.shortcut = sc
        local sc_ = sc:gsub("%s", ""):gsub("SPC", "<Leader>")
        local on_press = function()
            local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
            vim.api.nvim_feedkeys(key, "t", false)
        end
        if keybind then
            keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
            opts.keymap = { "n", sc_, keybind, keybind_opts }
        end
        return { type = "button", val = txt, on_press = on_press, opts = opts }
    end

    -- https://github.com/goolord/alpha-nvim/issues/105
    local lazycache = setmetatable({}, {
        __newindex = function(table, index, fn)
            assert(type(fn) == "function")
            getmetatable(table)[index] = fn
        end,
        __call = function(table, index)
            return function()
                return table[index]
            end
        end,
        __index = function(table, index)
            local fn = getmetatable(table)[index]
            if fn then
                local value = fn()
                rawset(table, index, value)
                return value
            end
        end,
    })

    ---@return string
    lazycache.info = function()
        local plugins = #vim.tbl_keys(require("lazy").plugins())
        local v = vim.version()
        local datetime = os.date " %d-%m-%Y   %H:%M:%S"
        local platform = vim.fn.has "win32" == 1 and "" or ""
        return string.format("󰂖 %d  %s %d.%d.%d  %s", plugins, platform, v.major, v.minor, v.patch, datetime)
    end

    ---@return table
    lazycache.menu = function()
        return {
            button("n", "  New file", "<Cmd>ene<CR>"),
            button("o", "󰊪  File Explorer", ":Neotree float<CR>"),
            button("f", "  Find File", ":Telescope find_files<CR>"),
            button("s", "  Saved Sessions", ":SessionManager load_session<CR>"),
            button("c", "󰑴  Coding Stuff", ":cd ~/code<CR>:Neotree float<CR>"),
            button("e", "  Edit Neovim", ":cd ~/.config/nvim<CR>:Neotree float<CR>"),
            button("u", "󰂖  Update plugins", ":Lazy update<CR>"),
            button("m", "󱌣  Mason", ":Mason<CR>"),
            button("q", "  Quit", ":q<CR>"),
        }
    end

    ---@return table
    lazycache.mru = function()
        local result = {}
        for _, filename in ipairs(vim.v.oldfiles) do
            if vim.loop.fs_stat(filename) ~= nil then
                local icon, hl = require("nvim-web-devicons").get_icon(filename, vim.fn.fnamemodify(filename, ":e"))
                local filename_short = string.sub(vim.fn.fnamemodify(filename, ":t"), 1, 30)

                table.insert(
                    result,
                    button(
                        tostring(#result + 1),
                        string.format("%s  %s", icon, filename_short),
                        string.format("<Cmd>e %s<CR>", filename),
                        nil,
                        { hl = { { tostring(hl), 0, 3 }, { "Normal", 5, #filename_short + 5 } } }
                    )
                )

                if #result == 9 then
                    break
                end
            end
        end
        return result
    end

    ---@return table
    lazycache.fortune = function()
        return require "alpha.fortune" ()
    end

    math.randomseed(os.time())
    local header_color = "Identifier" .. math.random(11)

    return {
        { type = "padding", val = 2 },
        {
            type = "text",
            val = {
                " ▄▄▄██▀▀▀▄▄▄       ███▄ ▄███▓ ███▄ ▄███▓ ██▓ ██ ▄█▀▄▄▄      ",
                "   ▒██  ▒████▄    ▓██▒▀█▀ ██▒▓██▒▀█▀ ██▒▓██▒ ██▄█▒▒████▄    ",
                "   ░██  ▒██  ▀█▄  ▓██    ▓██░▓██    ▓██░▒██▒▓███▄░▒██  ▀█▄  ",
                "▓██▄██▓ ░██▄▄▄▄██ ▒██    ▒██ ▒██    ▒██ ░██░▓██ █▄░██▄▄▄▄██ ",
                " ▓███▒   ▓█   ▓██▒▒██▒   ░██▒▒██▒   ░██▒░██░▒██▒ █▄▓█   ▓██▒",
                " ▒▓▒▒░   ▒▒   ▓▒█░░ ▒░   ░  ░░ ▒░   ░  ░░▓  ▒ ▒▒ ▓▒▒▒   ▓▒█░",
                " ▒ ░▒░    ▒   ▒▒ ░░  ░      ░░  ░      ░ ▒ ░░ ░▒ ▒░ ▒   ▒▒ ░",
                " ░ ░ ░    ░   ▒   ░      ░   ░      ░    ▒ ░░ ░░ ░  ░   ▒   ",
                " ░   ░        ░  ░       ░          ░    ░  ░  ░        ░  ░",
            },
            opts = { hl = header_color, position = "center" },
        },
        { type = "padding", val = 2 },
        {
            type = "text",
            val = lazycache "info",
            opts = { hl = header_color, position = "center" },
        },
        { type = "padding", val = 2 },
        {
            type = "group",
            val = lazycache "menu",
            opts = { spacing = 0 },
        },
        { type = "padding", val = 1 },
        {
            type = "group",
            val = lazycache "mru",
            opts = { spacing = 0 },
        },
        { type = "padding", val = 1 },
        {
            type = "text",
            val = lazycache "fortune",
            opts = { hl = "AlphaQuote", position = "center" },
        },
    }
end

return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
        require("alpha").setup {
            layout = layout(),
            opts = {
                setup = function()
                    vim.api.nvim_create_autocmd("User", {
                        pattern = "AlphaReady",
                        desc = "Disable status and tabline for alpha",
                        callback = function()
                            vim.go.laststatus = 0
                            vim.opt.showtabline = 0
                        end,
                    })
                    vim.api.nvim_create_autocmd("BufUnload", {
                        buffer = 0,
                        desc = "Enable status and tabline after alpha",
                        callback = function()
                            vim.go.laststatus = 3
                            vim.opt.showtabline = 2
                        end,
                    })
                end,
                margin = 5,
            },
        }
    end,
}
