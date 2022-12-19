local keymap = vim.keymap

-- Use jj to exit insert mode
keymap.set('i', 'jj', '<ESC>') 

-- clear search highlights
keymap.set('n', '<leader>nh', ':nohl<CR>')

-- go to beginnind/end of line
keymap.set('n', 'H', '^')
keymap.set('n', 'L', '$')
keymap.set('v', 'L', 'g_')

-- nvim-tree
keymap.set('n', '<leader>nt', ':NvimTreeToggle<CR>')

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- telekasten
keymap.set('n', '<leader>zf', [[<Cmd>lua require('telekasten').find_notes()<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>zd', [[<Cmd>lua require('telekasten').find_daily_notes()<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>zg', [[<Cmd>lua require('telekasten').search_notes()<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>zz', [[<Cmd>lua require('telekasten').follow_link()<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>zT', [[<Cmd>lua require('telekasten').goto_today()<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>zW', [[<Cmd>lua require('telekasten').goto_thisweek()<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>zw', [[<Cmd>lua require('telekasten').find_weekly_notes()<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>zn', [[<Cmd>lua require('telekasten').new_note()<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>zN', [[<Cmd>lua require('telekasten').new_templated_note()<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>zy', [[<Cmd>lua require('telekasten').yank_notelink()<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>zc', [[<Cmd>lua require('telekasten').show_calendar()<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>zC', [[<Cmd>CalendarT<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>zi', [[<Cmd>lua require('telekasten').paste_img_and_link()<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>zt', [[<Cmd>lua require('telekasten').toggle_todo()<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>zb', [[<Cmd>lua require('telekasten').show_backlinks()<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>zF', [[<Cmd>lua require('telekasten').find_friends()<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>zI', [[<Cmd>lua require('telekasten').insert_img_link({ i=true })<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>zp', [[<Cmd>lua require('telekasten').preview_img()<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>zm', [[<Cmd>lua require('telekasten').browse_media()<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>za', [[<Cmd>lua require('telekasten').show_tags()<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>#', [[<Cmd>lua require('telekasten').show_tags()<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>zr', [[<Cmd>lua require('telekasten').rename_note()<CR>]], { noremap = true, silent = true })
keymap.set('n', '<leader>z', [[<Cmd>lua require('telekasten').panel()<CR>]], { noremap = true, silent = true })
keymap.set('i', '<leader>zt', [[<cmd>:lua require('telekasten').toggle_todo({ i=true })<CR>]])
