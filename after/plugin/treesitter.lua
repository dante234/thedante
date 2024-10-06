require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { 
    "c",
    "java",
    "javascript",
    "typescript",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "html",      -- Añadimos soporte para HTML
    "css",       -- Añadimos soporte para CSS
    "python",    -- Añadimos soporte para Python
    "bash",      -- Añadimos soporte para Bash
    "json",      -- Añadimos soporte para JSON
    "yaml"       -- Añadimos soporte para YAML
  },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
   -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
    -- Configuración de plegado de código basada en Tree-sitter
  fold = {
    enable = true,            -- Habilita el plegado basado en Tree-sitter
    disable = {},             -- Puedes deshabilitarlo para lenguajes específicos
    enable_autocmd = false,    -- Desactiva auto comandos para un mejor control
  },

  -- Habilitar la indentación automática
  indent = {
    enable = true,             -- Indentación basada en Tree-sitter
  },

  -- Incluir Rainbow para colores en pares de paréntesis
  rainbow = {
    enable = true,
    extended_mode = true,      -- Habilita colores para otros delimitadores como brackets, etc.
    max_file_lines = nil,      -- No limitar el número de líneas
  },

}
