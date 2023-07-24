return {
	"jose-elias-alvarez/null-ls.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		local sources = {}

		local formatters = {
			"stylua",
			"alejandra",
			"shfmt",
		}

		for _, f in ipairs(formatters) do
			table.insert(sources, null_ls.builtins.formatting[f])
		end

		null_ls.setup({
			sources = sources,
		})
	end,
}
