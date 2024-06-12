return {
	"nvim-lualine/lualine.nvim",
	requires = { "kyazdani42/nvim-web-devicons", opt = true },
	config = function()
		-- Define the colors you want to use from the tokyonight theme
		local colors = {
			orange_fg = "#ff9e64", -- Foreground color for branch with diffs
		}

		-- Function to determine the color based on Git diffs
		local function branch_color()
			local git_diff = vim.b.gitsigns_status_dict or { added = 0, changed = 0, removed = 0 }
			if git_diff.added ~= 0 or git_diff.changed ~= 0 or git_diff.removed ~= 0 then
				return { fg = colors.orange_fg }
			end
		end

		require("lualine").setup({
			options = {
				theme = "tokyonight",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						separator = { left = "", right = "" },
						right_padding = 2,
					},
				},
				lualine_b = {
					{
						"branch",
						separator = { left = "", right = "" },
						right_padding = 2,
						color = branch_color,
					},
					{
						"diff",
						separator = { left = "", right = "" },
						right_padding = 2,
					},
				},
				lualine_c = {
					{
						"filename",
						separator = { left = "", right = "" },
						right_padding = 2,
					},
				},
				lualine_x = {
					{
						"encoding",
						separator = { left = "", right = "" },
						right_padding = 2,
					},
					{
						"fileformat",
						separator = { left = "", right = "" },
						right_padding = 2,
					},
					{
						"filetype",
						separator = { left = "", right = "" },
						right_padding = 2,
					},
				},
				lualine_y = {
					{
						"progress",
						separator = { left = "", right = "" },
						right_padding = 2,
					},
				},
				lualine_z = {
					{
						"location",
						separator = { left = "", right = "" },
						right_padding = 2,
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {}, -- Removed buffers section
			extensions = {},
		})
	end,
}
