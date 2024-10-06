-- Requiere el plugin notify
vim.notify = require("notify")

local lsp = require('lsp-zero')
local lspkind = require('lspkind')
local cmp = require('cmp')

lsp.preset("recommended")
lsp.setup()

lsp.ensure_installed({
	'tsserver',
    'tsx',
	'eslint',
	'sumeko_lua',
	'phpactor',
    'java'
})
cmp.setup({
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',   -- Muestra íconos y el tipo de sugerencia (function, variable, etc.)
      maxwidth = 100,          -- Limita el ancho de las sugerencias
      ellipsis_char = '...',  -- Mostrar "..." al final si el texto es muy largo
    }),
  },
  -- Aquí va el resto de tu configuración de cmp
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

    sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  }),

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  }

  })

local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({select = true}),
	["<C-Space>"] = cmp.mapping.complete(),
})
require('luasnip.loaders.from_vscode').lazy_load()


-- Función para notificar errores de diagnóstico usando nvim-notify


local function notify_diagnostics(severity, bufnr)
    local diagnostics = vim.diagnostic.get(bufnr, {severity = severity})

    for _, diagnostic in ipairs(diagnostics) do
        local message = string.format("%s [%s]: %s", vim.bo[bufnr].filetype, diagnostic.source, diagnostic.message)
        if severity == vim.diagnostic.severity.ERROR then
            vim.notify(message, vim.log.levels.ERROR) -- Notificar errores
        elseif severity == vim.diagnostic.severity.WARN then
            vim.notify(message, vim.log.levels.WARN) -- Notificar advertencias
        elseif severity == vim.diagnostic.severity.INFO then
            vim.notify(message, vim.log.levels.INFO) -- Notificar Informacion
        elseif severity == vim.diagnostic.severity.HINT then
            vim.notify(message, vim.log.levels.HINT) ---- Notificar Hint 
        end
    end
end

-- Autocomando para mostrar notificaciones al cargar diagnósticos en el buffer
vim.api.nvim_create_autocmd({"BufEnter", "BufWritePost", "DiagnosticChanged"}, {
    callback = function(args)
        notify_diagnostics(vim.diagnostic.severity.ERROR, args.buf)
        notify_diagnostics(vim.diagnostic.severity.WARN,  args.buf)
        notify_diagnostics(vim.diagnostic.severity.INFO,  args.buf)
        notify_diagnostics(vim.diagnostic.severity.HINT,  args.buf)

    end
})


-- Configuramos las teclas de mapeo cuando LSP está adjunto a un buffer

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()


-- Configuración de diagnósticos y uso de notify para mostrar errores
vim.diagnostic.config({
    virtual_text = true, -- Mantener el texto virtual visible
    float = {
        source = "always", -- Mostrar la fuente del diagnóstico
        format = function(diagnostic)
            -- Notificar los diagnósticos al mostrarse en ventana flotante
            vim.notify(diagnostic.message, vim.log.levels.ERROR)
            return diagnostic.message
        end,
    },
    severity_sort = true, -- Ordenar diagnósticos por severidad
})
