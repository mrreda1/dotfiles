return {
    {
        "RRethy/vim-illuminate",
    },
    {
        "nvimdev/hlsearch.nvim",
        event = "BufRead",
        config = function()
            require("hlsearch").setup()
        end,
    },
    {
        "nvim-pack/nvim-spectre",
    },
    {

        "kylechui/nvim-surround",
        config = function()
            local surround = require("nvim-surround")
            surround.setup()
            surround.buffer_setup()
        end,
    },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
        },
    },
    {
        'mg979/vim-visual-multi'
    },
}
