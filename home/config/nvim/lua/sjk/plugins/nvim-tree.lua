local setup, nvimtree = pcall(require, 'nvim-tree')
if not setup then
  return
end

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup()
