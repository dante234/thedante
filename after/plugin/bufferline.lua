local status,bufferline = pcall (require,"bufferline")
   if(not status)then return
end


-- Verifica que nvim-web-devicons esté instalado para los íconos
local devicons_status, devicons = pcall(require, "nvim-web-devicons")
if not devicons_status then return end


bufferline.setup({
    options = {
        mode = "tabs",                   -- Usar modo de pestañas
        separator_style = "slant",       -- Estilo inclinado para separadores
        always_show_bufferline = true,   -- Siempre mostrar la barra de buffer
        show_buffer_close_icons = false,  -- Mostrar íconos para cerrar pestañas
        show_close_icon = false,         -- No mostrar el ícono de cerrar al final
        color_icons = true,              -- Colorear los íconos
        diagnostics = "nvim_lsp",        -- Mostrar diagnósticos del LSP

            -- Configuración para los íconos
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " " -- Íconos de error o advertencia
            return " " .. icon .. count
        end,
        -- Añadimos los íconos del tipo de archivo
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
    },
    highlights = {
        separator = {
            fg = "#006f61",    -- Naranja vibrante para los separadores
            bg = "#1d1d1d",    -- Fondo oscuro de la barra
        },
        separator_selected = {
            fg = "#ff924f",    -- Melocotón para el separador de la pestaña seleccionada
        },
        separator_visible = {
            fg = "#ff4500",    -- Naranja fuerte para pestañas visibles no seleccionadas
        },
        background = {
            fg = "#657b83",    -- Texto de las pestañas inactivas
            bg = "#002b36",    -- Fondo azul oscuro de las pestañas inactivas
        },
        buffer_selected = {
            fg = "#fdf6e3",    -- Texto claro para la pestaña seleccionada
            bg = "#fb494b",    -- Fondo naranja fuerte para la pestaña seleccionada
            bold = true,       -- Texto en negrita para resaltar la pestaña activa
        },
        buffer_visible = {
            fg = "#93a1a1",    -- Texto gris para las pestañas visibles
            bg = "#002b36",    -- Fondo azul oscuro
        },
        close_button = {
            fg = "#ff6f61",    -- Rojo suave para los botones de cerrar
            bg = "#1d1d1d",    -- Fondo oscuro de los botones de cerrar
        },
        close_button_selected = {
            fg = "#002d2d",    -- Rojo fuerte para el botón de cerrar en la pestaña seleccionada
        },
        fill = {
            bg = "#000000",    -- Fondo de la barra cuando no hay pestañas abiertas
        },
        indicator_selected = {
            fg = "#ff924f",    -- Indicador melocotón en la pestaña seleccionada
            bg = "#ff4500",    -- Fondo coincidente con la pestaña seleccionada
        },
    },
})

vim.keymap.set('n','<Tab>','<Cmd>BufferLineCycleNext<CR>',{})
vim.keymap.set('n','<S-Tab>','<Cmd>BufferLineCyclePrev<CR>',{})
