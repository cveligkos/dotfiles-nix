return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"php",
				"markdown",
				"markdown_inline",
				"rust",
				"typescript",
				"svelte",
				"html",
			},

			autotag = {
				enable = true,
			},
		})
	end,
}
