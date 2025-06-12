vim.o.lazyredraw = true
vim.o.mouse = ""
vim.o.number = true
vim.o.relativenumber = true
vim.o.background = "dark"

vim.o.colorcolumn = "80"

-- Min distance from edges
vim.o.scrolloff = 6

vim.o.termguicolors = true


-- Line when in insert mode
vim.cmd("augroup init")
vim.cmd("autocmd!")
vim.cmd("autocmd InsertEnter * set cursorline")
vim.cmd("autocmd InsertLeave * set nocursorline")
vim.cmd("augroup END")



-- Resizing with arrows
vim.api.nvim_set_keymap("n", "<Up>", "<c-w>+", {noremap = true})
vim.api.nvim_set_keymap("n", "<Down>", "<c-w>-", {noremap = true})
vim.api.nvim_set_keymap("n", "<Right>", "<c-w>>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Left>", "<c-w><", {noremap = true})
