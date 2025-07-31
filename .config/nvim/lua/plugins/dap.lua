return {
    { "mfussenegger/nvim-dap" },
    { "nvim-neotest/nvim-nio" },
    { "rcarriga/nvim-dap-ui",
      dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
      config = function()
          require("dapui").setup()
          require("config.dap")
      end
    },
    { "williamboman/mason.nvim" },
    { "jay-babu/mason-nvim-dap.nvim", dependencies = { "mason.nvim", "nvim-dap" }, config = function()
        require("mason-nvim-dap").setup({
            ensure_installed = { "cpptools" },
            automatic_installation = true,
        })
    end },
}