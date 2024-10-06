
local plugin = "Notificaciones ===)Dante===>"

vim.notify = require("notify")

-- Autocomando para mostrar un mensaje al entrar a Neovim
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.notify("¡Bienvenido a Neovim!, Cesar David Fernandez Avila", vim.log.levels.INFO, {
            title = plugin,
            timeout = 4000,  -- Duración de 3 segundos
            on_close = function()
          vim.notify("JAMAS TE RINDAS", nil, { title = plugin })
        end,
        })
    end
})
