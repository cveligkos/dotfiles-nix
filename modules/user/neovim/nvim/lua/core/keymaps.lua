vim.g.mapleader = " "

local normalKeymaps = {
	{ "<M-s>", ":write<CR>" },
	{ "<C-n>", ":nohlsearch<CR>" },
	-- movement
	{ "<C-h>", "<C-w>h" },
	{ "<C-j>", "<C-w>j" },
	{ "<C-k>", "<C-w>k" },
	{ "<C-l>", "<C-w>l" },
	-- nvim-tree
	{ "<leader>e", ":NvimTreeFindFileToggle<CR>", "Toggle NvimTree" },
	-- lsp
	{ "<M-f>", "<cmd>lua vim.lsp.buf.format()<CR>", "Format buffer using LSP" },
}

local add_n = function(keymap)
	table.insert(normalKeymaps, keymap)
end

local ok, telescope = pcall(require, "telescope.builtin")
if ok then
	add_n({ "<leader>ff", telescope.find_files })
	add_n({ "<leader>fg", telescope.live_grep })
	add_n({ "<leader>fb", telescope.buffers })
	add_n({ "<leader>fh", telescope.help_tags })
end

local ok, oil = pcall(require, "oil")
if ok then
	add_n({ "-", oil.open })
end

local insertKeymaps = {
	{ "jk", "<ESC>" },
}

local modes = {
	{ mode = "n", keybinds = normalKeymaps },
	{ mode = "i", keybinds = insertKeymaps },
}

for _, v in ipairs(modes) do
	for _, map in ipairs(v.keybinds) do
		vim.keymap.set(v.mode, map[1], map[2], { noremap = true, silent = true, desc = map[3] })
	end
end

vim.keymap.set("n", ";", ":", { noremap = true, silent = false })
