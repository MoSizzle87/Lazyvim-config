-- tokyonight themes
return {
	"folke/tokyonight.nvim",
	lazy = false,
	name = "tokyonight",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("tokyonight-storm") -- storm, night, day, moon
	end,
}
