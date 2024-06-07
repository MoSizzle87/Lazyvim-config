-- to see sheets
return {
	"vidocqh/data-viewer.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"kkharji/sqlite.lua", -- Optional, sqlite support
	},
}

-- List of commands
-- :DataViewer -- open with current file and auto detect filetype
-- :DataViewer [filetype] -- open with current file with given filetype
-- :DataViewer [filepath] [filetype] -- open with given file and given filetype
-- :DataViewerNextTable
-- :DataViewerPrevTable
-- :DataViewerClose
