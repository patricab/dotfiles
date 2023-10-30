-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use({
          "nvim-treesitter/nvim-treesitter-textobjects",
          after = "nvim-treesitter",
          requires = "nvim-treesitter/nvim-treesitter",
    })
	use {'nvim-treesitter/playground'}
    use {"nvim-treesitter/nvim-treesitter-context"}

    -- My boy
    use {"theprimeagen/vim-be-good"}
	use {"theprimeagen/harpoon"}
	use {"theprimeagen/git-worktree.nvim"}
    use {"theprimeagen/refactoring.nvim",
        requires = {
            {"nvim-lua/plenary.nvim"},
            {"nvim-treesitter/nvim-treesitter"}
        }
    }
	use {"mbbill/undotree"}
	use {"tpope/vim-fugitive"}
	use {"nvim-lualine/lualine.nvim"}
    use {"Mofiqul/dracula.nvim"}

    -- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
    use {"nvim-lua/popup.nvim"}
    use {"nvim-telescope/telescope-fzy-native.nvim"}

    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}
    -- use {"nvim-tree/nvim-tree.lua"}
	use {"kylechui/nvim-surround", 
        tag = "*", 
        config = function()
        require("nvim-surround").setup()
    end}
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

	use {"terrortylor/nvim-comment"}
	require('nvim_comment').setup()

	-- LSP/CMP
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
