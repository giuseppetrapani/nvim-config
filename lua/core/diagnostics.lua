-- lua/core/diagnostics.lua
--
vim.diagnostic.config({
  virtual_lines = true, -- mostra i messaggi completi sotto la riga
  virtual_text = false, -- disattiva il testo a lato
})

-- Mostra il messaggio dell’errore quando ti fermi sopra
vim.o.updatetime = 250  -- 250ms di attesa prima del CursorHold

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = "rounded",
      source = "always",
      prefix = " ",
      scope = "cursor",
    })
  end,
})
