return {
	-- {
	-- 	"rebelot/kanagawa.nvim",
	-- 	config = function()
	-- 		-- Default options:
	-- 		require("kanagawa").setup({
	-- 			transparent = true, -- do not set background color
	-- 			theme = "wave", -- Load "wave" theme when 'background' option is not set
	-- 			background = { -- map the value of 'background' option to a theme
	-- 				dark = "dragon", -- try "dragon" !
	-- 				light = "lotus",
	-- 			},
	-- 		})
	-- 		vim.cmd("colorscheme kanagawa-wave")
	-- 	end,
	-- },

	-- {
	-- 	"projekt0n/github-nvim-theme",
	-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		require("github-theme").setup({
	-- 			-- ...
	-- 		})
	--
	-- 		vim.cmd("colorscheme github_dark")
	-- 	end,
	-- },

	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nightfox").setup({
				-- nightfox, duskfox, nordfox
			})

			vim.cmd("colorscheme duskfox")
		end,
	},

	--
	-- {
	-- 	"ramojus/mellifluous.nvim",
	-- 	config = function()
	-- 		require("mellifluous").setup({
	-- 			transparent_background = {
	-- 				enabled = true,
	-- 				floating_windows = true,
	-- 				telescope = true,
	-- 				file_tree = true,
	-- 				cursor_line = true,
	-- 				status_line = false,
	-- 			},
	-- 		}) -- optional, see configuration section.
	-- 	end,
	-- },
	--
	-- {
	-- 	"nyoom-engineering/oxocarbon.nvim",
	-- },
	--
	-- {
	-- 	"embark-theme/vim",
	-- 	as = "embark",
	-- 	config = function() end,
	-- },

	-- {
	--     "EdenEast/nightfox.nvim",
	--     config = function()
	--         require("nightfox").setup({
	--             options = {
	--                 transparent = true,
	--             },
	--         })
	--     end,
	-- },
}
