-- plugins

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

local disabled_built_ins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"gzip",
	"logipat",
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"matchit",
	"tar",
	"tarPlugin",
	"rrhelper",
	"spellfile_plugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
	"tutor",
	"rplugin",
	"syntax",
	"synmenu",
	"optwin",
	"compiler",
	"bugreport",
	"ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

return require("packer").startup(function()
	-- Packer can manage itself
	use({ "wbthomason/packer.nvim" })

	-- lsp
	use({
		"neovim/nvim-lspconfig",
		config = [[require('config.lsp')]],
	})

	-- copilot
	use({
		"github/copilot.vim",
	})

	use({
		"mhartington/formatter.nvim",
		config = [[require('config.formatter')]],
	})

	-- completion
	use({
		"hrsh7th/nvim-cmp",
		config = [[require('config.cmp')]],
		requires = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"L3MON4D3/LuaSnip",
			"onsails/lspkind-nvim",
		},
	})

	-- treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		config = [[require('config.treesitter')]],
		run = ":TSUpdate",
		event = "BufRead",
	})

	-- telescope
	use({ "nvim-lua/plenary.nvim" })
	use({ "nvim-telescope/telescope-file-browser.nvim", opt = true })
	use({
		"nvim-telescope/telescope.nvim",
		config = [[require('config.telescope')]],
		requires = "nvim-lua/plenary.nvim",
		cmd = "Telescope",
	})

	-- undotree
	use({
		"mbbill/undotree",
		opt = true,
		cmd = { "UndotreeShow", "UndotreeToggle", "UndotreeHide", "UndotreeFocus" },
	})

	-- comments
	use({
		"terrortylor/nvim-comment",
		config = [[require('config.comment')]],
		keys = { "gcc", "gc" },
	})

	-- autopairs
	use({
		"windwp/nvim-autopairs",
		config = [[require('config.autopairs')]],
		event = "InsertEnter",
	})

	-- which key
	use({
		"folke/which-key.nvim",
		config = [[require('config.which-key')]],
	})

	use({
		"folke/noice.nvim",
		config = [[require('config.notify')]],
		disable = true,
		requires = {
			"MunifTanjim/nui.nvim",
		},
	})

	-- gitsigns
	use({
		"lewis6991/gitsigns.nvim",
		config = [[require('config.gitsigns')]],
	})

	-- neogit
	use({
		"TimUntersberger/neogit",
		config = [[require('config.neogit')]],
		requires = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
	})

	-- colorscheme
	use({
		"folke/tokyonight.nvim",
		config = [[require('config.tokyonight')]],
	})

	use({
		"rebelot/kanagawa.nvim",
	})

	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})

	use({
		"EdenEast/nightfox.nvim",
	})

	use({
		"ellisonleao/gruvbox.nvim",
	})

	-- statusline
	use({
		"nvim-lualine/lualine.nvim",
		config = [[require('config.lualine')]],
	})

	-- bufferline
	use({
		"akinsho/bufferline.nvim",
		config = [[require('config.bufferline')]],
		requires = "nvim-tree/nvim-web-devicons",
	})

	-- nvim tree
	use({
		"nvim-tree/nvim-tree.lua",
		config = [[require('config.tree')]],
		requires = "nvim-tree/nvim-web-devicons",
		cmd = {
			"NvimTreeClipboard",
			"NvimTreeClose",
			"NvimTreeCollapse",
			"NvimTreeCollapseKeepBuffers",
			"NvimTreeFindFile",
			"NvimTreeFindFileToggle",
			"NvimTreeFocus",
			"NvimTreeOpen",
			"NvimTreeRefresh",
			"NvimTreeResize",
			"NvimTreeToggle",
		},
	})

	-- toggle term
	use({
		"akinsho/toggleterm.nvim",
		config = [[require('config.toggleterm')]],
	})

	-- indent-blankline
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = [[require('config.indent-blankline')]],
	})

	-- scroll
	use({
		"karb94/neoscroll.nvim",
		config = [[require('config.scroll')]],
		opt = true,
	})

	-- ccs colors
	use({
		"norcalli/nvim-colorizer.lua",
		opt = true,
	})

	use({
		"ThePrimeagen/vim-be-good",
		opt = true,
	})

	-- startup time
	use({
		"lewis6991/impatient.nvim",
		config = [[require('config.impatient')]],
	})

	-- test startuptime
	use({ "dstein64/vim-startuptime" })
	-- use({ "tweekmonster/startuptime.vim" })
end)
