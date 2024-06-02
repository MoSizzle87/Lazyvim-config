return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "tokyonight",
			},

			-- Lualine tabline support
			--tabline = {
				--lualine_a = {},
				--lualine_b = {},
				--lualine_c = { require("tabline").tabline_buffers },
				--lualine_x = { require("tabline").tabline_tabs },
				--lualine_y = {},
            --lualine_z = {},
			--},
			-- sections = { lualine_c = { require("auto-session.lib").current_session_name } },
		})
	end,
}
