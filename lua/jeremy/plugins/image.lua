return {
	"3rd/image.nvim",
	dependencies = {
		{
			"vhyrro/luarocks.nvim",
			priority = 1001, -- this plugin needs to run before anything else
			opts = {
				rocks = { "magick" },
			},
		},
	},
	opts = {},
}
