return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					visible = true, -- when true, they will just be displayed differently than normal items
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_hidden = false, -- only works on Windows for hidden files/directories
					hide_by_name = {
						--"node_modules"
					},
					hide_by_pattern = { -- uses glob style patterns
						--"*.meta",
						--"*/src/*/tsconfig.json",
					},
					always_show = { -- remains visible even if other settings would normally hide it
						--".gitignored",
					},
					never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
						--".DS_Store",
						--"thumbs.db"
					},
					never_show_by_pattern = { -- uses glob style patterns
						--".null-ls_*",
					},
				},
			},
			event_handlers = {
				{
					event = "file_opened",
					handler = function()
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
		})
		vim.keymap.set("n", "<leader>t", ":Neotree filesystem reveal right<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
	end,
}
