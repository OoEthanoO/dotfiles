return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            highlight = {
                enable = true,
            },
            indent = { enable = true },
            autotage = { enable = true },
            ensure_installed = {
                "lua",
                "cpp",
                "python",
                "rust",
            },
            auto_install = false,
        })
    end
    -- Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
}
