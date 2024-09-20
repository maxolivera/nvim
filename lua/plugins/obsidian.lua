return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	--   -- refer to `:h file-pattern` for more examples
	--   "BufReadPre path/to/my-vault/*.md",
	--   "BufNewFile path/to/my-vault/*.md",
	-- },
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/vaults/personal",
			},
		},
		-- notes_subdir = "inbox",
		-- new_notes_location = "notes_subdir",
		disable_frontmatter = true,
		-- templates = {
		-- subdir = "templates",
		-- date_format = "%Y-%m-%d",
		-- time_format = "%H:%M:%S",
		-- },
		-- name new notes starting the ISO datetime and ending with note name
		-- put them in the inbox subdir
		-- note_id_func = function(title)
		--   local suffix = ""
		--   -- get current ISO datetime with -5 hour offset from UTC for EST
		--   local current_datetime = os.date("!%Y-%m-%d-%H%M%S", os.time() - 5*3600)
		--   if title ~= nil then
		--     suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
		--   else
		--     for _ = 1, 4 do
		--       suffix = suffix .. string.char(math.random(65, 90))
		--     end
		--   end
		--   return current_datetime .. "_" .. suffix
		-- end,

		-- see below for full list of options 👇

		-- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
		-- URL it will be ignored but you can customize this behavior here.
		---@param url string
		follow_url_func = function(url)
			-- Open the URL in the default web browser.
			-- vim.fn.jobstart({ "open", url }) -- Mac OS
			-- vim.fn.jobstart({ "xdg-open", url }) -- linux
			-- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
			vim.ui.open(url) -- need Neovim 0.10.0+
		end,
	},
	-- key mappings, below are the defaults
	mappings = {
		-- overrides the 'gf' mapping to work on markdown/wiki links within your vault
		["gf"] = {
			action = function()
				return require("obsidian").util.gf_passthrough()
			end,
			opts = { noremap = false, expr = true, buffer = true },
		},
		-- toggle check-boxes
		-- ["<leader>ch"] = {
		--   action = function()
		--     return require("obsidian").util.toggle_checkbox()
		--   end,
		--   opts = { buffer = true },
		-- },
	},
	completion = {
		nvim_cmp = true,
		min_chars = 2,
	},
	ui = {
		-- Disable some things below here because I set these manually for all Markdown files using treesitter
		checkboxes = {},
		bullets = {},
	},

}
