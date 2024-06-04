return -- Ajout de glow.nvim pour la prévisualisation Markdown
{
	"npxbr/glow.nvim",
	run = "GlowInstall",
	cmd = "Glow",
},
-- Ajout de markdown-preview.nvim pour la prévisualisation Markdown dans le navigateur
{
	"iamcco/markdown-preview.nvim",
	run = "cd app && npm install",
	setup = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
}
