local status,blankline = pcall(require,'ibl')
    if (not status) then
        return
    end
        vim.opt.listchars:append "space:⋅"
        vim.opt.list = true
       -- vim.opt.listchars:append "eol:↴"
    blankline.setup{
         }
