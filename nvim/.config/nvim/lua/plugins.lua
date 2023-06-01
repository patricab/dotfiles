-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use {'nvim-treesitter/playground'}

	use {"theprimeagen/harpoon"}

	use {"mbbill/undotree"}

	use {"tpope/vim-fugitive"}

	use {"nvim-lualine/lualine.nvim"}
    use {"Mofiqul/dracula.nvim"}
    use {"ThePrimeagen/vim-be-good"}

    -- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}
    use {"nvim-tree/nvim-tree.lua"}
	use {"kylechui/nvim-surround", 
        tag = "*", 
        config = function()
        require("nvim-surround").setup()
    end}

	use {"terrortylor/nvim-comment"}
	require('nvim_comment').setup()

	--LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
		"hrsh7th/nvim-cmp",     -- Required
		"hrsh7th/cmp-nvim-lsp", -- Required
		"L3MON4D3/LuaSnip",     -- Required
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        "vhda/verilog_systemverilog.vim",
    }
    -- use {'luk400/vim-jukit'}
	-- use {
	-- 	'VonHeikemen/lsp-zero.nvim',
	-- 	branch = 'v2.x',
	-- 	requires = {
	-- 		-- LSP Support
	-- 		{'neovim/nvim-lspconfig'},             -- Required
	-- 		{                                      -- Optional
	-- 		'williamboman/mason.nvim',
	-- 		run = function()
	-- 			pcall(vim.cmd, 'MasonUpdate')
	-- 		end,
	-- 	},
	-- 	{'williamboman/mason-lspconfig.nvim'}, -- Optional

	-- 	-- Autocompletion
	-- 	{'hrsh7th/nvim-cmp'},     -- Required
	-- 	{'hrsh7th/cmp-nvim-lsp'}, -- Required
	-- 	{'L3MON4D3/LuaSnip'},     -- Required
	-- }}
    -- use {
    --     "startup-nvim/startup.nvim",
    --     requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    --     config = function()
    --         require"startup".setup()
    --     end
    -- }
end)
