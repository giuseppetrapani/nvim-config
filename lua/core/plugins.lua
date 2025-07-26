local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

   use {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	-- or                            , branch = '0.1.x',
  	requires = { {'nvim-lua/plenary.nvim'} }
   }

 -- use { "ellisonleao/gruvbox.nvim" } 

  use { "neovim/nvim-lspconfig" }

  use "windwp/nvim-autopairs"

  use "hrsh7th/nvim-cmp"                  -- Plugin di completamento principale
  use "hrsh7th/cmp-nvim-lsp"              -- Per usare le sorgenti LSP (es. pyright)
  use "L3MON4D3/LuaSnip"                  -- Snippet engine richiesto
  use "saadparwaiz1/cmp_luasnip"          -- Per integrare LuaSnip in cmp

  use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

use({
  "olivercederborg/poimandres.nvim",
  config = function()
  vim.cmd("colorscheme poimandres")
  end,
})


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
