vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({transparent_background = true,
			     term_colors = true
		})
vim.cmd [[colorscheme catppuccin]]
