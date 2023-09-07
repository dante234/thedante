vim.g.loaded_netwr=1
vim.g.loaded_netwrPlugin = 1

require("nvim-tree").setup({
    view = {
        adaptive_size = true
    },
    actions = {

        open_file = {
            quit_on_open = true
         }
    }
})
