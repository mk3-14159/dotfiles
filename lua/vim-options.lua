vim.wo.number = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set signcolumn=yes")
vim.g.mapleader = " "
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
local default_opts = { noremap = true, silent = true }

-- Navigate vim panes better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Yanking into clipboard
vim.keymap.set({ "n", "v" }, "y", '"+y') -- yank motion
vim.keymap.set({ "n", "v" }, "Y", '"+Y') -- yank line

-- Delete into system clipboard
vim.keymap.set({ "n", "v" }, "d", '"+d') -- delete motion
vim.keymap.set({ "n", "v" }, "D", '"+D') -- delete line

-- Paste from system clipboard
vim.keymap.set("n", "p", '"+p') -- paste after cursor
vim.keymap.set("n", "P", '"+P') -- paste before cursor

-- Buffer shortcuts
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "go to newrw with leader pv" })
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", default_opts)
vim.keymap.set("n", "<leader>W", "<cmd>wa<cr>", default_opts)
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", default_opts)
vim.keymap.set("n", "<leader>!", "<cmd>q!<cr>", default_opts)
vim.keymap.set("n", "<leader>db", "<cmd>bdelete<cr>", default_opts)

-- Next/Prev Buffer
vim.keymap.set("n", "<C-n>", ":bnext<CR>", default_opts)
vim.keymap.set("n", "<C-p>", ":bprevious<CR>", default_opts)
vim.keymap.set("x", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- Terminal shortcuts
-- Open terminal in new split
vim.keymap.set("n", "<Space><Space>", function()
  vim.cmd("new")
  vim.cmd("terminal")
end, { noremap = true, silent = true })

-- Close terminal
-- when you press esc it will actually exit, it just takes some time...
vim.keymap.set("t", "<Esc>", function()
  -- Close the current buffer if it's a terminal
  if vim.bo.buftype == "terminal" then
    vim.cmd("bdelete!")
  else
    -- Otherwise, just behave as normal escape would
    vim.cmd("stopinsert")
  end
end, { noremap = true, silent = true })

-- Docker container specific 
-- Find the path to zsh and set it as the default shell
local handle = io.popen("which zsh")
local zsh_path = handle:read("*a")
handle:close()

-- Trim any whitespace from the path
zsh_path = zsh_path:match("^%s*(.-)%s*$")

-- Set the shell option in Neovim
vim.o.shell = zsh_path
