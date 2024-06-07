-- Pour avoir un apreçu d'ou l'on se trouve dans le code
-- Proche de outline mais pas interractif

return {
	"gorbit99/codewindow.nvim",
	config = function()
		local codewindow = require("codewindow")
		codewindow.setup()
		codewindow.apply_default_keybinds()
        codewindow.auto_enable = true
	end,
}
