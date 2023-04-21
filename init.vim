source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/vim-plug/plugin-configs/nvim-cmp.vim

source $HOME/.config/nvim/options/keybindings.vim
source $HOME/.config/nvim/options/theme.vim
source $HOME/.config/nvim/options/settings.vim

set completeopt=menu,menuone,noselect


lua << EOF
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

require('lint').linters_by_ft = {
  markdown = {'vale','eslint', 'jshint'}
}

require("nvim-lsp-installer").setup {}

require('lspconfig').tsserver.setup{
  on_attach = function(client, bufnr)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  end
}

require('lspconfig').prismals.setup {}
require('lspconfig').rust_analyzer.setup {}

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true
  }
}

require('lspconfig').vimls.setup{}
EOF

