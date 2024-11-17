vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv",':NvimTreeFindFileToggle<CR>', {silent = true})

vim.keymap.set("v","J",":m '>+1<CR>gv=gv")
vim.keymap.set("v","K",":m '<-2<CR>gv=gv")

vim.keymap.set("n","<leader>t",":ter<CR>>",{silent = true})

------pegar desde el portapapeles-----
vim.keymap.set("n","<C-y>",'"*p')

------seleccionar todo elv texto
vim.keymap.set("n","<leader>A",":keepjumps normal! ggVG<CR>")

-------salid del modo insertar-------
vim.keymap.set("i", "<C-c>", "<Esc>")

--------salir del modo terminal----
vim.keymap.set("t","<C-q>",[[<C-\><C-n>]])

--------New tab----
vim.keymap.set("n","te",':tabedit<CR>',{silent = true})

---split windows
vim.keymap.set("n","ss",":split<Return><C-w>w")
vim.keymap.set("n","sv",":vsplit<Return><C-w>w")

---move window
vim.keymap.set('n','<leader>','<C-w>w')
vim.keymap.set('','sh','<C-w>h')
vim.keymap.set('','sk','<C-w>k')
vim.keymap.set('','sj','<C-w>j')
vim.keymap.set('','sl','<C-w>l')

-----format---
vim.api.nvim_set_keymap("n", "<leader>ff",
    ":lua vim.lsp.buf.format({ async = true })<CR>",
    { noremap = true, silent = true })

----- OBSIDIAN -----
vim.keymap.set(
  "n",
  "<leader>oc",
  "<cmd>lua require('obsidian').util.toggle_checkbox()<CR>",
  { desc = "Obsidian Check Checkbox" }
)
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "Insert Obsidian Template" })
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Show ObsidianBacklinks" })
vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "Show ObsidianLinks" })
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Create New Note" })
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search Obsidian" })
vim.keymap.set("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Quick Switch" })
vim.keymap.set("n", "<leader>od", "<cmd>ObsidianDailies<CR>", {desc = "Crear Nota Diaria "})
