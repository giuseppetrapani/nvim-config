local lspconfig = require("lspconfig")
local util = require("lspconfig/util")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig.pyright.setup({
  root_dir = function(fname)
    return util.root_pattern("pyproject.toml", "setup.py", ".git")(fname)
      or util.path.dirname(fname)
  end
})
