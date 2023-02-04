local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values

local M = {}

function M.execute(opts)
	opts = opts or {}
	print(vim.inspect(opts.results))
	print(vim.inspect(opts))
	pickers
			.new(opts, {
				prompt_title = 'Conflicts',
				finder = finders.new_table({
					results = opts.results,
				}),
				previewer = conf.qflist_previewer(opts),
				sorter = conf.generic_sorter(opts),
			})
			:find()
end

return M
