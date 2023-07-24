return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local servers = {
			rust_analyzer = {},
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { "vim" },
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						-- Do not send telemetry data containing a randomized but unique identifier
						telemetry = {
							enable = false,
						},
					},
				},
			},
			svelte = {},
			nixd = {},
			tsserver = {},
			cssls = {},
			jsonls = {},
			html = {},
			bashls = {},
		}

		local common_config = {
			capabilities = capabilities,
			on_attach = require("core.lib").lsp_keybinds,
		}

		for server, config in pairs(servers) do
			lspconfig[server].setup(vim.tbl_deep_extend("error", common_config, config))
		end
	end,
}
