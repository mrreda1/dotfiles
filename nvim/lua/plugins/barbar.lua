return {
    'romgrk/barbar.nvim',
    dependencies = {
        'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    keys = {
        -- Tabs Plugin keymaps
        vim.keymap.set('n', '<C-[>', ':BufferPrevious<CR>', { silent = true, desc = "Tabs -> GOTO Next" }),
        vim.keymap.set('n', '<C-]>', ':BufferNext<CR>', { silent = true, desc = "Tabs -> GOTO Prev" }),
        vim.keymap.set('n', '<Del>', ':BufferClose<CR>', { silent = true, desc = "Tabs -> Buffer Tab :q" }),
        vim.keymap.set('n', '<S-Del>', ':BufferClose!<CR>', { silent = true, desc = "Tabs -> Buffer Tab :q!" }),
        -- Move Tabs
        vim.keymap.set('n', '<C-S-[>', ':BufferMovePrevious<CR>',
            { silent = true, desc = "Tabs -> Move tab to the left" }),
        vim.keymap.set('n', '<C-S-]>', ':BufferMoveNext<CR>', { silent = true, desc = "Tabs -> Move tab to the right" }),
    },
    {
        "petertriho/nvim-scrollbar",
        config = function()
            require("scrollbar").setup()
        end
    },
}
