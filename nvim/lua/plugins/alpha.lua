return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        -- Set header
        dashboard.section.header.val = {
            " ███▄    █ ██▒   █▓ ██▓ ███▄ ▄███▓",
            " ██ ▀█   █▓██░   █▒▓██▒▓██▒▀█▀ ██▒",
            "▓██  ▀█ ██▒▓██  █▒░▒██▒▓██    ▓██░",
            "▓██▒  ▐▌██▒ ▒██ █░░░██░▒██    ▒██ ",
            "▒██░   ▓██░  ▒▀█░  ░██░▒██▒   ░██▒",
            "░ ▒░   ▒ ▒   ░ ▐░  ░▓  ░ ▒░   ░  ░",
            " ░     ░     ░ ░    ░     ░      ░",
        }
        dashboard.section.buttons.val = {
            dashboard.button("o", "󰊪    File Explorer", ":Neotree float<CR>"),
            dashboard.button("f", "    Find File", ":Telescope find_files<CR>"),
            dashboard.button("r", "    Recent Files", ":Telescope oldfiles<CR>"),
            dashboard.button("f", "    Saved Sessions", ":SessionManager load_session<CR>"),
            dashboard.button("s", "󰑴    Collage Stuff", ":cd ~/Documents/collage<CR>:Neotree float<CR>"),
            dashboard.button("e", "    Edit Neovim", ":cd ~/.config/nvim<CR>:Neotree float<CR>"),
            dashboard.button("u", "󰂖    Update plugins", ":Lazy update<CR>"),
            dashboard.button("m", "󱌣    Mason", ":Mason<CR>"),
            dashboard.button("q", "    Quit", ":q<CR>"),
        }
        dashboard.section.footer.val = {
            "~ " .. vim.loop.cwd() .. " ~",
        }
        alpha.setup(dashboard.opts)
    end,
}
