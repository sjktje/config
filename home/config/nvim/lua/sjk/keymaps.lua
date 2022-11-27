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
