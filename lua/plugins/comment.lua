-- plugin to comment all the line typing "gc"
return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup()
    end,
}
