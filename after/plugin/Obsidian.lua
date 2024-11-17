  require("obsidian").setup({
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
  }
  })
