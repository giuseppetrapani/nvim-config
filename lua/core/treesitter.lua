require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "lua", "bash" },  -- linguaggi da installare
  highlight = {
    enable = true,                -- abilita evidenziazione con treesitter
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,                -- indentazione intelligente
  },
  playground = {
    enable = true,                -- opzionale: per debug e visualizzazione AST
  }
}
