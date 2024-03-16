return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    source_selector = {
        statusline = true,
    },
    config = function()
        require("neo-tree").setup({
            window = {
                width = 30,
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                },
            },
        })
        vim.keymap.set("n", "<C-t>", ":Neotree left toggle<CR>", {})
    end,
}
