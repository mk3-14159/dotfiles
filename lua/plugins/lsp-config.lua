-- Helper function for root pattern with exclusions
local function root_pattern_excludes(opt)
	local util = require("lspconfig/util")
	local root = opt.root
	local exclude = opt.exclude

	local function matches(path, pattern)
		return 0 < #vim.fn.glob(util.path.join(path, pattern))
	end

	return function(startpath)
		return util.search_ancestors(startpath, function(path)
			return matches(path, root) and not matches(path, exclude)
		end)
	end
end

return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- TypeScript/JavaScript configuration with exclusions
			-- lspconfig.tsserver.setup({
			-- 	on_attach = on_attach,
			-- 	root_dir = lspconfig.util.root_pattern("package.json"),
			-- 	single_file_support = false,
			-- })

			lspconfig.ts_ls.setup({
				on_attach = on_attach,
				root_dir = lspconfig.util.root_pattern("package.json"),
				single_file_support = false,
			})
			-- Deno configuration with exclusions
			lspconfig.denols.setup({
				on_attach = on_attach,
				root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
			})
			-- Other LSP configurations remain unchanged
			lspconfig.prismals.setup({
				capabilities = capabilities,
			})

			lspconfig.html.setup({
				capabilities = capabilities,
			})

			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})

			lspconfig.svelte.setup({
				capabilities = capabilities,
			})

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
							},
						},
						telemetry = {
							enable = false,
						},
						hint = {
							enable = true,
						},
					},
				},
			})

			-- Keymaps remain unchanged
			vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, {})
			vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

			-- Error navigation keymaps remain unchanged
			vim.keymap.set("n", "<leader>of", vim.diagnostic.open_float, {})
			vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {})
			vim.keymap.set("n", "g]", vim.diagnostic.goto_next, {})
			vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, {})
		end,
	},
}
