  require("obsidian").setup({
      log_level = vim.log.levels.INFO;
      workspaces = {
        {
          name = "===Dante==>",
          path = "/home/cesar/Personal_cesar",
        },
      },
    -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
      completion = {
    -- Set to false to disable completion.
    nvim_cmp = true,
    -- Trigger completion at 2 chars.
    min_chars = 2,
  },

  daily_notes = {
    -- Optional, if you keep daily notes in a separate directory.
    folder = "900-JOURNAL/DIARIO",
    -- Optional, if you want to change the date format for the ID of daily notes.
    date_format = "%Y-%m-%d",
    -- Optional, if you want to change the date format of the default alias of daily notes.
    alias_format = "%B %-d, %Y",
    -- Optional, default tags to add to each new daily note created.
    default_tags = { "daily-notes" },
    -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
    template = "tb.diario.md"
  },

  templates = {
    folder = "901-TEMPLATES",
    date_format = "%Y-%m-%d",
    time_format = "%H:%M",
    -- A map for custom variables, the key should be the variable and the value a function
    substitutions = {},
  },

      note_frontmatter_func = function(note)
      -- This is equivalent to the default frontmatter function.
      local out = { id = note.id, aliases = note.aliases, tags = note.tags }

      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end

  })
